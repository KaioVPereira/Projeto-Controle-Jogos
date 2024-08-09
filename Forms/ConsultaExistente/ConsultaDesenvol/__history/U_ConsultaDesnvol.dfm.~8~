inherited Frm_ConsultaDesenvol: TFrm_ConsultaDesenvol
  Caption = 'Consulta Desenvolvedora'
  TextHeight = 15
  inherited Panel1: TPanel
    ExplicitWidth = 356
    inherited Btn_Buscar: TButton
      OnClick = Btn_BuscarClick
    end
    inherited txt_Busca: TEdit
      Left = 24
      ExplicitLeft = 24
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
      'SELECT  NOME_DESENVOL AS NOME '
      'FROM DESENVOLVEDORA'
      'ORDER BY NOME_DESENVOL')
    object Qry_BuscaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_DESENVOL'
      Required = True
      Size = 30
    end
  end
end
