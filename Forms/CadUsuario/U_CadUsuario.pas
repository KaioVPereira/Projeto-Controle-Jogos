unit U_CadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.Client,RegularExpressions;

type
  TFrm_CadUsuario = class(TForm)
    Image1: TImage;
    TXT_Usuario: TEdit;
    TXT_Email: TEdit;
    txt_Numero: TEdit;
    txt_ddd: TEdit;
    txt_Senha: TEdit;
    txt_ConfirmaSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lb_ValidaSenha: TLabel;
    Lb_ValidaUserExistente: TLabel;
    lb_ValidaEmail: TLabel;
    txt_NickName: TEdit;
    LB_NickName: TLabel;
    LB_ValidaNick: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure txt_ConfirmaSenhaChange(Sender: TObject);
    procedure txt_SenhaChange(Sender: TObject);
    procedure TXT_UsuarioChange(Sender: TObject);
    procedure TXT_EmailChange(Sender: TObject);
    procedure txt_NickNameChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Function ValidaSenhasIguais (Senha, ConfirmSenha :String): Boolean;
    Function ValidaUsuario (Query : TFDQuery; user : String ): Boolean;
    Function ValidaEmailExitente (Query : TFDQuery; EMail : String): Boolean;
    Function ValidaNickName (Query : TFDQuery; NickName : String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadUsuario: TFrm_CadUsuario;

implementation

{$R *.dfm}

uses DM_CadUsuario, U_Biblioteca, uCrpt;

procedure TFrm_CadUsuario.Button1Click(Sender: TObject);
begin
  if (ValidaSenhasIguais(txt_Senha.Text, txt_ConfirmaSenha.Text) and
      ValidaUsuario(DMB_CadUsuario.Qry_ValidaUser, TXT_Usuario.Text) AND
      ValidaEmailExitente(DMB_CadUsuario.Qry_ValidaEmail, TXT_Email.Text)AND
      ValidaNickName(DMB_CadUsuario.Qyr_ValidaNick, txt_NickName.Text) AND
      ValidaEmail(TXT_Email.Text))
      AND
      (NOT VerificaCaracteresEspeciais(TXT_Usuario.Text))
      then
      BEGIN
        DMB_CadUsuario.Qry_InsereUser.ParamByName('NICKNAME').AsString := txt_NickName.Text;
        DMB_CadUsuario.Qry_InsereUser.ParamByName('USUARIO').AsString := TXT_Usuario.Text;
        DMB_CadUsuario.Qry_InsereUser.ParamByName('SENHA').AsString := Criptografa('C',txt_Senha.Text);
        DMB_CadUsuario.Qry_InsereUser.ParamByName('EMAIL').AsString := TXT_Email.Text;
        DMB_CadUsuario.Qry_InsereUser.ParamByName('DDD').AsString := txt_ddd.Text;
        DMB_CadUsuario.Qry_InsereUser.ParamByName('NUMERO').AsString := txt_Numero.Text;

        DMB_CadUsuario.Qry_InsereUser.ExecSQL;
      END
      ELSE
      BEGIN
        ShowMessage('Valide os campos antes de tentar cadastrar usu�rio');
      END;


end;

procedure TFrm_CadUsuario.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrm_CadUsuario.SpeedButton1Click(Sender: TObject);
begin
  if txt_Senha.PasswordChar = '*' then
    begin
      txt_senha.PasswordChar := #0 ;
    end
    else
    begin
      txt_Senha.PasswordChar := '*'
    end;
end;

procedure TFrm_CadUsuario.SpeedButton2Click(Sender: TObject);
begin
  if txt_ConfirmaSenha.PasswordChar = '*' then
      begin
        txt_ConfirmaSenha.PasswordChar := #0 ;
      end
      else
      begin
        txt_ConfirmaSenha.PasswordChar := '*'
      end;
end;

procedure TFrm_CadUsuario.txt_ConfirmaSenhaChange(Sender: TObject);
begin
  if ValidaSenhasIguais(txt_Senha.Text, txt_ConfirmaSenha.Text) = false then
  begin
    lb_ValidaSenha.Visible := true;
  end
  else
  begin
    lb_ValidaSenha.Visible := false;
  end;
end;

procedure TFrm_CadUsuario.TXT_EmailChange(Sender: TObject);
begin
   if not ValidaEmail(TXT_Email.Text)  then
   begin
    lb_ValidaEmail.Visible := true;
    lb_ValidaEmail.Caption := 'E-mail inv�lido';
   end
   else
   begin
    if ValidaEmailExitente(DMB_CadUsuario.Qry_ValidaEmail, TXT_Email.Text) then
    BEGIN
      lb_ValidaEmail.Visible := false;
    END
    ELSE
    BEGIN
      lb_ValidaEmail.Caption := 'Este E-mail j� existe cadastrado';
      lb_ValidaEmail.Visible := true;
    END;

   end;
end;

procedure TFrm_CadUsuario.txt_NickNameChange(Sender: TObject);
begin
  if txt_NickName.Text <> '' then
  begin
    if ValidaNickName(DMB_CadUsuario.Qyr_ValidaNick, txt_NickName.Text) then
    begin
      LB_ValidaNick.Visible := false
    end
    else
    begin
      LB_ValidaNick.Caption := 'Este NickName ja existe';
      LB_ValidaNick.Font.Color := clRed;
      LB_ValidaNick.Visible := TRUE;
    end;
  end
  else
  begin
    LB_ValidaNick.Visible := false
  end;
end;

procedure TFrm_CadUsuario.txt_SenhaChange(Sender: TObject);
begin
  if txt_ConfirmaSenha.Text <> '' then
    BEGIN
      if ValidaSenhasIguais(txt_Senha.Text, txt_ConfirmaSenha.Text) = false then
    begin
      lb_ValidaSenha.Visible := true;
    end
    else
    begin
      lb_ValidaSenha.Visible := false;
    end;
  END
  else
  begin
    lb_ValidaSenha.Visible := false;
  end;
end;

procedure TFrm_CadUsuario.TXT_UsuarioChange(Sender: TObject);
begin

  if TXT_Usuario.Text <> '' then
  begin
    If not ValidaUsuario(DMB_CadUsuario.Qry_ValidaUser,TXT_Usuario.Text)  then
    begin
      Lb_ValidaUserExistente.Visible := true;
      Lb_ValidaUserExistente.Caption := 'Este nome de usu�rio j� existe';
      Lb_ValidaUserExistente.Alignment := taCenter;
      Lb_ValidaUserExistente.Font.Color := clRed;
    end
    Else
    begin
      if VerificaCaracteresEspeciais(TXT_Usuario.Text) = false then
      begin
        Lb_ValidaUserExistente.Visible := true;
        Lb_ValidaUserExistente.Caption := 'Usu�rio V�lido';
        Lb_ValidaUserExistente.Alignment := taCenter;
        Lb_ValidaUserExistente.Font.Color := clGreen;
      end
      else
      begin
        Lb_ValidaUserExistente.Visible := true;
        Lb_ValidaUserExistente.Caption  := 'N�o pode ser utilizado Caract�res especiais';
        Lb_ValidaUserExistente.Alignment := taCenter;
        Lb_ValidaUserExistente.Font.Color := clred;
      end;
    end
  end
  else
  begin
    Lb_ValidaUserExistente.Visible := False;
  end;

end;

function TFrm_CadUsuario.ValidaEmailExitente(Query: TFDQuery; EMail: string): Boolean;
begin
  Query.Close;
  Query.SQL.Clear;
  QUERY.SQL.Text := 'SELECT 1 FROM USUARIO WHERE UPPER(EMAIL) = UPPER ('+QuotedStr(EMail)+') AND 1=1';
  Query.Open();
  if Query.Eof then
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;
  Query.Close;
end;

function TFrm_CadUsuario.ValidaNickName(Query: TFDQuery; NickName: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('NICKNAME').AsString := NickName;
  Query.Open();
  if Query.Eof then
  begin
    result := true
  end
  else
  begin
   result := false;
  end;
  QUERY.Close;
end;

function TFrm_CadUsuario.ValidaSenhasIguais(Senha,
  ConfirmSenha: String): Boolean;
begin
  if ConfirmSenha = Senha then
    Begin
      result := True
    End
    Else
    begin
      Result := false;
    end;

end;

function TFrm_CadUsuario.ValidaUsuario(Query: TFDQuery; User: String): Boolean;
begin
  Query.Close;
  Query.ParamByName('USUARIO').AsString := User;
  Query.Open();
  if Query.Eof then
  begin
    result := true
  end
  else
  begin
   result := false;
  end;
  QUERY.Close;
end;


end.
