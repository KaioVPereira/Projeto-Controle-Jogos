unit U_Start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.Buttons,U_CadJogoZerado;

type
  TFrm_Start = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Btn_CadZerados: TSpeedButton;
    Btn_CadParaZerar: TSpeedButton;
    procedure Btn_CadZeradosClick(Sender: TObject);
  private
    { Private declarations }
  public
    function CriarFrm_JogoZerado: TFrm_JogosZerados;
    { Public declarations }
  end;

var
  Frm_Start: TFrm_Start;

implementation

{$R *.dfm}

uses  U_Biblioteca;

procedure TFrm_Start.Btn_CadZeradosClick(Sender: TObject);
begin
  CriarFrm_JogoZerado;
  GlobalFrm_JogoZerado.ShowModal;
end;

function TFrm_Start.CriarFrm_JogoZerado: TFrm_JogosZerados;
begin
  if not Assigned(GlobalFrm_JogoZerado) then
    GlobalFrm_JogoZerado := TFrm_JogosZerados.Create(Application);
  Result := GlobalFrm_JogoZerado;
end;

end.
