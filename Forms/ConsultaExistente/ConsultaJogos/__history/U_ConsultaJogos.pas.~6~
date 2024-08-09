unit U_ConsultaJogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_ConsultaExistente, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_ConsultaJogos = class(TFrm_ConsultaExistente)
    procedure Btn_BuscarClick(Sender: TObject);
  private
    Procedure BuscaJogos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ConsultaJogos: TFrm_ConsultaJogos;

implementation

{$R *.dfm}

{ TFrm_ConsultaJogos }

procedure TFrm_ConsultaJogos.Btn_BuscarClick(Sender: TObject);
begin
  inherited;
  BuscaJogos;
end;

procedure TFrm_ConsultaJogos.BuscaJogos;
begin
Qry_Busca.Close;
  Qry_Busca.SQL.clear;
  Qry_Busca.SQL.Add('select J.nome_jogo AS NOME, C.nome_categoria AS CATEGORIA, D.nome_desenvol AS DESENVOLVEDORA ');
  Qry_Busca.SQL.Add('FROM jogos J, DESENVOLVEDORA D, CATEGORIA_TIPO C');
  Qry_Busca.SQL.Add('WHERE');
  Qry_Busca.SQL.Add('J.cod_categoria = C.controle_cat AND');
  Qry_Busca.SQL.Add('J.cod_desenvolvedora = D.controle_desen');

  IF txt_Busca.Text <> '' then
  begin
    Qry_Busca.SQL.Add('AND UPPER (TRIM (J.NOME_JOGO)) LIKE ' + QuotedStr( '%'+ UpperCase(Trim(txt_Busca.text))+'%'));
  end;
  Qry_Busca.SQL.Add('ORDER BY J.NOME_JOGO');
  Qry_Busca.Open();
  Qry_Busca.FetchAll;
end;

end.
