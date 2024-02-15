unit U_Biblioteca;

interface
  uses IniFiles, System.SysUtils, Vcl.Forms, FireDAC.Comp.Client,
  System.Classes, Winapi.Windows, Data.DB, Vcl.ExtCtrls, Vcl.Imaging.jpeg; //frxClass;

  const OffsetMemoryStream : Int64 = 0;

  procedure ArqIni            (pLocal, pSessao, pSubsessao: String; pValor:String);
  function  GetArqIni         (pLocal, Psessao, pSubsessao: String): string;
  procedure AtualizaFDQuery   (const pFDQuery : TFDQuery; pSQL : String);
  procedure AbreFormShowModal (pClass: TComponentClass; pForm :TForm);
  procedure AbreForm          (pClass: TComponentClass; pForm :TForm);
  procedure MsgAtencao        (pMsg: String);
  procedure MsgInformacao     (pMsg : String);
  Procedure CarregarImagem    (DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
  function  MsgPerguntar      (pMsg: String; pFocoBtnSim : Boolean = true): Boolean;
  procedure MsgErro           (pMsg: String);
  procedure EnableEdit        (Form : TForm ; Valor : Boolean);
  Function  ValidaCPF         (CPF : String): Boolean;
  Var GravaUsuario : String;

  var MemoryStream : TMemoryStream;
     Jpg : TJpegImage;
     Bitmap : TBitmap;
  //procedure CarregaRelat      (const pReport: TFrxReport);

implementation

uses U_FormMain, Vcl.DBCtrls;

  //Procedure que gera o arquivo ini
  procedure ArqIni(pLocal, pSessao, pSubsessao: String; pValor:String);
  var vArquivo: TiniFile;
    begin
      vArquivo := TiniFile.Create(pLocal);
      vArquivo.WriteString(pSessao, pSubsessao, pValor);
      vArquivo.Free;
    end;

  //Function que lê o arquivo ini e gera o arquivo também
  function GetArqIni (pLocal, Psessao, pSubsessao: String): string;
  var vArquivo : TIniFile;
    begin
      vArquivo := TIniFile.Create(pLocal);
      Result := vArquivo.ReadString(pSessao, pSubsessao, '');
      vArquivo.Free;
    end;

   procedure AtualizaFDQuery(const pFDQuery : TFDQuery; pSQL : String);
    begin
      pFdQuery.Close;
      if Trim(pSQL) <> '' then
      BEGIN
        pFDQuery.SQL.Clear;
        pFDQuery.SQL.Text := pSQL;
      END;
      pFdQuery.Open();
      pFdQuery.FetchAll;
    end;

   procedure AbreFormShowModal (pClass: TComponentClass; pForm :TForm);
    begin
      try
        Application.CreateForm(pClass, pForm);
        pForm.ShowModal;
      finally
        FreeAndNil(pForm);
      end;
    end;

    procedure AbreForm (pClass: TComponentClass; pForm :TForm);
    begin
      try
        Application.CreateForm(pClass, pForm);
        pForm.Show;
      finally

      end;
    end;
   // procedure CarregaRelat(const pReport: TFrxReport);
    //begin
     // pReport.PrepareReport;
      //pReport.ShowPreparedReport;
    //end;
    procedure MsgAtencao (pMsg: String);
    begin
      Application.MessageBox(pChar(pMsg), 'ATENÇÃO', MB_ICONWARNING + MB_OK);
    end;

    procedure MsgInformacao (pMsg : String);
    begin
      Application.MessageBox(pChar(pMsg), 'INFORMAÇÃO', MB_ICONINFORMATION + MB_OK);
    end;

    function MsgPerguntar (pMsg: String; pFocoBtnSim : Boolean = true): Boolean;
    begin
    if pFocoBtnSim then
      begin
       result :=  Application.MessageBox(pChar(pMsg), 'PERGUNTA', MB_ICONQUESTION + MB_YESNO) = IDYES;
      end
      ELSE
      BEGIN
        result := Application.MessageBox(pChar(pMsg), 'PERGUNTA', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
      END;
    end;

    procedure MsgErro (pMsg: String);
    begin
      Application.MessageBox(pChar(pMsg), 'ERRO', MB_ICONERROR + MB_OK);
    end;

    procedure EnableEdit(Form : TForm ; Valor : Boolean);
    var i : Integer;
    begin
    for i := 0 to Form.ComponentCount -1 do
      begin
        if Form.Components[i] is TDBEdit then
          begin
            if TDBEdit(Form.Components[i]).TabOrder <> 0 then
              begin
                TDBEdit(Form.Components[i]).Enabled := Valor;
              end;
          end;

          if form.Components[i] is TDBEdit then
          begin
            if TDBEdit(Form.Components[i]).TabOrder <> 0 then
              begin
                TDBEdit(Form.Components[i]).Clear;
              end;

            if Form.Components[i] is TDBLookUpComboBox  then
              begin
                TDBLookUpComboBox(Form.Components[i]).Enabled := Valor;
              end;
          end;
        end;
      end;



Procedure CarregarImagem(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
begin
  if not(DataSet.IsEmpty) and
  not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TJpegImage.Create;
      (DataSet.FieldByName(BlobFieldName) as TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageExibicao.Picture.Assign(Jpg);
    finally
      Jpg.Free;
      MemoryStream.Free;
    end
  else
  // o Else faz com que, caso o campo esteja Null, o TImage seja limpado
    ImageExibicao.Picture := Nil;
end;

Function  ValidaCPF(CPF : String): Boolean;
  var
  I, Soma, Digito: Integer;
  Digs: array [0..1] of Integer;
  var CleanCPF : String ;
  var TodosIguais : bOOLEAN;
begin
  Result := False;

  // Remover caracteres não numéricos do CPF
  // para evitar problemas com máscaras
  CleanCPF := StringReplace(CPF, '.', '', [rfReplaceAll]);
  CleanCPF := StringReplace(CleanCPF, '-', '', [rfReplaceAll]);

  // Verificar se o CPF tem 11 dígitos
  if Length(CleanCPF) <> 11 then
    Exit;

  // Verificar se todos os dígitos são iguais
   TodosIguais := True;
  for I := 1 to 10 do
    if CleanCPF[I] <> CleanCPF[I + 1] then
    begin
      TodosIguais := False;
      Break;
    end;

  if TodosIguais then
    Exit;

  // Calcular o primeiro dígito verificador
  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(CleanCPF[I]) * (11 - I);

  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;

  Digs[0] := Digito;

  // Calcular o segundo dígito verificador
  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(CleanCPF[I]) * (12 - I);

  Soma := Soma + Digs[0] * 2;
  Digito := 11 - (Soma mod 11);
  if Digito >= 10 then
    Digito := 0;

  Digs[1] := Digito;

  // Verificar se os dígitos calculados são iguais aos dígitos informados no CPF
  Result := (CleanCPF[10] = Char(48 + Digs[0])) and (CleanCPF[11] = Char(48 + Digs[1]));
end;

end.
