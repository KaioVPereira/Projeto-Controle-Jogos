unit U_CadDesenvolvedora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, U_Biblioteca, U_ConsultaExistente;

type
  TFrm_CadDesenv = class(TForm)
    Image1: TImage;
    txt_NomeDesenvol: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Qry_CadDesenvol: TFDQuery;
    Qry_ValidaDesenvol: TFDQuery;
    LB_ValidaDesenvol: TLabel;
    LB_Consulta: TLabel;
    Qry_ValidaDesenvolCONSTANT: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure txt_NomeDesenvolChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LB_ConsultaMouseEnter(Sender: TObject);
    procedure LB_ConsultaMouseLeave(Sender: TObject);
    procedure LB_ConsultaClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaDesenvol (Query : TFDQuery ; Texto:String): Boolean;
  public
    { Public declarations }
  end;

var
  Frm_CadDesenv: TFrm_CadDesenv;

implementation

{$R *.dfm}

uses U_Dados, U_ConsultaDesnvol;

procedure TFrm_CadDesenv.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_CadDesenv.Button2Click(Sender: TObject);
begin
  if txt_NomeDesenvol.Text <> '' then
  begin
    if ValidaDesenvol(Qry_ValidaDesenvol, txt_NomeDesenvol.Text) then
    begin
      Qry_CadDesenvol.ParamByName('DESENVOLVEDORA').Value := txt_NomeDesenvol.Text;
      Qry_CadDesenvol.ExecSQL;
      if not  ValidaDesenvol(Qry_ValidaDesenvol, txt_NomeDesenvol.Text) then
      begin
        txt_NomeDesenvol.Clear;
        MsgInformacao('Desenvolvedora cadastrada sucesso');
      end
      else
      begin
        MsgAtencao('Ocorreu algum erro para efeutar o cadastro, tente novamente')
      end;
    end
    else
    begin
      MsgAtencao('Desenvolvedora já cadastrada anteriormente')
    end;
  end
  else
  begin
    MsgAtencao('O nome da Desenvolvedora não pode ser em branco')
  end;

end;

procedure TFrm_CadDesenv.LB_ConsultaClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_ConsultaDesenvol, Frm_ConsultaDesenvol);
end;

procedure TFrm_CadDesenv.LB_ConsultaMouseEnter(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlight;
  LB_Consulta.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_CadDesenv.LB_ConsultaMouseLeave(Sender: TObject);
begin
   LB_Consulta.Font.Color := clHighlightText;
   LB_Consulta.Font.Style := [fsItalic];
end;

procedure TFrm_CadDesenv.txt_NomeDesenvolChange(Sender: TObject);
begin
  if txt_NomeDesenvol.Text <> '' then
  begin
    if NOT ValidaDesenvol (Qry_ValidaDesenvol, txt_NomeDesenvol.Text) then
      begin
      LB_ValidaDesenvol.Visible := True;
      end
    else
      begin
      LB_ValidaDesenvol.Visible := False;
      end;
  end
  else
  begin
    LB_ValidaDesenvol.Visible := False;
  end;

end;

function TFrm_CadDesenv.ValidaDesenvol(Query: TFDQuery; Texto: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('DESENVOLVEDORA').AsString := Texto;
  Query.Open();
  Result := Query.Eof;
  Query.Close;
end;

end.
