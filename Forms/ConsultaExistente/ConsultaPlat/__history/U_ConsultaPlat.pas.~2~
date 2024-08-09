unit U_ConsultaPlat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_ConsultaExistente, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_ConsultaPlat = class(TFrm_ConsultaExistente)
    procedure Btn_BuscarClick(Sender: TObject);
  private
    procedure BuscaPlat;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ConsultaPlat: TFrm_ConsultaPlat;

implementation

{$R *.dfm}

{ TFrm_ConsultaPlat }

procedure TFrm_ConsultaPlat.Btn_BuscarClick(Sender: TObject);
begin
  inherited;
  BuscaPlat;
end;

procedure TFrm_ConsultaPlat.BuscaPlat;
begin
  Qry_Busca.Close;
  Qry_Busca.SQL.clear;
  Qry_Busca.SQL.Add('SELECT NOME_PLAT AS NOME FROM PLATAFORMA');
  Qry_Busca.SQL.Add('WHERE 1 = 1');

  IF txt_Busca.Text <> '' then
  begin
    Qry_Busca.SQL.Add('AND UPPER (TRIM (NOME_PLAT)) LIKE ' + QuotedStr( '%'+ UpperCase(Trim(txt_Busca.text))+'%'));
  end;
  Qry_Busca.SQL.Add('ORDER BY NOME_PLAT');
  Qry_Busca.Open();
  Qry_Busca.FetchAll;
end;

end.
