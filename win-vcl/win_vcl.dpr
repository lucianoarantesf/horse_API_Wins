program win_vcl;

uses
  Vcl.Forms,
  uServidor in 'forms\uServidor.pas' {Servidor},
  uControllers.Pessoas in 'api\controllers\uControllers.Pessoas.pas' {ControllersPessoa: TDataModule},
  uProvider.Connection in 'api\provider\uProvider.Connection.pas' {ProviderConnection: TDataModule},
  uRouters.Pessoas in 'api\routers\uRouters.Pessoas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServidor, Servidor);
  Application.Run;
end.
