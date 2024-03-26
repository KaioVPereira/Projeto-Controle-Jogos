unit U_CadJogoZerado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFrm_JogosZerados = class(TForm)
    Image1: TImage;
    txt_BuscarZerado: TEdit;
    Btn_Buscar: TBitBtn;
    Panel1: TPanel;
    txt_Desenvol: TEdit;
    txt_Categoria: TEdit;
    CB_Plat: TDBLookupComboBox;
    CB_Platina: TComboBox;
    txt_nota: TEdit;
    txt_horas: TEdit;
    MM_OBS: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Qry_BuscaPlat: TFDQuery;
    DS_BuscaPlat: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Btn_CadPlat: TSpeedButton;
    Qry_InsereJZ: TFDQuery;
    DT_Date: TDateTimePicker;
    Label9: TLabel;
    qry_QtdLinhas: TFDQuery;
    procedure Btn_BuscarClick(Sender: TObject);
    procedure txt_notaExit(Sender: TObject);
    procedure CB_PlatEnter(Sender: TObject);
    procedure Btn_CadPlatClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Gravar;
    { Private declarations }
  public
    procedure BuscaValorGrid (const nome : String);
    var CodigoJogo, CodigoDesenvol,CodigoCat, qtd_linhas : Integer;
        Platina : STRING ;
    { Public declarations }
  end;

var
  Frm_JogosZerados: TFrm_JogosZerados;

implementation

{$R *.dfm}

uses U_Biblioteca, U_ConsultaJogoZerado, U_Dados, U_CadPlataforma;

procedure TFrm_JogosZerados.Btn_BuscarClick(Sender: TObject);
begin
  Frm_ConsultaJogoZerar := TFrm_ConsultaJogoZerar.Create(Application);
  Try
    Frm_ConsultaJogoZerar.SetText(txt_BuscarZerado.Text);
    Frm_ConsultaJogoZerar.BuscaJogozerar;
    Frm_ConsultaJogoZerar.Showmodal;
  Finally
    Frm_ConsultaJogoZerar.Free;
  End;

  //Frm_ConsultaJogoZerar.Btn_BuscarClick (Sender : TObject);
end;

procedure TFrm_JogosZerados.Btn_CadPlatClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_CadPlataforma, Frm_CadPlataforma);
end;

procedure TFrm_JogosZerados.BuscaValorGrid(const nome: String);
begin
  Frm_JogosZerados.txt_BuscarZerado.Text := nome;
end;

procedure TFrm_JogosZerados.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_JogosZerados.Button2Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrm_JogosZerados.CB_PlatEnter(Sender: TObject);
begin
  Qry_BuscaPlat.Close;
  Qry_BuscaPlat.Open;
end;

procedure TFrm_JogosZerados.FormShow(Sender: TObject);
begin
  CodigoJogo := 0;
  CodigoDesenvol := 0;
  CodigoCat := 0;
  txt_BuscarZerado.Text := '';
  txt_Desenvol.Text := '';
  txt_Categoria.Text := '';
  txt_nota.Text := '';
  txt_horas.Text := '';
  CB_Plat.KeyValue := null;
  DT_Date.DateTime := now;
  MM_OBS.Lines.Text := ''
end;

procedure TFrm_JogosZerados.Gravar;
begin
  if CB_Platina.Text = 'Sim' then
  begin
    Platina := 'S'
  end
  else
  begin
    Platina := 'N'
  end;
  if StrToFloat(txt_nota.text) <= 11.00 then
  begin
    if (txt_BuscarZerado.Text <> '') and
       (txt_Desenvol.Text <> '') and
       (txt_Categoria.Text <> '') and
       (txt_nota.Text <> '') and
       (txt_horas.Text <> '')
       then
       begin

        qry_QtdLinhas.ParamByName('COD_USUARIO').Value := GravaCodigoUsuario;
        qry_QtdLinhas.Open();
        qtd_linhas := qry_QtdLinhas.FieldByName('COUNT').AsInteger;
        qry_QtdLinhas.Close;

          Qry_InsereJZ.ParamByName('COD_JOGO').Value := CodigoJogo;
        Qry_InsereJZ.ParamByName('COD_PLATAFORMA').Value := CB_Plat.KeyValue;
        Qry_InsereJZ.ParamByName('COD_CATEGORIA').Value := CodigoCat;
        Qry_InsereJZ.ParamByName('COD_DESENVOLVEDORA').Value := CodigoDesenvol;
        Qry_InsereJZ.ParamByName('HORAS').Value := txt_horas.Text;
        Qry_InsereJZ.ParamByName('NOTA').Value := txt_nota.Text;
        Qry_InsereJZ.ParamByName('COD_USUARIO').Value := GravaCodigoUsuario;
        Qry_InsereJZ.ParamByName('PLATINADO').Value := Platina;
        Qry_InsereJZ.ParamByName('OBS').Value := MM_OBS.Lines.Text;
        Qry_InsereJZ.ParamByName('DATA').AsDate := DT_Date.Date;
        Qry_InsereJZ.ExecSQL;

        qry_QtdLinhas.ParamByName('COD_USUARIO').Value := GravaCodigoUsuario;
        qry_QtdLinhas.Open();
        if qry_QtdLinhas.FieldByName('COUNT').AsInteger > qtd_linhas then
        BEGIN
          CodigoJogo := 0;
          CodigoDesenvol := 0;
          CodigoCat := 0;
          txt_BuscarZerado.Text := '';
          txt_Desenvol.Text := '';
          txt_Categoria.Text := '';
          txt_nota.Text := '';
          txt_horas.Text := '';
          CB_Plat.KeyValue := null;
          DT_Date.DateTime := now;
          MM_OBS.Lines.Text := '';
          MsgInformacao('Jogo zerado cadastrado com sucesso')
        END
        else
        begin
          MsgAtencao('Ocorreu algum erro para cadastrar o registro, tente novamente')
        end;
       end
       ELSE
       BEGIN
         MsgAtencao('Selecione um jogo e preencha todos os campos');
       END;

  end
  Else
  begin
    MsgAtencao('A nota s� pode ser de 0 a 11 e somente um �nico jogo com nota 11')
  end;
end;

procedure TFrm_JogosZerados.txt_notaExit(Sender: TObject);
 var
Text: string;
Value: Double;

begin
  // Salva o texto atual do TDEdit
  Text := txt_nota.Text;

  // Remove qualquer caractere que n�o seja d�gito ou v�rgula
  Text := StringReplace(Text, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  Text := StringReplace(Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  // Verifica se o texto � um n�mero v�lido
  if TryStrToFloat(Text, Value) then
  begin
    // Formata o n�mero no formato desejado
    Text := FormatFloat('0.00', Value);
  end
  else
  begin
    // Se n�o for um n�mero v�lido, define o texto como vazio
    Text := '';
  end;

  // Atualiza o texto do TDEdit
  txt_nota.Text := Text;

  // Define o cursor para o final do texto
  txt_nota.SelStart := Length(Text);
end;


end.
