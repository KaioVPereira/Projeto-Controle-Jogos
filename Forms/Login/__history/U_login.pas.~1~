unit U_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, U_Biblioteca,
  Vcl.Buttons, U_ConfigIni, U_Inicio;

type
  TFrm_login = class(TForm)
    txt_login: TEdit;
    txt_senha: TEdit;
    LB_senha: TLabel;
    LB_nome: TLabel;
    fd_QueryLogin: TFDQuery;
    btn_logar: TButton;
    btn_cancelar: TButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_logarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

uses U_Dados, uCrpt;

procedure TFrm_login.btn_cancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_login.btn_logarClick(Sender: TObject);
begin
  if Login(txt_login.Text,txt_senha.text) = false then
  begin
    MsgAtencao('Usuário e/ou senha estão incorretos');
    abort;
  end
  else
  if Login(txt_login.Text,txt_senha.Text) = true then
  begin
     GravaUsuario := txt_login.Text;//Frm_login.Close;
     frm_inicio.lb_Usuario.Caption := 'USUÁRIO: '+GravaUsuario;
     self.Close;
  end;

end;

procedure TFrm_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Login(txt_login.Text, txt_senha.text) = false then
  begin
    Application.Terminate;
  end;
end;

procedure TFrm_login.FormCreate(Sender: TObject);
begin
  //Frm_login := TFrm_login.Create(nil);
  //Frm_login.Show;
end;

procedure TFrm_login.FormShow(Sender: TObject);
begin
  GravaUsuario := '';
  frm_inicio.lb_Usuario.Caption := GravaUsuario;
end;

function TFrm_login.Login (pLogin, pSenha: string):boolean;
begin
  Result := False;
  fd_QueryLogin.Close;
  fd_QueryLogin.ParamByName('LOGIN').AsString := pLogin;
  fd_QueryLogin.Open();

  fd_QueryLogin.First;
  while not fd_QueryLogin.Eof do
  begin
    if pSenha = Criptografa('D', fd_QueryLogin.FieldByName('SENHA').AsAnsiString) then
    begin
      Result := True;
      break;
    end;
      fd_QueryLogin.Next;
  end;

end;

procedure TFrm_login.SpeedButton1Click(Sender: TObject);
begin
  AbreFormShowModal(Tfrm_ConfigIni, frm_ConfigIni);
end;

end.
