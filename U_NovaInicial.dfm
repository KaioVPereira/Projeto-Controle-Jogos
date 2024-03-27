object Frm_NewInicial: TFrm_NewInicial
  Left = 0
  Top = 0
  Caption = 'Inicial'
  ClientHeight = 702
  ClientWidth = 1348
  Color = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 665
    Width = 1348
    Height = 37
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 664
    ExplicitWidth = 1344
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1348
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 1344
    object Label1: TLabel
      Left = 22
      Top = 8
      Width = 187
      Height = 37
      AutoSize = False
      Caption = 'DASHBOARD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -27
      Font.Name = 'Bahnschrift SemiLight'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ATUALIZAR: TButton
      Left = 1192
      Top = 15
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'ATUALIZAR'
      TabOrder = 0
      OnClick = ATUALIZARClick
    end
  end
  object Pn_Fundo: TPanel
    Left = 0
    Top = 57
    Width = 1348
    Height = 608
    Align = alClient
    Color = clPurple
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 1344
    ExplicitHeight = 607
    object Panel3: TPanel
      Left = 40
      Top = 56
      Width = 321
      Height = 305
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 319
        Height = 33
        Align = alTop
        Caption = 'SEU TOP 10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -20
        Font.Name = 'Bahnschrift SemiCondensed'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 32
        Width = 320
        Height = 273
        Color = clHotLight
        DataSource = DS_Top10
        GradientEndColor = clBlue
        GradientStartColor = clFuchsia
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 8
    object Cadastro: TMenuItem
      Caption = 'Cadastros'
      object N1: TMenuItem
        Caption = 'Jogo'
        OnClick = N1Click
      end
      object Plataforma1: TMenuItem
        Caption = 'Plataforma'
      end
      object Desenvolvedora1: TMenuItem
        Caption = 'Desenvolvedora'
      end
      object Categoria1: TMenuItem
        Caption = 'Categoria'
      end
    end
    object Categoria2: TMenuItem
      Caption = 'Seus Jogos'
      object JogosJogados1: TMenuItem
        Caption = 'Joguei'
      end
      object Jogosparajogar1: TMenuItem
        Caption = 'Vou jogar'
      end
      object Desistiudejogar1: TMenuItem
        Caption = 'Desisti de jogar'
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object JogosJogados2: TMenuItem
        Caption = 'Jogos que Joguei'
        OnClick = JogosJogados2Click
      end
    end
  end
  object Qry_Top10: TFDQuery
    Active = True
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      ' SELECT B.nome_jogo, A.nota  FROM jogos_zerados A, jogos B'
      '           WHERE'
      '           A.cod_jogo =  B.controle_jogo AND'
      '           A.cod_usuario = :USUARIO'
      '           ORDER BY A.nota DESC ROWS 10')
    Left = 376
    Top = 8
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object Qry_Top10NOME_JOGO: TStringField
      DisplayLabel = 'NOME DO JOGO'
      DisplayWidth = 37
      FieldName = 'NOME_JOGO'
      Origin = 'NOME_JOGO'
      Required = True
      Size = 30
    end
    object Qry_Top10NOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'NOTA'
      Origin = 'NOTA'
    end
  end
  object DS_Top10: TDataSource
    DataSet = Qry_Top10
    Left = 432
    Top = 8
  end
end
