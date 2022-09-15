unit uControllers.Pessoas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, uProvider.Connection;

type
  TControllersPessoa = class(TDataModule)
    qryConsPessoas: TFDQuery;
    qryInserePessoa: TFDCommand;
    qryUpdatePessoa: TFDCommand;
    qryDeletePessoa: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    FProvider: TProviderConnection;
  end;

var
  ControllersPessoa: TControllersPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TControllersPessoa.DataModuleCreate(Sender: TObject);
begin
  FProvider := TProviderConnection.Create(Nil);
  FProvider.dbsConnection.Connected := True;
  qryConsPessoas.Connection := FProvider.dbsConnection;
  qryInserePessoa.Connection := FProvider.dbsConnection;
  qryUpdatePessoa.Connection := FProvider.dbsConnection;
  qryDeletePessoa.Connection := FProvider.dbsConnection;
end;

procedure TControllersPessoa.DataModuleDestroy(Sender: TObject);
begin
  FProvider.DisposeOf;
end;

end.
