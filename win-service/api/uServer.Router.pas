unit uServer.Router;

interface

uses System.SysUtils, System.Classes,
  Horse,
  Horse.Compression,
  Horse.Jhonson,
  Horse.BasicAuthentication;

type
  TServerRouter = class
  private
  public
    class procedure onRegistry;
    class procedure onStart;
    class procedure onStop;
  end;

implementation

uses uRouters.Pessoas;

const
  user = 'Admin';
  pass = '@Password';

{ TServerRouter }

class procedure TServerRouter.onRegistry;
begin
   //declarando o midwares que vamos usar no horse
   THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      Result := AUsername.Equals(user) and APassword.Equals(pass);
    end)).Use(Compression()).Use(Jhonson);

   //listando as rotas
   TRoutersPessoas.onRegistry;

end;

class procedure TServerRouter.onStart;
begin
  Thorse.Listen(9000);
end;

class procedure TServerRouter.onStop;
begin
 THorse.StopListen;
end;

end.
