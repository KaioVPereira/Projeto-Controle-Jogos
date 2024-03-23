unit U_ConsultaJogoZerado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_ConsultaJogos, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, U_CadJogoZerado,
  U_Biblioteca;

type
  TFrm_ConsultaJogoZerar = class(TFrm_ConsultaJogos)
    Qry_BuscaNOME: TStringField;
    Qry_BuscaCATEGORIA: TStringField;
    Qry_BuscaDESENVOLVEDORA: TStringField;
    Qry_BuscaCODIGO: TIntegerField;
    Qry_BuscaCODIGO_CATEOGORIA: TIntegerField;
    Qry_BuscaCODIGO_DESENVOLEDORA: TIntegerField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Btn_BuscarClick(Sender: TObject);
  private


    { Private declarations }
  public
    procedure BuscaJogoZerar;
    procedure SetText (const Atext : String);

    { Public declarations }
  end;

var
  Frm_ConsultaJogoZerar: TFrm_ConsultaJogoZerar;

implementation

{$R *.dfm}

procedure TFrm_ConsultaJogoZerar.Btn_BuscarClick(Sender: TObject);
begin
  //inherited;
  BuscaJogoZerar;
end;

procedure TFrm_ConsultaJogoZerar.BuscaJogoZerar;
begin
  qry_Busca.Close;
  Qry_Busca.SQL.clear;
  Qry_Busca.SQL.Add('select j.Controle_Jogo as CODIGO, J.nome_jogo AS NOME,C.controle_cat as CODIGO_CATEOGORIA, C.nome_categoria AS CATEGORIA,D.controle_desen AS CODIGO_DESENVOLEDORA, D.nome_desenvol AS DESENVOLVEDORA');
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
  DBGrid1.Columns.Items[3].Visible := false;
  DBGrid1.Columns.Items[5].Visible := false;
  DBGrid1.Columns.Items[4].Visible := false;

  DBGrid1.Columns.Items[0].Width := 250;
  DBGrid1.Columns.Items[1].Width := 180;
  DBGrid1.Columns.Items[2].Width := 180;

end;



procedure TFrm_ConsultaJogoZerar.DBGrid1DblClick(Sender: TObject);
Begin
  if Assigned(GlobalFrm_JogoZerado) then
  BEGIN
    GlobalFrm_JogoZerado.txt_BuscarZerado.Text := Qry_Busca.FieldByName('Nome').Value;
    GlobalFrm_JogoZerado.txt_Desenvol.Text := Qry_Busca.FieldByName('Desenvolvedora').Value;
    GlobalFrm_JogoZerado.txt_Categoria.Text := Qry_Busca.FieldByName('Categoria').Value;
    GlobalFrm_JogoZerado.CodigoJogo := Qry_Busca.FieldByName('CODIGO').Value;
    GlobalFrm_JogoZerado.CodigoDesenvol := Qry_Busca.FieldByName('CODIGO_DESENVOLEDORA').Value;
    GlobalFrm_JogoZerado.CodigoCat := Qry_Busca.FieldByName('CODIGO_CATEOGORIA').Value;
    Self.Close;
  END;

End;
{var
  frm_JogosZerados : TFRM_JogosZerados;
begin
  inherited;
  if Assigned(Application.MainForm) and
     Assigned(Application.FindComponent('fRM_JogosZerados')) then
     begin
       frm_JogosZerados := Tfrm_JogosZerados(Application.FindComponent('frm_JogosZerados'));
       if Assigned(frm_JogosZerados.txt_BuscarZerado) then
       begin
        Frm_JogosZerados.BuscaValorGrid(Qry_Busca.FieldByName('Nome').Value);
        Self.Close;
       end;

     end;
end;}

procedure TFrm_ConsultaJogoZerar.SetText(const Atext: String);
begin
  txt_Busca.Text := Atext;
end;

end.
