unit uServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Horse, Horse.BasicAuthentication, Horse.Compression, Horse.Jhonson,
  Vcl.Imaging.pngimage;

type
  TServidor = class(TForm)
    edtPorta: TEdit;
    Image1: TImage;
    btnStartStop: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
  private
    FIsRun: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property IsRun : Boolean read FIsRun write FIsRun;
  end;

var
  Servidor: TServidor;

implementation

uses uRouters.Pessoas;

const
  user = 'Admin';
  pass = '@Password';

{$R *.dfm}

procedure TServidor.btnStartStopClick(Sender: TObject);
begin
 if FIsRun then
 begin
  FIsRun := False;
  THorse.OnStopListen;
  THorse.StopListen;
  TButton(Sender).Caption := 'Start Server';
  edtPorta.Enabled := True;
 end
 else
 begin
  FIsRun := True;
  THorse.Listen(StrToInt(edtPorta.Text));
  THorse.OnListen;
  TButton(Sender).Caption := 'Stop Server';
  edtPorta.Enabled := False;
 end;


end;

procedure TServidor.FormCreate(Sender: TObject);
begin
   //declarando o midwares que vamos usar no horse
   THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      Result := AUsername.Equals(user) and APassword.Equals(pass);
    end)).Use(Compression()).Use(Jhonson);

   //listando as rotas
   TRoutersPessoas.onRegistry;



   FIsRun := False;
end;

end.
