unit U_CadJogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, U_Dados, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrm_CadJogos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    LB_Consulta: TLabel;
    LB_ValidaDesenvol: TLabel;
    txt_NomeDesenvol: TEdit;
    Qry_Desenvol: TFDQuery;
    Qry_Categoria: TFDQuery;
    DS_Desenvolvedora: TDataSource;
    Qry_DesenvolCODIGO: TIntegerField;
    Qry_DesenvolNOME: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    cb_Desenvol: TDBLookupComboBox;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadJogos: TFrm_CadJogos;

implementation

{$R *.dfm}

procedure TFrm_CadJogos.Button2Click(Sender: TObject);
begin
  ShowMessage('teste');
end;

procedure TFrm_CadJogos.FormCreate(Sender: TObject);
begin
  Qry_Desenvol.Open();
end;

end.
