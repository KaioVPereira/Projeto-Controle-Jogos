unit U_CadJogoZerado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFrm_JogosZerados = class(TForm)
    Image1: TImage;
    txt_BuscarZerado: TEdit;
    Btn_Buscar: TBitBtn;
    Panel1: TPanel;
    txt_Desenvol: TEdit;
    txt_Categoria: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ComboBox1: TComboBox;
    txt_nota: TEdit;
    txt_horas: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Btn_BuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuscaValorGrid (const nome : String);
    var CodigoJogo, CodigoDesenvol,CodigoCat : Integer;
    { Public declarations }
  end;

var
  Frm_JogosZerados: TFrm_JogosZerados;

implementation

{$R *.dfm}

uses U_Biblioteca, U_ConsultaJogoZerado;

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

procedure TFrm_JogosZerados.BuscaValorGrid(const nome: String);
begin
  Frm_JogosZerados.txt_BuscarZerado.Text := nome;
end;

end.
