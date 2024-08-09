inherited Frm_ConsultaPlat: TFrm_ConsultaPlat
  Caption = 'Consulta Plataforma'
  TextHeight = 15
  inherited Panel1: TPanel
    inherited Btn_Buscar: TButton
      OnClick = Btn_BuscarClick
    end
  end
  inherited Qry_Busca: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT NOME_PLAT AS NOME FROM PLATAFORMA'
      'ORDER BY NOME_PLAT ')
  end
end
