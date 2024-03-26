object DMB_Login: TDMB_Login
  OldCreateOrder = True
  Height = 480
  Width = 640
  object fd_QueryLogin: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT USUARIO,'
      '       SENHA '
      'FROM USUARIO'
      'WHERE USUARIO = :LOGIN')
    Left = 552
    Top = 408
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
  end
end
