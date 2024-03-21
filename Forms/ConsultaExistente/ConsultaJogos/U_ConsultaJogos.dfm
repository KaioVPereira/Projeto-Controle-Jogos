inherited Frm_ConsultaJogos: TFrm_ConsultaJogos
  Caption = 'Consulta Jogos'
  ClientWidth = 628
  ExplicitWidth = 640
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 628
    ExplicitWidth = 356
    inherited Btn_Buscar: TButton
      Left = 424
      OnClick = Btn_BuscarClick
      ExplicitLeft = 424
    end
    inherited txt_Busca: TEdit
      Left = 17
      Width = 368
      ExplicitLeft = 17
      ExplicitWidth = 368
    end
  end
  inherited Panel2: TPanel
    Width = 628
    ExplicitWidth = 356
    ExplicitHeight = 259
    inherited DBGrid1: TDBGrid
      Width = 626
    end
  end
  inherited Qry_Busca: TFDQuery
    Active = True
    SQL.Strings = (
      
        ' select J.nome_jogo AS NOME, C.nome_categoria AS CATEGORIA, D.no' +
        'me_desenvol AS DESENVOLVEDORA'
      'FROM jogos J, DESENVOLVEDORA D, CATEGORIA_TIPO C'
      'WHERE'
      '    J.cod_categoria = C.controle_cat AND'
      '    J.cod_desenvolvedora = D.controle_desen'
      'ORDER BY J.nome_jogo')
    Left = 584
    Top = 1
  end
  inherited Ds_Consulta: TDataSource
    Left = 584
    Top = 64
  end
end
