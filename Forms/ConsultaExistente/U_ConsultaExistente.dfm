object Frm_ConsultaExistente: TFrm_ConsultaExistente
  Left = 0
  Top = 0
  Caption = 'Consulta Cadastro Existente'
  ClientHeight = 309
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 479
    object Btn_Buscar: TButton
      Left = 8
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 0
    end
    object txt_Busca: TEdit
      Left = 120
      Top = 14
      Width = 169
      Height = 23
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 360
    Height = 260
    Align = alClient
    Caption = 'Pn_AllClient'
    TabOrder = 1
    ExplicitLeft = 120
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 358
      Height = 258
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Qry_Busca: TFDQuery
    Left = 320
    Top = 9
  end
  object Ds_Consulta: TDataSource
    DataSet = Qry_Busca
    Left = 320
    Top = 72
  end
end
