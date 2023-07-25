unit View.VerificaStatusPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Cadastro.Modelo, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uConexao,
  UDMConex, Utilidades.Modelo, View.Pedidos;

type
  TfVerificaPedido = class(TfModeloCadastro)
    Panel2: TPanel;
    Label14: TLabel;
    btnSalvar: TButton;
    btnFechar: TButton;
    edtPesquisa: TEdit;
    btnPesqPedido: TButton;
    Panel1: TPanel;
    GridStatus: TDBGrid;
    Panel3: TPanel;
    cdsStatusPedido: TClientDataSet;
    DsStatusPedido: TDataSource;
    cdsStatusPedidoNUM_ROTA: TIntegerField;
    cdsStatusPedidoNUM_PEDIDO: TIntegerField;
    cdsStatusPedidoCOD_ENTREGADOR: TIntegerField;
    cdsStatusPedidoENTREGADOR: TStringField;
    cdsStatusPedidoSTATUS: TStringField;
    Label3: TLabel;
    edtNumPedido: TEdit;
    Label4: TLabel;
    cbStatus: TComboBox;
    Label5: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridStatusDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaStatus;
    procedure AtualizaRotas(vNum_Pedido : integer);
    procedure AtualizaPedidoStatus(vNum_Pedido : integer; vStatus : string);
  public
    { Public declarations }
  end;

var
  fVerificaPedido: TfVerificaPedido;

implementation

{$R *.dfm}

procedure TfVerificaPedido.AtualizaPedidoStatus(vNum_Pedido: integer;
  vStatus: string);
var
  vAtualizaStatus : TConexao;
begin
  vAtualizaStatus := TConexao.Create;
  try
    with vAtualizaStatus.cQuery do
    begin
      sql.Clear;
      sql.Add(' UPDATE TB_PEDIDO SET STATUS_PEDIDO =:P_STATUS WHERE NUM_PEDIDO =:P_NUM_PEDIDO ');
      ParamByName('P_NUM_PEDIDO').AsInteger := vNum_Pedido;
      ParamByName('P_STATUS').AsString := vStatus;
      ExecSQL;
    end;
  finally
    FreeAndNil(vAtualizaStatus);
  end;
end;

procedure TfVerificaPedido.AtualizaRotas(vNum_Pedido: integer);
var
  vAtualizaRotas : TConexao;
begin
  vAtualizaRotas := TConexao.Create;
  try
    with vAtualizaRotas.cQuery do
    begin
      sql.Clear;
      sql.Add(' UPDATE TB_ROTAS SET STATUS =:P_STATUS WHERE NUM_PEDIDO =:P_NUM_PEDIDO ');
      ParamByName('P_NUM_PEDIDO').AsInteger := vNum_Pedido;
      ParamByName('P_STATUS').AsString := cbStatus.Text;
      ExecSQL;
    end;
  finally
    FreeAndNil(vAtualizaRotas);
  end;
end;

procedure TfVerificaPedido.btnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfVerificaPedido.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if cdsStatusPedido.RecordCount = null then
    raise Exception.Create('N�o existeM pedidos PENDENTES no momento. Movimentacao Cancelada.');

  if cbStatus.ItemIndex = -1 then
    raise Exception.Create('Selecione o campo de Status para atualizar. Movimentacao Cancelada');

  AtualizaRotas(StrToInt(edtNumPedido.Text));

  if (cbStatus.ItemIndex = 1) or (cbStatus.ItemIndex = 2) then
    AtualizaPedidoStatus(StrToInt(edtNumPedido.Text),'FECHADO')
  else if cbStatus.ItemIndex = 0 then
    AtualizaPedidoStatus(StrToInt(edtNumPedido.Text),'ABERTO');

  CarregaStatus;
end;

procedure TfVerificaPedido.CarregaStatus;
var
  vStatusPedido : TConexao;
begin
  vStatusPedido := TConexao.Create;
  try
    with vStatusPedido.cQuery do begin
      sql.Add(' Select tr.STATUS,tr.NUM_ROTA,tr.NUM_PEDIDO,(Select tt.NOME from TB_PESSOA tt where tt.CODIGO = tr.COD_ENTREGADOR) as ENTREGADOR,tr.COD_ENTREGADOR ');
      sql.Add(' from TB_ROTAS tr  ');
      Open;
      First;
      cdsStatusPedido.EmptyDataSet;
      while not eof do
      begin
        cdsStatusPedido.Append;
        cdsStatusPedido.FieldByName('NUM_ROTA').AsInteger := FieldByName('NUM_ROTA').AsInteger;
        cdsStatusPedido.FieldByName('NUM_PEDIDO').AsInteger := FieldByName('NUM_PEDIDO').AsInteger;
        cdsStatusPedido.FieldByName('COD_ENTREGADOR').AsInteger := FieldByName('COD_ENTREGADOR').AsInteger;
        cdsStatusPedido.FieldByName('ENTREGADOR').AsString := FieldByName('ENTREGADOR').AsString;
        cdsStatusPedido.FieldByName('STATUS').AsString := FieldByName('STATUS').AsString;
        cdsStatusPedido.Post;
        Next;
      end;
    end;
  finally
    FreeAndNil(vStatusPedido);
  end;
end;

procedure TfVerificaPedido.FormCreate(Sender: TObject);
begin
  inherited;
  CarregaStatus;
end;

procedure TfVerificaPedido.GridStatusDblClick(Sender: TObject);
begin
  inherited;
   edtNumPedido.Text := IntToStr(cdsStatusPedidoNUM_PEDIDO.AsInteger);
end;

end.