unit U_ConsultaDesnvol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_ConsultaExistente, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_ConsultaDesenvol = class(TFrm_ConsultaExistente)
    Qry_BuscaNOME: TStringField;
    procedure Btn_BuscarClick(Sender: TObject);
  private
    procedure BuscaNome;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ConsultaDesenvol: TFrm_ConsultaDesenvol;

implementation

{$R *.dfm}

uses U_Biblioteca, U_Dados;

{ TFrm_ConsultaDesenvol }

procedure TFrm_ConsultaDesenvol.Btn_BuscarClick(Sender: TObject);
begin
  inherited;
  BuscaNome;
end;

procedure TFrm_ConsultaDesenvol.BuscaNome;
begin
  Qry_Busca.Close;
  Qry_Busca.SQL.clear;
  Qry_Busca.SQL.Add('SELECT NOME_DESENVOL AS NOME FROM DESENVOLVEDORA ');
  Qry_Busca.SQL.Add('WHERE 1 = 1');

  IF txt_Busca.Text <> '' then
  begin
    Qry_Busca.SQL.Add('AND UPPER (TRIM (NOME_DESENVOL)) LIKE ' + QuotedStr( '%'+ UpperCase(Trim(txt_Busca.text))+'%'));
  end;
  Qry_Busca.SQL.Add('ORDER BY NOME_DESENVOL');
  Qry_Busca.Open();
  Qry_Busca.FetchAll;
end;

end.
