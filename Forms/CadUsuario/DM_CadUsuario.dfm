object DMB_CadUsuario: TDMB_CadUsuario
  Height = 480
  Width = 640
  object Qry_ValidaUser: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT 1 FROM USUARIO'
      'WHERE'
      'NOME = :USUARIO')
    Left = 40
    Top = 16
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
        Value = Null
      end>
  end
end
