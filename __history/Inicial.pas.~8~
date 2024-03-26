unit Inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrm_Inicial = class(TForm)
    Image1: TImage;
    Img_BtStart: TImage;
    Img_BtMenu: TImage;
    procedure FormShow(Sender: TObject);
    procedure Img_BtMenuClick(Sender: TObject);
    procedure Img_BtStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Inicial: TFrm_Inicial;

implementation

{$R *.dfm}

uses U_Biblioteca, U_ConfigIni, U_constantes, U_Dados, U_login, uCrpt, U_Menu,
  U_Start, U_CadJogoZerado;

procedure TFrm_Inicial.FormShow(Sender: TObject);
begin
  AbreFormShowModal(Tfrm_Login, Frm_Login);
end;

procedure TFrm_Inicial.Img_BtMenuClick(Sender: TObject);
begin
  AbreForm(TFrm_Menu, Frm_Menu);
end;

procedure TFrm_Inicial.Img_BtStartClick(Sender: TObject);
begin
  AbreFormShowModal(TFrm_Start, Frm_Start);
end;

end.
