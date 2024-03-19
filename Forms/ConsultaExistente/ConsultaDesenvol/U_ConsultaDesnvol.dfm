inherited Frm_ConsultaDesenvol: TFrm_ConsultaDesenvol
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Desenvolvedora'
  ClientHeight = 309
  ClientWidth = 360
  Position = poScreenCenter
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 360
    ExplicitWidth = 346
    inherited Btn_Buscar: TButton
      Left = 224
      OnClick = Btn_BuscarClick
      ExplicitLeft = 224
    end
    inherited txt_Busca: TEdit
      Left = 24
      ExplicitLeft = 24
    end
  end
  inherited Panel2: TPanel
    Width = 360
    Height = 260
    ExplicitLeft = 0
    ExplicitTop = 49
    ExplicitWidth = 346
    ExplicitHeight = 227
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
