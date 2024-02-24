program ProjetoControleJogos;

uses
  Vcl.Forms,
  Inicial in 'Inicial.pas' {Frm_Inicial},
  Vcl.Themes,
  Vcl.Styles,
  U_login in 'Forms\Login\U_login.pas' {Frm_login},
  U_Biblioteca in 'Classes\U_Biblioteca.pas',
  U_constantes in 'Classes\U_constantes.pas',
  uCrpt in 'Classes\uCrpt.pas',
  U_ConfigIni in 'Forms\ConfigIni\U_ConfigIni.pas' {frm_ConfigIni},
  U_Dados in 'Forms\Dados\U_Dados.pas' {dm_Dados: TDataModule},
  DM_Login in 'Forms\Login\DM_Login.pas' {DMB_Login: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Inicial, Frm_Inicial);
  Application.CreateForm(Tfrm_ConfigIni, frm_ConfigIni);
  Application.CreateForm(Tdm_Dados, dm_Dados);
  Application.Run;
end.
