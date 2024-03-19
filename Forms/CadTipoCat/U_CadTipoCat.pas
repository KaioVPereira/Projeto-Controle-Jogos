unit U_CadTipoCat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, U_Biblioteca;

type
  TFrm_CadTipoCat = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    LB_Consulta: TLabel;
    LB_ValidaCat: TLabel;
    txt_NomeCat: TEdit;
    Qry_CadCat: TFDQuery;
    Qry_ValidaCat: TFDQuery;
    procedure LB_ConsultaMouseEnter(Sender: TObject);
    procedure LB_ConsultaMouseLeave(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure txt_NomeCatChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LB_ConsultaClick(Sender: TObject);
  private
    function ValidaCat (Query : TFDQuery ; Texto:String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadTipoCat: TFrm_CadTipoCat;

implementation

{$R *.dfm}

uses U_ConsultaCat;

procedure TFrm_CadTipoCat.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_CadTipoCat.Button2Click(Sender: TObject);
begin
  if txt_NomeCat.Text <> '' then
  begin
    if ValidaCat(Qry_ValidaCat, txt_NomeCat.Text) then
    begin
      Qry_CadCat.ParamByName('CATEGORIA').Value := txt_NomeCat.Text;
      Qry_CadCat.ExecSQL;
      if not  ValidaCat(Qry_ValidaCat, txt_NomeCat.Text) then
      begin
        txt_NomeCat.Clear;
        MsgInformacao('Categoria cadastrada sucesso');
      end
      else
      begin
        MsgAtencao('Ocorreu algum erro para efeutar o cadastro, tente novamente')
      end;
    end
    else
    begin
      MsgAtencao('Categoria j� cadastrada anteriormente')
    end;
  end
  else
  begin
    MsgAtencao('O nome da Categoria n�o pode ser em branco')
  end;
end;

procedure TFrm_CadTipoCat.LB_ConsultaClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_ConsultaCategoria, Frm_ConsultaCategoria);
end;

procedure TFrm_CadTipoCat.LB_ConsultaMouseEnter(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlight;
  LB_Consulta.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_CadTipoCat.LB_ConsultaMouseLeave(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlightText;
  LB_Consulta.Font.Style := [fsItalic];
end;

procedure TFrm_CadTipoCat.txt_NomeCatChange(Sender: TObject);
begin
  if txt_NomeCat.Text <> '' then
  begin
    if NOT ValidaCat (Qry_ValidaCat, txt_NomeCat.Text) then
      begin
      LB_ValidaCat.Visible := True;
      end
    else
      begin
      LB_ValidaCat.Visible := False;
      end;
  end
  else
  begin
    LB_ValidaCat.Visible := False;
  end;
end;

function TFrm_CadTipoCat.ValidaCat(Query: TFDQuery; Texto: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('CATEGORIA').AsString := Texto;
  Query.Open();
  Result := Query.Eof;
  Query.Close;
end;

end.
