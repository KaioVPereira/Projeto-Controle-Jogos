unit DM_Login;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMB_Login = class(TDataModule)
    fd_QueryLogin: TFDQuery;
    fd_QueryLoginCONTROLE_USUARIO: TIntegerField;
    fd_QueryLoginUSUARIO: TStringField;
    fd_QueryLoginSENHA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMB_Login: TDMB_Login;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
