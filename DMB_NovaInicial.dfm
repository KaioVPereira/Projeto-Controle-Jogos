object DBM_NewInicial: TDBM_NewInicial
  Height = 480
  Width = 640
  object Qry_Top10: TFDQuery
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      ' SELECT B.nome_jogo, A.nota  FROM jogos_zerados A, jogos B'
      '           WHERE'
      '           A.cod_jogo =  B.controle_jogo AND'
      '           A.cod_usuario = :USUARIO'
      '           ORDER BY A.nota DESC ROWS 10')
    Left = 248
    Top = 120
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object Qry_Top10NOME_JOGO: TStringField
      FieldName = 'NOME_JOGO'
      Origin = 'NOME_JOGO'
      Required = True
      Size = 100
    end
    object Qry_Top10NOTA: TFloatField
      FieldName = 'NOTA'
      Origin = 'NOTA'
    end
  end
  object DS_Top10: TDataSource
    Left = 312
    Top = 120
  end
end
