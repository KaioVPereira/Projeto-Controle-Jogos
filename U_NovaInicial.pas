unit U_NovaInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, DMB_NovaInicial, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, U_MeusJogos;

type
  TFrm_NewInicial = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    N1: TMenuItem;
    Plataforma1: TMenuItem;
    Desenvolvedora1: TMenuItem;
    Categoria1: TMenuItem;
    Categoria2: TMenuItem;
    JogosJogados1: TMenuItem;
    Jogosparajogar1: TMenuItem;
    Desistiudejogar1: TMenuItem;
    Consultas1: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Pn_Fundo: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Qry_Top10: TFDQuery;
    Qry_Top10NOME_JOGO: TStringField;
    Qry_Top10NOTA: TFloatField;
    DS_Top10: TDataSource;
    ATUALIZAR: TButton;
    JogosJogados2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ATUALIZARClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JogosJogados2Click(Sender: TObject);
  private
    procedure TopTen;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_NewInicial: TFrm_NewInicial;

implementation

{$R *.dfm}

uses U_CadJogos, U_Biblioteca;

procedure TFrm_NewInicial.ATUALIZARClick(Sender: TObject);
begin
  TopTen;
end;

procedure TFrm_NewInicial.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    var
  Nota: Double;
begin
   if Column.Index = 1 then
  begin

    if not (Column.Field.IsNull) then
    begin

      Nota := Column.Field.AsFloat;


      if Nota >= 8 then
        DBGrid1.Canvas.Brush.Color := clGreen
      else if (Nota >= 5 ) and (nota < 8 )  then
        DBGrid1.Canvas.Brush.Color := clYellow
      else
        DBGrid1.Canvas.Brush.Color := clRed;

      DBGrid1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
    end;
  end;
end;

procedure TFrm_NewInicial.FormShow(Sender: TObject);
begin
  TopTen;
end;

procedure TFrm_NewInicial.JogosJogados2Click(Sender: TObject);
begin
  AbreFormShowModal(TFrm_MeusJogos, Frm_MeusJogos);
end;

procedure TFrm_NewInicial.N1Click(Sender: TObject);
begin
  AbreFormShowModal(TFrm_CadJogos, Frm_CadJogos)
end;

procedure TFrm_NewInicial.TopTen;
var Nota : Double;
begin
  Qry_Top10.ParamByName('USUARIO').Value := GravaCodigoUsuario;
  Qry_Top10.Close;
  Qry_Top10.Open();
  DBGrid1.Columns.Items[0].Width := 200;
  DBGrid1.Columns.Items[1].Font.Style := [TFontStyle.fsBold];
  DBGrid1.Columns.Items[0].Font.Style := [TFontStyle.fsBold];
  DBGrid1.Columns.Items[1].Color := clMoneyGreen;
  DBGrid1.Columns.Items[0].Color := clMoneyGreen;
  DBGrid1.Columns.Items[0].Title.Font.Style := [TFontStyle.fsBold];
  DBGrid1.Columns.Items[1].Title.Font.Style := [TFontStyle.fsBold];
  DBGrid1.Columns.Items[1].Title.Font.Color := clPurple;
  DBGrid1.Columns.Items[0].Title.Font.Color := clPurple;
end;

end.
