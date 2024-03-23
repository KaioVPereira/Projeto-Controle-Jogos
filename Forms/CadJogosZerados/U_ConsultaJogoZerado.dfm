inherited Frm_ConsultaJogoZerar: TFrm_ConsultaJogoZerar
  Caption = 'Consultar Jogos'
  TextHeight = 15
  inherited Panel1: TPanel
    ExplicitWidth = 624
  end
  inherited Panel2: TPanel
    ExplicitWidth = 624
    inherited DBGrid1: TDBGrid
      OnDblClick = DBGrid1DblClick
    end
  end
  inherited Qry_Busca: TFDQuery
    SQL.Strings = (
      ' select j.Controle_Jogo as CODIGO,'
      '        J.nome_jogo AS NOME,'
      '        C.controle_cat as CODIGO_CATEOGORIA,'
      '        C.nome_categoria AS CATEGORIA,'
      '        D.controle_desen AS CODIGO_DESENVOLEDORA,'
      '        D.nome_desenvol AS DESENVOLVEDORA'
      'FROM jogos J, DESENVOLVEDORA D, CATEGORIA_TIPO C'
      'WHERE'
      '    J.cod_categoria = C.controle_cat AND'
      '    J.cod_desenvolvedora = D.controle_desen'
      'ORDER BY J.nome_jogo')
    object Qry_BuscaNOME: TStringField
      DisplayWidth = 32
      FieldName = 'NOME'
      Origin = 'NOME_JOGO'
      Required = True
      Size = 50
    end
    object Qry_BuscaCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 27
      FieldName = 'CATEGORIA'
      Origin = 'NOME_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Qry_BuscaDESENVOLVEDORA: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 30
      FieldName = 'DESENVOLVEDORA'
      Origin = 'NOME_DESENVOL'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object Qry_BuscaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTROLE_JOGO'
      ReadOnly = True
      Required = True
    end
    object Qry_BuscaCODIGO_CATEOGORIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_CATEOGORIA'
      Origin = 'CONTROLE_CAT'
      ProviderFlags = []
      ReadOnly = True
    end
    object Qry_BuscaCODIGO_DESENVOLEDORA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_DESENVOLEDORA'
      Origin = 'CONTROLE_DESEN'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
