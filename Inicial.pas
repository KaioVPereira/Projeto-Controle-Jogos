unit Inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrm_Inicial = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Inicial: TFrm_Inicial;

implementation

{$R *.dfm}

uses U_Biblioteca, U_ConfigIni, U_constantes, U_Dados, U_login, uCrpt;

procedure TFrm_Inicial.FormShow(Sender: TObject);
begin
  AbreFormShowModal(Tfrm_Login, Frm_Login);
end;

end.