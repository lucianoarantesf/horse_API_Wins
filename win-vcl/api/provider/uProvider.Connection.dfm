object ProviderConnection: TProviderConnection
  OldCreateOrder = False
  Height = 114
  Width = 260
  object dbsConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Avecom\OneDrive\Servidores_Horse\database\data' +
        'base.s3db'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = dbsConnectionBeforeConnect
    Left = 48
    Top = 24
  end
  object FDSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 176
    Top = 24
  end
end
