unit U_ConsultaExistente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, U_Biblioteca, U_Dados;

type
  TFrm_ConsultaExistente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Qry_Busca: TFDQuery;
    Btn_Buscar: TButton;
    txt_Busca: TEdit;
    Ds_Consulta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ConsultaExistente: TFrm_ConsultaExistente;

implementation

{$R *.dfm}

end.
