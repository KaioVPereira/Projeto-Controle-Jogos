unit U_CadJogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, U_Dados, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, U_Biblioteca, MSHTML, ActiveX,SHDocVw, ShellAPI,
  Vcl.Buttons, U_CadDesenvolvedora, U_CadPlataforma, U_CadTipoCat ;

type
  TFrm_CadJogos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    LB_Consulta: TLabel;
    LB_ValidaJogo: TLabel;
    txt_NomeJogo: TEdit;
    Qry_Desenvol: TFDQuery;
    Qry_Categoria: TFDQuery;
    DS_Desenvolvedora: TDataSource;
    Qry_DesenvolCODIGO: TIntegerField;
    Qry_DesenvolNOME: TStringField;
    cb_Categoria: TDBLookupComboBox;
    cb_Desenvol: TDBLookupComboBox;
    Qry_CadJogos: TFDQuery;
    DS_CadJogos: TDataSource;
    DS_Categoria: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    txt_NotaPopular: TEdit;
    txt_NotaCriticos: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Qry_ValidaJogos: TFDQuery;
    Button3: TButton;
    LB_ConsultaJogos: TLabel;
    Btn_BuscaMetacritc: TSpeedButton;
    Btn_CadCategoria: TSpeedButton;
    Btn_CadDesenvol: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txt_NotaCriticosExit(Sender: TObject);
    procedure txt_NotaPopularExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure txt_NomeJogoChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LB_ConsultaMouseEnter(Sender: TObject);
    procedure LB_ConsultaMouseLeave(Sender: TObject);
    procedure LB_ConsultaJogosMouseEnter(Sender: TObject);
    procedure LB_ConsultaJogosMouseLeave(Sender: TObject);
    procedure LB_ConsultaJogosClick(Sender: TObject);
    procedure Btn_BuscaMetacritcClick(Sender: TObject);
    procedure Btn_CadCategoriaClick(Sender: TObject);
    procedure Btn_CadDesenvolClick(Sender: TObject);
    procedure cb_CategoriaEnter(Sender: TObject);
    procedure cb_DesenvolEnter(Sender: TObject);
    procedure LB_ConsultaClick(Sender: TObject);
  private
     function ValidaJogo (Query : TFDQuery ; Texto:String): Boolean;
     procedure ExtrairInformacoesDaPagina(const PaginaHTML: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadJogos: TFrm_CadJogos;

implementation

{$R *.dfm}

uses U_ConsultaJogos;

procedure TFrm_CadJogos.Btn_BuscaMetacritcClick(Sender: TObject);
VAR URL,jogo :string;
begin
   jogo := txt_NomeJogo.Text;

  jogo := StringReplace(Jogo, ' ', '%20', [rfReplaceAll, rfIgnoreCase]);
  // Defina a URL que você deseja abrir
  if txt_NomeJogo.Text <> '' then
  begin
    URL := 'http://www.MetaCritic.com/search/' + jogo;
  end
  else
  begin
    URL := 'http://www.MetaCritic.com'
  end;


  // Abrir o navegador padrão com a URL especificada
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrm_CadJogos.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_CadJogos.Button2Click(Sender: TObject);
begin
if txt_NomeJogo.Text <> '' then
begin
  if ValidaJogo(Qry_ValidaJogos, txt_NomeJogo.Text) then
    begin
      Qry_CadJogos.ParamByName('NOMEJOGO').Value := txt_NomeJogo.Text;
      Qry_CadJogos.ParamByName('COD_CATEGORIA').Value := cb_Categoria.KeyValue;
      Qry_CadJogos.ParamByName('COD_DESENVOLVEDORA').Value := cb_Desenvol.KeyValue;
      Qry_CadJogos.ParamByName('NOTACRITICOS').Value := txt_NotaCriticos.Text;
      Qry_CadJogos.ParamByName('NOTAPOPULAR').Value := txt_NotaPopular.Text;
      Qry_CadJogos.ExecSQL;
      if not  ValidaJogo(Qry_ValidaJogos, txt_NomeJogo.Text) then
      begin
        MsgInformacao('Jogo cadastrada sucesso');
        txt_NomeJogo.Clear;
        txt_NotaPopular.Clear;
        txt_NotaCriticos.Clear;
        cb_Categoria.KeyValue := NULL;
        cb_Desenvol.KeyValue := NULL;
      end
      else
      begin
        MsgAtencao('Ocorreu algum erro para efeutar o cadastro, tente novamente')
      end;
    end
    else
    begin
      MsgAtencao('Jogo já cadastrado anteriormente')
    end;
  end
  else
  begin
    MsgAtencao('O nome do jogo não pode ser em branco')
end;

end;

procedure TFrm_CadJogos.Button3Click(Sender: TObject);
begin
  ExtrairInformacoesDaPagina('http://www.METACRITIC.COM')
end;

procedure TFrm_CadJogos.cb_CategoriaEnter(Sender: TObject);
begin
  Qry_Categoria.Close;
  Qry_Categoria.Open();
end;

procedure TFrm_CadJogos.cb_DesenvolEnter(Sender: TObject);
begin
  Qry_Desenvol.Close;
  Qry_Desenvol.Open();
end;

procedure TFrm_CadJogos.ExtrairInformacoesDaPagina(const PaginaHTML: string);
var
  WebBrowser: TWebBrowser;
  HTMLDocument: IHTMLDocument2;
  ElementoJogo: IHTMLElement;
  NomeJogo: string;
begin
  WebBrowser := TWebBrowser.Create(nil);
  try
    WebBrowser.Navigate(PaginaHTML);
    while WebBrowser.ReadyState <> READYSTATE_COMPLETE do
      Application.ProcessMessages;

    HTMLDocument := WebBrowser.Document as IHTMLDocument2;

    // Aqui você pode procurar pelo elemento que contém o nome do jogo
    // Suponha que o nome do jogo esteja em um elemento com a classe CSS 'nome-do-jogo'
   { ElementoJogo := HTMLDocument.getElementById('nome-do-jogo');
    if Assigned(ElementoJogo) then
    begin
      NomeJogo := ElementoJogo.innerText;
      ShowMessage('Nome do jogo: ' + NomeJogo);
    end
    else
      ShowMessage('Nome do jogo não encontrado na página.');}

  finally
    WebBrowser.Free;
  end;
end;


procedure TFrm_CadJogos.txt_NotaPopularExit(Sender: TObject);
var
Text: string;
Value: Double;

begin
  // Salva o texto atual do TDEdit
  Text := txt_NotaPopular.Text;

  // Remove qualquer caractere que não seja dígito ou vírgula
  Text := StringReplace(Text, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  Text := StringReplace(Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  // Verifica se o texto é um número válido
  if TryStrToFloat(Text, Value) then
  begin
    // Formata o número no formato desejado
    Text := FormatFloat('0.00', Value);
  end
  else
  begin
    // Se não for um número válido, define o texto como vazio
    Text := '';
  end;

  // Atualiza o texto do TDEdit
  txt_NotaPopular.Text := Text;

  // Define o cursor para o final do texto
  txt_NotaPopular.SelStart := Length(Text);
end;

function TFrm_CadJogos.ValidaJogo(Query: TFDQuery; Texto: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('NOMEJOGO').AsString := Texto;
  Query.Open();
  Result := Query.Eof;
  Query.Close;
end;

procedure TFrm_CadJogos.FormCreate(Sender: TObject);
begin
  Qry_Desenvol.Open();
end;



procedure TFrm_CadJogos.LB_ConsultaClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_ConsultaJogos, Frm_ConsultaJogos);
end;

procedure TFrm_CadJogos.LB_ConsultaJogosClick(Sender: TObject);
var
  URL,jogo: string;
begin

  jogo := txt_NomeJogo.Text;

  jogo := StringReplace(Jogo, ' ', '%20', [rfReplaceAll, rfIgnoreCase]);
  // Defina a URL que você deseja abrir
  if txt_NomeJogo.Text <> '' then
  begin
    URL := 'http://www.MetaCritic.com/search/' + jogo;
  end
  else
  begin
    URL := 'http://www.MetaCritic.com'
  end;


  // Abrir o navegador padrão com a URL especificada
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrm_CadJogos.LB_ConsultaJogosMouseEnter(Sender: TObject);
begin
  LB_ConsultaJogos.Font.Color := clHighlight;
  LB_ConsultaJogos.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_CadJogos.LB_ConsultaJogosMouseLeave(Sender: TObject);
begin
  LB_ConsultaJogos.Font.Color := clHighlightText;
  LB_Consultajogos.Font.Style := [fsItalic];
end;

procedure TFrm_CadJogos.LB_ConsultaMouseEnter(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlight;
  LB_Consulta.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_CadJogos.LB_ConsultaMouseLeave(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlightText;
  LB_Consulta.Font.Style := [fsItalic];
end;

procedure TFrm_CadJogos.Btn_CadCategoriaClick(Sender: TObject);
begin
  txt_NomeJogo.SetFocus;
  AbreFormShowModal(TFrm_CadTipoCat, Frm_CadTipoCat);

end;

procedure TFrm_CadJogos.Btn_CadDesenvolClick(Sender: TObject);
begin

  txt_NomeJogo.SetFocus;
  AbreFormShowModal(TFrm_CadDesenv, Frm_CadDesenv);
end;

procedure TFrm_CadJogos.txt_NomeJogoChange(Sender: TObject);
begin
  if txt_Nomejogo.Text <> '' then
  begin
    if NOT Validajogo (Qry_ValidaJogos, txt_NomeJogo.Text) then
      begin
      LB_ValidaJogo.Visible := True;
      end
    else
      begin
      LB_ValidaJogo.Visible := False;
      end;
  end
  else
  begin
    LB_ValidaJogo.Visible := False;
  end;
end;

procedure TFrm_CadJogos.txt_NotaCriticosExit(Sender: TObject);
 var
Text: string;
Value: Double;

begin
  // Salva o texto atual do TDEdit
  Text := txt_NotaCriticos.Text;

  // Remove qualquer caractere que não seja dígito ou vírgula
  Text := StringReplace(Text, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  Text := StringReplace(Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  // Verifica se o texto é um número válido
  if TryStrToFloat(Text, Value) then
  begin
    // Formata o número no formato desejado
    Text := FormatFloat('0.00', Value);
  end
  else
  begin
    // Se não for um número válido, define o texto como vazio
    Text := '';
  end;

  // Atualiza o texto do TDEdit
  txt_NotaCriticos.Text := Text;

  // Define o cursor para o final do texto
  txt_NotaCriticos.SelStart := Length(Text);
end;

end.
