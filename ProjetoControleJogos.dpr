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
  U_CadJogos in 'Forms\CadJogos\U_CadJogos.pas' {Frm_CadJogos},
  U_ConsultaExistente in 'Forms\ConsultaExistente\U_ConsultaExistente.pas' {Frm_ConsultaExistente},
  U_ConsultaDesnvol in 'Forms\ConsultaExistente\ConsultaDesenvol\U_ConsultaDesnvol.pas' {Frm_ConsultaDesenvol},
  U_ConsultaCat in 'Forms\ConsultaExistente\ConsultaCat\U_ConsultaCat.pas' {Frm_ConsultaCategoria},
  U_ConsultaPlat in 'Forms\ConsultaExistente\ConsultaPlat\U_ConsultaPlat.pas' {Frm_ConsultaPlat},
  U_ConsultaJogos in 'Forms\ConsultaExistente\ConsultaJogos\U_ConsultaJogos.pas' {Frm_ConsultaJogos},
  U_Start in 'Forms\Start\U_Start.pas' {Frm_Start};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Inicial, Frm_Inicial);
  Application.CreateForm(Tfrm_ConfigIni, frm_ConfigIni);
  Application.CreateForm(Tdm_Dados, dm_Dados);
  Application.CreateForm(TFrm_ConsultaCategoria, Frm_ConsultaCategoria);
  Application.CreateForm(TFrm_ConsultaPlat, Frm_ConsultaPlat);
  Application.CreateForm(TFrm_ConsultaJogos, Frm_ConsultaJogos);
  Application.CreateForm(TFrm_Start, Frm_Start);
  Application.Run;
end.
