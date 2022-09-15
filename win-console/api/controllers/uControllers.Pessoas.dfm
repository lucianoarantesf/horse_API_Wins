object ControllersPessoa: TControllersPessoa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 224
  Width = 290
  object qryConsPessoas: TFDQuery
    Connection = ProviderConnection.dbsConnection
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    Left = 88
    Top = 56
  end
  object qryInserePessoa: TFDCommand
    Left = 186
    Top = 56
  end
  object qryUpdatePessoa: TFDCommand
    Left = 186
    Top = 104
  end
  object qryDeletePessoa: TFDCommand
    Left = 186
    Top = 8
  end
end
