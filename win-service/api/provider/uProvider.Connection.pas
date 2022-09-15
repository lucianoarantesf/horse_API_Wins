unit uProvider.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TProviderConnection = class(TDataModule)
    dbsConnection: TFDConnection;
    FDSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    procedure dbsConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProviderConnection: TProviderConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TProviderConnection.dbsConnectionBeforeConnect(Sender: TObject);
begin
  dbsConnection.Params.Values['DataBase'] :=
    Format('%s%s\%s', [ExtractFilePath(ParamStr(0)), 'database',
    'database.s3db']);
end;

end.
