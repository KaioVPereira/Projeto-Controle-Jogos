object Frm_MeusJogos: TFrm_MeusJogos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Meus Jogos'
  ClientHeight = 438
  ClientWidth = 1064
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1064
    Height = 57
    Align = alTop
    Color = clPurple
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object Button1: TButton
      Left = 440
      Top = 17
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 855
      Top = 17
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 960
      Top = 17
      Width = 75
      Height = 25
      Caption = 'CADASTRAR'
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 18
      Width = 132
      Height = 23
      TabOrder = 3
      Items.Strings = (
        ''
        'NOME'
        'PLATAFORMA'
        'DESENVOLVEDORA'
        'CATEGORIA')
    end
    object Edit1: TEdit
      Left = 154
      Top = 18
      Width = 280
      Height = 23
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 1064
    Height = 381
    Align = alClient
    DataSource = DS_BuscaMeusJogos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Qry_BuscaMeusJogos: TFDQuery
    Active = True
    Connection = dm_Dados.fd_Connection
    SQL.Strings = (
      
        'SELECT B.nome_jogo,C.nome_desenvol,D.nome_categoria, E.NOME_PLAT' +
        ','
      '        A.nota AS SUA_NOTA, B.nota_metacritc_criticos,'
      '         B.nota_metacritc_usuarios, A.data_zerado'
      'FROM JOGOS_ZERADOS A INNER JOIN JOGOS B ON'
      '        A.cod_jogo = B.controle_jogo'
      'inner JOIN desenvolvedora C ON'
      '        B.cod_desenvolvedora = C.controle_desen'
      'INNER join CATEGORIA_TIPO D ON'
      '        B.cod_categoria = D.controle_cat'
      'INNER JOIN PLATAFORMA E ON'
      '        A.cod_plataforma = E.controle_plat'
      '        where A.cod_usuario = :USUARIO'
      '        ORDER BY A.data_zerado DESC')
    Left = 536
    Top = 152
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object Qry_BuscaMeusJogosNOME_JOGO: TStringField
      DisplayLabel = 'NOME'
      FieldName = 'NOME_JOGO'
      Origin = 'NOME_JOGO'
      Required = True
      Size = 100
    end
    object Qry_BuscaMeusJogosNOME_DESENVOL: TStringField
      DisplayLabel = 'DESENVOLVEDORA'
      FieldName = 'NOME_DESENVOL'
      Origin = 'NOME_DESENVOL'
      Required = True
      Size = 100
    end
    object Qry_BuscaMeusJogosNOME_CATEGORIA: TStringField
      DisplayLabel = 'CATEGORIA'
      FieldName = 'NOME_CATEGORIA'
      Origin = 'NOME_CATEGORIA'
      Required = True
      Size = 100
    end
    object Qry_BuscaMeusJogosNOME_PLAT: TStringField
      DisplayLabel = 'PLATAFORMA'
      FieldName = 'NOME_PLAT'
      Origin = 'NOME_PLAT'
      Required = True
      Size = 60
    end
    object Qry_BuscaMeusJogosSUA_NOTA: TFloatField
      DisplayLabel = 'MINHA NOTA'
      FieldName = 'SUA_NOTA'
      Origin = 'SUA_NOTA'
    end
    object Qry_BuscaMeusJogosNOTA_METACRITC_CRITICOS: TFloatField
      DisplayLabel = 'NOTA CR'#205'TICOS'
      FieldName = 'NOTA_METACRITC_CRITICOS'
      Origin = 'NOTA_METACRITC_CRITICOS'
    end
    object Qry_BuscaMeusJogosNOTA_METACRITC_USUARIOS: TFloatField
      DisplayLabel = 'NOTA USU'#193'RIOS'
      FieldName = 'NOTA_METACRITC_USUARIOS'
      Origin = 'NOTA_METACRITC_USUARIOS'
    end
    object Qry_BuscaMeusJogosDATA_ZERADO: TDateField
      DisplayLabel = 'DATA'
      FieldName = 'DATA_ZERADO'
      Origin = 'DATA_ZERADO'
    end
  end
  object DS_BuscaMeusJogos: TDataSource
    DataSet = Qry_BuscaMeusJogos
    Left = 320
    Top = 232
  end
end
