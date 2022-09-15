program win_vcl;

uses
  Vcl.Forms,
  uServidor in 'uServidor.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
