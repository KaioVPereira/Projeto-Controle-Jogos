object dm_Dados: Tdm_Dados
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 617
  Width = 918
  object fd_Connection: TFDConnection
    Params.Strings = (
      'Protocol=TCPIP'
      'Server=SUPORTE3'
      'Port=3051'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\SCL\Projeto-Controle-Jogos\BANCO.IB'
      'DriverID=FB')
    Left = 40
    Top = 8
  end
end
