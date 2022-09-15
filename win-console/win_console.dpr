program win_console;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Compression,
  Horse.BasicAuthentication,
  Horse.Jhonson,
  uRouters.Pessoa in 'api\routers\uRouters.Pessoa.pas';

const
  user = 'Admin';
  pass = '@Password';

function onAuth(const aUser, aPass: String): Boolean;
begin
  Result := aUser.Equals(user) and aPass.Equals(pass);
end;

procedure OnListen(Horse: THorse);
begin
  Writeln('API Win Console - is running');
  Writeln('Horse Version:   ' + Horse.Version);
end;

begin
  try
    THorse.Use(HorseBasicAuthentication(onAuth)).Use(Compression())
      .Use(Jhonson);

    TRoutersPessoas.onRegistry;

    THorse.Listen(9000, OnListen);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
