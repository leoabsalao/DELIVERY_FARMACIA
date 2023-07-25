unit View.MainProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Principal, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, UDMConex, Vcl.Buttons,
  View.Pedidos, Model.Classe.Produto, Model.Interfaces.Produto,
  Model.Classe.Pedido, View.Produtos, View.RotaPedidos, Model.Classe.Pessoa,
  View.VerificaStatusPedido;

type
  TfMainProjeto = class(TfPrincipal)
    pnlTopoPrincipal: TPanel;
    MainMenu: TMainMenu;
    Sistema1: TMenuItem;
    Sairdaaplicao1: TMenuItem;
    Sobre1: TMenuItem;
    actMenu: TActionList;
    actSairSistema: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    lblHoraAtual: TLabel;
    TimerMain: TTimer;
    lblDataAtual: TLabel;
    Movimentao1: TMenuItem;
    Pedidos1: TMenuItem;
    btnGerarPedidos: TSpeedButton;
    actPedidos: TAction;
    btnCadastroProdutos: TSpeedButton;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    actProdutos: TAction;
    btnRotasPedidos: TSpeedButton;
    actRotasEntregas: TAction;
    RotasEntregas1: TMenuItem;
    btnTelaVerificaStatus: TSpeedButton;
    actVerificaStatus: TAction;
    StatusdoPedido1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actSairSistemaExecute(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
    procedure actPedidosExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actRotasEntregasExecute(Sender: TObject);
    procedure actVerificaStatusExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMainProjeto: TfMainProjeto;

implementation

{$R *.dfm}

uses Utilidades.Modelo;

procedure TfMainProjeto.actPedidosExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfPedidos,fPedidos);
  fPedidos.Show;
end;

procedure TfMainProjeto.actProdutosExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfProdutos,fProdutos);
  fProdutos.Show;
end;

procedure TfMainProjeto.actRotasEntregasExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfRotaPedidos,fRotaPedidos);
  fRotaPedidos.Show;
end;

procedure TfMainProjeto.actSairSistemaExecute(Sender: TObject);
begin
  inherited;
  if application.MessageBox('Voc� tem certeza que deseja sair do sistema?','Sair da Aplica��o',mb_yesno+mb_iconquestion) = idyes then
  begin
   Application.Terminate;
  end;
end;

procedure TfMainProjeto.actVerificaStatusExecute(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TfVerificaPedido,fVerificaPedido);
    fVerificaPedido.Show;
end;

procedure TfMainProjeto.FormCreate(Sender: TObject);
var
  vUtil : TUtilidades;
begin
  inherited;
  try
    vUtil := TUtilidades.Create;
    self.Caption := 'DELIVERY&FARMA - Sistema de Delivery para as Farmacias da Regi�o. '+'Vers�o: '+vUtil.GetVersaoArq;
  finally
    FreeAndNil(vUtil);
  end;
end;

procedure TfMainProjeto.TimerMainTimer(Sender: TObject);
var
  vHoraData : TUtilidades;
begin
  inherited;
  try
    vHoraData := TUtilidades.Create;
    lblHoraAtual.Caption := vHoraData.HoraAtual;
    lblDataAtual.Caption := vHoraData.DataAtual;
  finally
    FreeAndNil(vHoraData);
  end;

end;

end.
