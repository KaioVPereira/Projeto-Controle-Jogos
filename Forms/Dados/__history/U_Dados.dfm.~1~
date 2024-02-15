object dm_Dados: Tdm_Dados
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 617
  Width = 918
  object fd_Connection: TFDConnection
    Params.Strings = (
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3051'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\SCL\Sistema-Aula-Delphi-Firebird\BANCOAULA.IB'
      'DriverID=FB')
    Connected = True
    Left = 40
    Top = 8
  end
  object FTB_VendasHeader: TFDTable
    Connection = fd_Connection
    UpdateOptions.UpdateTableName = 'VENDAS_HEADER'
    TableName = 'VENDAS_HEADER'
    Left = 40
    Top = 96
  end
  object FTB_VendasItens: TFDTable
    Connection = fd_Connection
    UpdateOptions.UpdateTableName = 'VENDAS_ITENS'
    TableName = 'VENDAS_ITENS'
    Left = 32
    Top = 168
  end
end
