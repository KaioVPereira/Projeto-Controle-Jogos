inherited Frm_ConsultaCategoria: TFrm_ConsultaCategoria
  Caption = 'Consulta Plataforma'
  TextHeight = 15
  inherited Panel1: TPanel
    ExplicitWidth = 356
    inherited Btn_Buscar: TButton
      OnClick = Btn_BuscarClick
    end
    inherited txt_Busca: TEdit
      Left = 16
      ExplicitLeft = 16
    end
  end
  inherited Panel2: TPanel
    ExplicitWidth = 356
    ExplicitHeight = 259
    inherited DBGrid1: TDBGrid
      DataSource = Ds_Consulta
    end
  end
  inherited Qry_Busca: TFDQuery
    Active = True
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      'SELECT NOME_CATEGORIA AS NOME '
      'FROM CATEGORIA_TIPO'
      'ORDER BY NOME_CATEGORIA')
    object Qry_BuscaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_CATEGORIA'
      Required = True
    end
  end
end
