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
  DM_Login in 'Forms\Login\DM_Login.pas' {DMB_Login: TDataModule},
  U_CadUsuario in 'Forms\CadUsuario\U_CadUsuario.pas' {Frm_CadUsuario},
  DM_CadUsuario in 'Forms\CadUsuario\DM_CadUsuario.pas' {DMB_CadUsuario: TDataModule},
  U_Menu in 'Forms\Menu\U_Menu.pas' {Frm_Menu},
  U_CadDesenvolvedora in 'Forms\CadDesenvolvedora\U_CadDesenvolvedora.pas' {Frm_CadDesenv},
  U_CadPlataforma in 'Forms\CadPlataforma\U_CadPlataforma.pas' {Frm_CadPlataforma},
  U_CadTipoCat in 'Forms\CadTipoCat\U_CadTipoCat.pas' {Frm_CadTipoCat},
  U_CadJogos in 'Forms\CadJogos\U_CadJogos.pas' {Frm_CadJogos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Inicial, Frm_Inicial);
  Application.CreateForm(Tfrm_ConfigIni, frm_ConfigIni);
  Application.CreateForm(Tdm_Dados, dm_Dados);
  Application.CreateForm(TDMB_CadUsuario, DMB_CadUsuario);
  Application.CreateForm(TFrm_Menu, Frm_Menu);
  Application.CreateForm(TFrm_CadDesenv, Frm_CadDesenv);
  Application.CreateForm(TFrm_CadDesenv, Frm_CadDesenv);
  Application.CreateForm(TFrm_CadPlataforma, Frm_CadPlataforma);
  Application.CreateForm(TFrm_CadTipoCat, Frm_CadTipoCat);
  Application.CreateForm(TFrm_CadJogos, Frm_CadJogos);
  Application.Run;
end.
