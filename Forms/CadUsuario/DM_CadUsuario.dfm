object DMB_CadUsuario: TDMB_CadUsuario
  OldCreateOrder = True
  Height = 480
  Width = 640
  object Qry_ValidaUser: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT 1 FROM USUARIO'
      'WHERE'
      'USUARIO = :USUARIO')
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
  object Qry_ValidaEmail: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT 1 FROM USUARIO'
      'WHERE'
      'EMAIL = :EMAIL')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
  end
  object Qry_InsereUser: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      
        'INSERT INTO USUARIO ( NICKNAME, USUARIO, SENHA, CONTROLE_USUARIO' +
        ', DT_EXCLUIDO, CARGO, EMAIL, DDD, NUMERO)'
      
        '            VALUES  (:NICKNAME, :USUARIO, :SENHA, GEN_ID(GEN_USU' +
        'ARIO_ID,1), null,  null, :EMAIL , :DDD, :NUMERO)')
    Left = 120
    Top = 72
    ParamData = <
      item
        Name = 'NICKNAME'
        ParamType = ptInput
      end
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'DDD'
        ParamType = ptInput
      end
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end>
  end
  object Qyr_ValidaNick: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT 1 FROM USUARIO'
      ' WHERE '
      ' UPPER(NICKNAME) = UPPER(:NICKNAME)')
    Left = 40
    Top = 80
    ParamData = <
      item
        Name = 'NICKNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 40
        Value = Null
      end>
  end
end
