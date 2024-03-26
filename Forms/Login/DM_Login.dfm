object DMB_Login: TDMB_Login
  Height = 480
  Width = 640
  object fd_QueryLogin: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT  USUARIO,SENHA, CONTROLE_USUARIO'
      'FROM USUARIO'
      'WHERE USUARIO = :LOGIN')
    Left = 496
    Top = 376
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object fd_QueryLoginUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
    end
    object fd_QueryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 255
    end
    object fd_QueryLoginCONTROLE_USUARIO: TIntegerField
      FieldName = 'CONTROLE_USUARIO'
      Origin = 'CONTROLE_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
