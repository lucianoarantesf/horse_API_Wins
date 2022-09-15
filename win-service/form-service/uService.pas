unit uService;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  uServer.Router;

type
  TServerService = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ServerService: TServerService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServerService.Controller(CtrlCode);
end;

function TServerService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TServerService.ServiceCreate(Sender: TObject);
begin
 TServerRouter.onRegistry;
end;

procedure TServerService.ServiceStart(Sender: TService; var Started: Boolean);
begin
 TServerRouter.onStart;
end;

procedure TServerService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
 TServerRouter.onStop;
end;

end.
