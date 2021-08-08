object dmTmpConexao: TdmTmpConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object database: TSDDatabase
    LoginPrompt = False
    DatabaseName = 'database'
    Params.Strings = (
      'USER NAME=next'
      'PASSWORD=a28c03m74')
    RemoteDatabase = 'localhost:genesis'
    ServerType = stPostgreSQL
    SessionName = 'Default'
    BeforeDisconnect = databaseBeforeDisconnect
    Left = 40
    Top = 16
  end
  object QGeraCodigo: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao_2'
    Left = 176
    Top = 16
  end
  object QTemp: TSDQuery
    DatabaseName = 'genesis'
    Options = []
    SessionName = 'Sessao_2'
    Left = 256
    Top = 16
  end
end
