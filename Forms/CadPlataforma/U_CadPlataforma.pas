unit U_CadPlataforma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, U_Biblioteca;

type
  TFrm_CadPlataforma = class(TForm)
    Qry_CadPlat: TFDQuery;
    Qry_ValidaPlat: TFDQuery;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Image2: TImage;
    Label1: TLabel;
    LB_Consulta: TLabel;
    LB_ValidaPlat: TLabel;
    txt_NomePlat: TEdit;
    procedure LB_ConsultaMouseEnter(Sender: TObject);
    procedure LB_ConsultaMouseLeave(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure txt_NomePlatChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LB_ConsultaClick(Sender: TObject);
  private
    function ValidaPlat (Query : TFDQuery ; Texto:String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadPlataforma: TFrm_CadPlataforma;

implementation

{$R *.dfm}

uses U_ConsultaPlat;

procedure TFrm_CadPlataforma.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_CadPlataforma.Button2Click(Sender: TObject);
begin
   if txt_NomePlat.Text <> '' then
  begin
    if ValidaPLat(Qry_ValidaPlat, txt_NomePlat.Text) then
    begin
      Qry_CadPlat.ParamByName('PLATAFORMA').Value := txt_NomePlat.Text;
      Qry_CadPlat.ExecSQL;
      if not  ValidaPlat(Qry_ValidaPlat, txt_NomePlat.Text) then
      begin
        txt_NomePlat.Clear;
        MsgInformacao('Plataforma cadastrada sucesso');
      end
      else
      begin
        MsgAtencao('Ocorreu algum erro para efeutar o cadastro, tente novamente')
      end;
    end
    else
    begin
      MsgAtencao('Plataforma j� cadastrada anteriormente')
    end;
  end
  else
  begin
    MsgAtencao('O nome da Plataforma n�o pode ser em branco')
  end;

end;


procedure TFrm_CadPlataforma.LB_ConsultaClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_ConsultaPlat, Frm_ConsultaPlat);
end;

procedure TFrm_CadPlataforma.LB_ConsultaMouseEnter(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlight;
  LB_Consulta.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_CadPlataforma.LB_ConsultaMouseLeave(Sender: TObject);
begin
  LB_Consulta.Font.Color := clHighlightText;
  LB_Consulta.Font.Style := [fsItalic];
end;

procedure TFrm_CadPlataforma.txt_NomePlatChange(Sender: TObject);
begin
  if txt_NomePlat.Text <> '' then
  begin
    if NOT ValidaPlat (Qry_ValidaPlat, txt_NomePlat.Text) then
      begin
      LB_ValidaPlat.Visible := True;
      end
    else
      begin
      LB_ValidaPlat.Visible := False;
      end;
  end
  else
  begin
    LB_ValidaPlat.Visible := False;
  end;
end;

function TFrm_CadPlataforma.ValidaPlat(Query: TFDQuery; Texto: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('PLATAFORMA').AsString := Texto;
  Query.Open();
  Result := Query.Eof;
  Query.Close;
end;

end.
