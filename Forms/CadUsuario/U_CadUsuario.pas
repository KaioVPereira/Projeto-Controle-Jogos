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
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure txt_ConfirmaSenhaChange(Sender: TObject);
    procedure txt_SenhaChange(Sender: TObject);
    procedure TXT_UsuarioChange(Sender: TObject);
    procedure TXT_EmailChange(Sender: TObject);
  private
    Function ValidaSenhasIguais (Senha, ConfirmSenha :String): Boolean;
    Function ValidaUsuario (Query : TFDQuery; user : String ): Boolean;
    Function ValidaEmailExitente (Query : TFDQuery; EMail : String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadUsuario: TFrm_CadUsuario;

implementation

{$R *.dfm}

uses DM_CadUsuario, U_Biblioteca;

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
   if ValidaEmail(TXT_Email.Text) = false then
   begin
    lb_ValidaEmail.Visible := true;
    lb_ValidaEmail.Caption := 'E-mail inválido';
   end
   else
   begin
    if ValidaEmailExitente(DMB_CadUsuario.Qry_ValidaEmail, TXT_Email.Text) then
    BEGIN
      lb_ValidaEmail.Visible := false;
    END
    ELSE
    BEGIN
      lb_ValidaEmail.Caption := 'Este E-mail já existe cadastrado';
      lb_ValidaEmail.Visible := true;
    END;

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
    If ValidaUsuario(DMB_CadUsuario.Qry_ValidaUser,TXT_Usuario.Text) =  False then
    begin
      Lb_ValidaUserExistente.Visible := true;
      Lb_ValidaUserExistente.Caption := 'Este nome de usuário já existe';
      Lb_ValidaUserExistente.Alignment := taCenter;
      Lb_ValidaUserExistente.Font.Color := clRed;
    end
    Else
    begin
      if VerificaCaracteresEspeciais(TXT_Usuario.Text) = false then
      begin
        Lb_ValidaUserExistente.Visible := true;
        Lb_ValidaUserExistente.Caption := 'Usuário Válido';
        Lb_ValidaUserExistente.Alignment := taCenter;
        Lb_ValidaUserExistente.Font.Color := clGreen;
      end
      else
      begin
        Lb_ValidaUserExistente.Visible := true;
        Lb_ValidaUserExistente.Caption  := 'Não pode ser utilizado Caractéres especiais';
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
  Query.ParamByName('EMAIL').AsString := EMail;
  Query.Open();
  if Query.Eof then
  begin
    result := true
  end
  else
  begin
    result := false;
  end;
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
