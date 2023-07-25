unit View.Pedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Cadastro.Modelo, Vcl.ExtCtrls,
  Vcl.StdCtrls, Utilidades.Modelo, Model.Classe.Pedido, uConexao, UDMConex,
  Model.Interfaces.Pedido, Vcl.DBCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask,
  UViaCEP, Vcl.Grids, Vcl.DBGrids;

type
  TfPedidos = class(TfModeloCadastro)
    Panel1: TPanel;
    edtNumPedido: TEdit;
    Label3: TLabel;
    cbCliente: TDBLookupComboBox;
    Label4: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    edtCEP: TMaskEdit;
    Label6: TLabel;
    edtRua: TEdit;
    Label7: TLabel;
    edtNumero: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    edtCidade: TEdit;
    Label10: TLabel;
    edtPais: TEdit;
    btnBuscarCEP: TButton;
    Shape2: TShape;
    Label11: TLabel;
    edtNumRefProd: TEdit;
    edtProduto: TEdit;
    btnIncluirProduto: TButton;
    cdsProdutoSelecionado: TClientDataSet;
    dsProdutoSelecionado: TDataSource;
    cdsProdutoSelecionadoNumRef: TStringField;
    cdsProdutoSelecionadoProduto: TStringField;
    cdsProdutoSelecionadoQuant: TIntegerField;
    edtQuant: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtObs: TEdit;
    cdsProdutoSelecionadoCodigo: TIntegerField;
    Panel2: TPanel;
    btnNovo: TButton;
    Salvar: TButton;
    btnLimparDados: TButton;
    btnFechar: TButton;
    dbGridProduto: TDBGrid;
    edtPesquisa: TEdit;
    Label14: TLabel;
    btnPesqPedido: TButton;
    Panel3: TPanel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure edtNumRefProdExit(Sender: TObject);
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure btnLimparDadosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesqPedidoClick(Sender: TObject);
    procedure dbGridProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure GravarPedido;
    procedure LimparCampos;
    procedure GerarNovoPedido;
    procedure ApagarPedido;
    procedure PesquisarPedido(vNumPedido : integer);
    procedure AtualizaPedido(vStatus : string; vNum_Pedido : integer);
    function PesquisarPedidoStatus(vNumPedido : integer) : boolean;
    function VerificaPedidoExiste(vPedido : integer) : boolean;
  public
    { Public declarations }
  end;

var
  fPedidos: TfPedidos;
  vCodProduto : integer;

implementation

uses
  MaskUtils;

{$R *.dfm}


procedure TfPedidos.ApagarPedido;
var
  vPedidoApagar : iPedido;
  vCodProd, vQuant : integer;
  vNumRefProd, vProduto : string;
begin
  vPedidoApagar := TModelPedido.Create;
  vPedidoApagar.DeletarPedido(StrToInt(edtNumPedido.Text));
end;

procedure TfPedidos.AtualizaPedido(vStatus: string; vNum_Pedido : integer);
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

procedure TfPedidos.btnBuscarCEPClick(Sender: TObject);
var
  vViaCep : TViaCEP;
  Endereco : TStringList;
begin
  inherited;
  vViaCep := TViaCEP.Create;
  try
    Endereco := vViaCep.DadosCEP(edtCEP.Text);
    edtRua.Text := Endereco[0];
    edtBairro.Text := Endereco[1];
    edtCidade.Text := Endereco[3];
    edtNumero.SetFocus;
  finally
    FreeAndNil(vViaCep);
  end;
end;

procedure TfPedidos.btnFecharClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfPedidos.btnIncluirProdutoClick(Sender: TObject);
begin
  inherited;
  with cdsProdutoSelecionado do
  begin
    Append;
    FieldByName('NumRef').Value := edtNumRefProd.Text;
    FieldByName('Produto').Value := edtProduto.Text;
    FieldByName('Quant').Value := strtoint(edtQuant.Text);
    FieldByName('Codigo').Value := vCodProduto;
    Post;
    edtNumRefProd.Clear;
    edtProduto.Clear;
    edtQuant.Clear;
    edtObs.SetFocus;
  end;
