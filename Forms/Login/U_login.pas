unit U_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, U_Biblioteca,
  Vcl.Buttons, U_ConfigIni, U_constantes, Vcl.Imaging.jpeg ;

type
  TFrm_login = class(TForm)
    txt_login: TEdit;
    txt_senha: TEdit;
    btn_logar: TButton;
    btn_cancelar: TButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    IMG_Fundo: TImage;
    LB_CriarConta: TLabel;
    LB_Usuario: TLabel;
    LB_Senha: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_logarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LB_CriarContaMouseEnter(Sender: TObject);
    procedure LB_CriarContaMouseLeave(Sender: TObject);
    procedure LB_CriarContaClick(Sender: TObject);
  private

    function Login (pLogin, pSenha: string):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_login: TFrm_login;

implementation

{$R *.dfm}

uses U_Dados, uCrpt, DM_Login, U_CadUsuario;

procedure TFrm_login.btn_cancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_login.btn_logarClick(Sender: TObject);
begin
  if Login(txt_login.Text,txt_senha.text) = false then
  begin
    MsgAtencao('Usu�rio e/ou senha est�o incorretos');
    abort;
  end
  else
  if Login(txt_login.Text,txt_senha.Text) = true then
  begin
     GravaUsuario := txt_login.Text;
     GravaCodigoUsuario := DMB_Login.fd_QueryLogin.FieldByName('CONTROLE_USUARIO').AsInteger;
     self.Close;
  end;

end;

procedure TFrm_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Login(txt_login.Text, txt_senha.text) = false then
  begin
    Application.Terminate;
  end;
  FreeAndNil(DMB_Login);
end;

procedure TFrm_login.FormCreate(Sender: TObject);
begin
  if not Assigned(DMB_Login) then
    DMB_Login := TDMB_Login.Create(nil);
end;

procedure TFrm_login.FormShow(Sender: TObject);
begin
  GravaUsuario := '';
  LB_CriarConta.BringToFront;
end;


procedure TFrm_login.LB_CriarContaClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_CadUsuario, Frm_CadUsuario);
end;

procedure TFrm_login.LB_CriarContaMouseEnter(Sender: TObject);
begin
   LB_CriarConta.Font.Color := clHighlight;
  LB_CriarConta.Font.Style := [fsUnderline,fsItalic];
end;

procedure TFrm_login.LB_CriarContaMouseLeave(Sender: TObject);
begin
  LB_CriarConta.Font.Color := clHighlightText;
  LB_CriarConta.Font.Style := [fsItalic];
end;

function TFrm_login.Login (pLogin, pSenha: string):boolean;
begin
  Result := False;
  DMB_Login.fd_QueryLogin.Close;
  DMB_Login.fd_QueryLogin.ParamByName('LOGIN').AsString := pLogin;
  DMB_Login.fd_QueryLogin.Open();

  DMB_Login.fd_QueryLogin.First;
  while not DMB_Login.fd_QueryLogin.Eof do
  begin
    if pSenha = Criptografa('D', DMB_Login.fd_QueryLogin.FieldByName('SENHA').AsAnsiString) then
    begin
      Result := True;
      break;
    end;
      DMB_Login.fd_QueryLogin.Next;
  end;

end;

procedure TFrm_login.SpeedButton1Click(Sender: TObject);
begin
  AbreFormShowModal(Tfrm_ConfigIni, frm_ConfigIni);
end;

end.
