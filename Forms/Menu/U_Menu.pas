unit U_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrm_Menu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Btn_CadJogos: TSpeedButton;
    Btn_CadPlataforma: TSpeedButton;
    Btn_CadCategoria: TSpeedButton;
    btn_CadDesenvolvedora: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Menu: TFrm_Menu;

implementation

{$R *.dfm}

end.