end;

procedure TfPedidos.btnLimparDadosClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
end;

procedure TfPedidos.btnNovoClick(Sender: TObject);
begin
  inherited;
  GerarNovoPedido;
end;

procedure TfPedidos.btnPesqPedidoClick(Sender: TObject);
begin
  inherited;
  if PesquisarPedidoStatus(StrToInt(edtPesquisa.Text)) = True then
    raise Exception.Create('Pedido saiu para entrega. Nao poder� movimenta-lo.');

  PesquisarPedido(StrToInt(edtPesquisa.Text));
end;

procedure TfPedidos.dbGridProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
  begin
     if MessageDlg('Deseja Excluir esse Produto Selecionado?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
     begin
       cdsProdutoSelecionado.Delete;
     end;
  end;
end;

procedure TfPedidos.edtNumRefProdExit(Sender: TObject);
var
  vPedido : TModelPedido;
begin
  inherited;
  vPedido := TModelPedido.Create;
  try
    edtProduto.Text := vPedido.BuscarProduto_RefProduto(edtNumRefProd.Text);
    vCodProduto := vPedido.Cod_produto;
  finally
    FreeAndNil(vPedido);
  end;
end;

procedure TfPedidos.FormCreate(Sender: TObject);
var
  vPedido : iPedido;
  vClienteTotal : TConexao;
  vNome : string;
begin
  inherited;
  vPedido := TModelPedido.Create;
  edtNumPedido.Text := Format('%5.5d',[vPedido.GeraNumPedido]);
  cdsProdutoSelecionado.EmptyDataSet;
end;

procedure TfPedidos.GerarNovoPedido;
var
  vNovoPedido : iPedido;
begin
  vNovoPedido := TModelPedido.Create;
  LimparCampos;
  edtNumPedido.Text := Format('%5.5d',[vNovoPedido.GeraNumPedido]);
end;

procedure TfPedidos.GravarPedido;
var
  vPedidoSalvar : iPedido;
  vCodProd, vQuant : integer;
  vNumRefProd, vProduto : string;
begin
  vPedidoSalvar := TModelPedido.Create;
  try
    try
      with cdsProdutoSelecionado do begin
        First;
        while not Eof do
        begin
          vCodProd    := FieldByName('Codigo').Value;
          vQuant      := FieldByName('Quant').Value;
          vNumRefProd := FieldByName('NumRef').Value;
          vProduto    := FieldByName('Produto').Value;
          vPedidoSalvar.InserirPedido(cbCliente.KeyValue,vCodProd,StrToInt(edtNumPedido.Text),vQuant,edtObs.Text,edtCEP.Text,edtRua.Text,StrToInt(edtNumero.Text),
                                      edtBairro.Text,edtCidade.Text,'',edtPais.Text);
          Next;
        end;
      end;
    except
      raise Exception.Create('Error durante a inser��o do pedido. Movimenta��o Cancelada.');
      exit
    end;
  finally
    LimparCampos;
    MessageDlg('Pedido Inserido com Sucesso!',mtInformation,[mbok],0);
  end;
end;

procedure TfPedidos.LimparCampos;
begin
  edtNumPedido.Text := '00000';
  edtCEP.Text := '__.___-___';
  cbCliente.KeyValue := 0;
  cbCliente.SetFocus;
  edtRua.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  edtPais.Text;
  edtNumRefProd.Clear;
  edtProduto.Clear;
  edtQuant.Clear;
  edtObs.Clear;
  edtPesquisa.Text := '0';
  cdsProdutoSelecionado.EmptyDataSet;
end;

procedure TfPedidos.PesquisarPedido(vNumPedido: integer);
var
  vPesquisaPedido : TConexao;
begin
  inherited;
  vPesquisaPedido := TConexao.Create;
  LimparCampos;
  try
    with vPesquisaPedido.cQuery do
    begin
      sql.Clear;
      sql.Add(' Select rNUM_PEDIDO,rCOD_CLIENTE,rCEP,rLOGRADOURO,rNUMERO,          ');
      sql.Add('        rBAIRRO,rCIDADE,rPAIS,rCOD_PRODUTO,rNUM_REF,rDESCRICAO,rQTD ');
      sql.Add(' from SP_PEDIDO_SELECT(:pNUM_PEDIDO)                                ');
      ParamByName('pNUM_PEDIDO').AsInteger := vNumPedido;
      Open;
      if IsEmpty then
      begin
        MessageDlg('N�mero de Pedido n�o encontrado. Tente novamente.',mtInformation,[mbok],0);
      end else begin
        edtNumPedido.Text := Format('%5.5d',[FieldByName('rNUM_PEDIDO').AsInteger]);
        cbCliente.KeyValue := FieldByName('rCOD_CLIENTE').Value;
        edtCEP.Text := FormatMaskText('00.000-000;0;',FieldByName('rCEP').Value);
        edtRua.Text := FieldByName('rLOGRADOURO').Value;
        edtNumero.Text := IntToStr(FieldByName('rNUMERO').Value);
        edtBairro.Text := FieldByName('rBAIRRO').Value;
        edtCidade.Text := FieldByName('rCIDADE').Value;
        edtPais.Text   := FieldByName('rPAIS').Value;
        while not eof do
        begin
          cdsProdutoSelecionado.Append;
          cdsProdutoSelecionado.FieldByName('NumRef').Value  := FieldByName('rNUM_REF').Value;
          cdsProdutoSelecionado.FieldByName('Produto').Value := FieldByName('rDESCRICAO').Value;
          cdsProdutoSelecionado.FieldByName('Quant').Value   := FieldByName('rQTD').Value;
          cdsProdutoSelecionado.FieldByName('Codigo').Value  := FieldByName('rCOD_PRODUTO').Value;
          cdsProdutoSelecionado.Post;
        Next;
        end;
      end;
    end;
  finally
    FreeAndNil(vPesquisaPedido);
  end;
end;

function TfPedidos.PesquisarPedidoStatus(vNumPedido: integer): boolean;
var
  vPesquisaPedidoStatus : TConexao;
begin
  vPesquisaPedidoStatus := TConexao.Create;
  try
    with vPesquisaPedidoStatus.cQuery do
    begin
      sql.Add(' Select 1 from TB_PEDIDO tp where tp.NUM_PEDIDO =:P_NUM_PEDIDO and tp.STATUS_PEDIDO =:P_STATUS ');
      ParamByName('P_NUM_PEDIDO').AsInteger := vNumPedido;
      ParamByName('P_STATUS').AsString := 'FECHADO';
      Open;
      if not IsEmpty then
         Result := True
      else
         Result := False;
    end;
  finally
    FreeAndNil(vPesquisaPedidoStatus);
  end;
end;

procedure TfPedidos.SalvarClick(Sender: TObject);
begin
  inherited;
  if ((cbCliente.KeyValue = null) or (edtCEP.Text = '  .   -   ')) then
     raise Exception.Create('Faltando dados necess�rios para gravar o pedido.');

  if cdsProdutoSelecionado.IsEmpty then
     raise Exception.Create('Faltando acrescentar os PRODUTOS no pedido.');

  if VerificaPedidoExiste(StrToInt(edtNumPedido.Text)) = True then
  begin
    ApagarPedido;
    GravarPedido;
  end else begin
    GravarPedido;
  end;
end;

function TfPedidos.VerificaPedidoExiste(vPedido: integer): boolean;
var
  vPedidoExiste : TConexao;
begin
  inherited;
  vPedidoExiste := TConexao.Create;
  try
    with vPedidoExiste.cQuery do
    begin
      sql.Clear;
      sql.Add(' Select Count(*) as CONTADOR from SP_PEDIDO_SELECT(:P_NUM_PEDIDO) ');
      ParamByName('P_NUM_PEDIDO').AsInteger := vPedido;
      Open;
      if FieldByName('CONTADOR').AsInteger > 0 then
         Result := True
      else
         Result := False;
    end;
  finally
    FreeAndNil(vPedidoExiste);
  end;
end;

end.
