program win_service;

uses
  Vcl.SvcMgr,
  uService in 'form-service\uService.pas' {ServerService: TService},
  uServer.Router in 'api\uServer.Router.pas',
  uProvider.Connection in 'api\provider\uProvider.Connection.pas' {ProviderConnection: TDataModule},
  uRouters.Pessoas in 'api\routers\uRouters.Pessoas.pas',
  uControllers.Pessoas in 'api\controllers\uControllers.Pessoas.pas' {ControllersPessoa: TDataModule};

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TServerService, ServerService);
  Application.Run;
end.
