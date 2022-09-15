unit uRouters.Pessoas;

interface

uses System.SysUtils, System.Classes,
  Horse, Jsons, DataSet.Serialize,uControllers.Pessoas;

type
  TRoutersPessoas = class
  private
  public
    class procedure onRegistry;
  end;

implementation


{ TControllerPessoas }

procedure GetPessoa(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  lControllersPessoa: TControllersPessoa;
  lJsonObject: TJsonObject;
begin
  lControllersPessoa := TControllersPessoa.Create(Nil);
  lJsonObject := TJsonObject.Create(Nil);
  try
    try
      lControllersPessoa.qryConsPessoas.Close;
      lControllersPessoa.qryConsPessoas.SQL.Clear;
      lControllersPessoa.qryConsPessoas.SQL.Add
        ('SELECT * FROM PESSOA WHERE 1 = 1');
      if Req.Query.ContainsKey('ID') then
      begin
        lControllersPessoa.qryConsPessoas.SQL.Add('AND ID = :ID ');
        lControllersPessoa.qryConsPessoas.ParamByName('ID').AsInteger :=
          Req.Query.Field('ID').AsInteger;
      end;

      lControllersPessoa.qryConsPessoas.Open;

      Res.ContentType('application/json')
        .Send(lControllersPessoa.qryConsPessoas.ToJSONArrayString).Status(200);

    except
      on E: Exception do
      begin
        lJsonObject.Clear;
        lJsonObject.Put('ERROR', E.Message);
        Res.ContentType('application/json').Send(lJsonObject.Stringify)
          .Status(500);
      end;

    end;
  finally
    lControllersPessoa.DisposeOf;
    lJsonObject.DisposeOf;
  end;
end;

class procedure TRoutersPessoas.onRegistry;
begin
  THorse.Get('pessoa', GetPessoa);
end;

end.
