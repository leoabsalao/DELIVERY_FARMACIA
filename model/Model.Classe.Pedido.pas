unit Model.Classe.Pedido;

interface
uses Model.Interfaces.Pedido,uConexao,System.SysUtils,System.Classes,Dialogs,
  Utilidades.Modelo;

type
 TModelPedido = class(TInterfacedObject, iPedido)
 private
   FCodigo : integer;
   FNum_Pedido : integer;
   FCod_cliente : integer;
   FCod_Produto : integer;
   FCliente : string;
   FProduto : string;
   FCep : string;
   FLogradouro : string;
   FNumero : integer;
   FBairro : string;
   FCidade : string;
   FPais : string;
   FQuantidade : integer;
   FObs : string;
   procedure SetCodigo(const Value : integer);
   procedure SetNum_Pedido(const Value : integer);
   procedure SetCod_cliente(const Value : integer);
   procedure SetCod_produto(const Value : integer);
   procedure SetCliente(const Value : string);
   procedure SetProduto(const Value : string);
   procedure SetCep(const Value : string);
   procedure SetLogradouro(const Value : string);
   procedure SetNumero(const Value : integer);
   procedure SetBairro(const Value : string);
   procedure SetCidade(const Value : string);
   procedure SetPais(const Value : string);
   procedure SetQuantidade(const Value : integer);
   procedure SetObs(const Value : string);
 public
   constructor Create;
   destructor Destroy; override;

   property Codigo : integer read FCodigo write SetCodigo;
   property Num_Pedido : integer read FNum_Pedido write SetNum_Pedido;
   property Cod_cliente : integer read FCod_cliente write SetCod_cliente;
   property Cod_produto : integer read FCod_produto write SetCod_produto;
   property Cliente : string read FCliente write SetCliente;
   property Produto : string read FProduto write SetProduto;
   property Cep : string read FCep write SetCep;
   property Logradouro : string read FLogradouro write SetLogradouro;
   property Numero : integer read FNumero write SetNumero;
   property Bairro : string read FBairro write SetBairro;
   property Cidade : string read FCidade write SetCidade;
   property Pais : string read FPais write SetPais;
   property Quantidade : integer read FQuantidade write SetQuantidade;
   property Obs : string read FObs write SetObs;

    procedure InserirPedido(p_Cod_Cliente : integer; p_Cod_Produto : integer; p_Num_Pedido : integer; p_Qtd : integer;
                            p_Obs : string; p_Cep : string; p_Logradouro : string; p_Numero : integer; p_Bairro : string;
                            p_Cidade : string; p_Estado : string; p_Pais : string);
    procedure AlterarPedido(p_Id : integer; p_Cod_Cliente : integer; p_Cod_Produto : integer; p_Num_Pedido : integer; p_Qtd : integer;
                            p_Obs : string; p_Cep : string; p_Logradouro : string; p_Numero : integer; p_Bairro : string;
                            p_Cidade : string; p_Estado : string; p_Pais : string);
    procedure DeletarPedido(p_Num_Pedido : integer);
    function GeraNumPedido : integer;
    function BuscarProduto_RefProduto(vNumRef : string) : string;
 end;

implementation

var vConex : TConexao;
    vUtilidades : TUtilidades;

procedure TModelPedido.AlterarPedido(p_Id, p_Cod_Cliente, p_Cod_Produto,
  p_Num_Pedido, p_Qtd: integer; p_Obs, p_Cep, p_Logradouro: string;
  p_Numero: integer; p_Bairro, p_Cidade, p_Estado, p_Pais: string);
begin

end;

function TModelPedido.BuscarProduto_RefProduto(vNumRef: string): string;
var
  vConsultaProduto : TConexao;
begin
  inherited;
  vConsultaProduto := TConexao.Create;
  try
    with vConsultaProduto.cQuery do
    begin
      sql.Clear;
      sql.Add(' Select codigo, descricao from tb_produto where NUM_REF =:NUMREF ');
      ParamByName('NUMREF').AsString := vNumRef;
      Open;
      if not Eof then
      begin
         FCod_Produto := FieldByName('codigo').AsInteger;
         FProduto := FieldByName('descricao').AsString;
         Result := FieldByName('descricao').AsString;
      end else begin
        MessageDlg('C�digo do Produto digitado errado, ou Produto inexistente.',mtInformation,[mbok],0);
        exit;
      end;
    end;
  finally
    FreeAndNil(vConsultaProduto);
  end;
end;

constructor TModelPedido.Create;
begin
   //
end;

procedure TModelPedido.DeletarPedido(p_Num_Pedido: integer);
var
  vDelete : TConexao;
begin
  inherited;
  vDelete := TConexao.Create;
  try
    with vDelete.cQuery do
    begin
      sql.Clear;
      sql.Add(' Execute Procedure SP_PEDIDO_DELETE(:P_NUM_PEDIDO) ');
      ParamByName('P_NUM_PEDIDO').AsInteger := p_Num_Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(vDelete);
  end;
end;

destructor TModelPedido.Destroy;
begin
  inherited;
end;

function TModelPedido.GeraNumPedido: integer;
var
  vConsulta : TConexao;
begin
  inherited;
  vConsulta := TConexao.Create;
  try
    with vConsulta.cQuery do
    begin
      sql.Clear;
      sql.Add(' Select rNUM_PEDIDO from SP_GERA_NUM_PEDIDO ');
      Open;
      if FieldByName('rNUM_PEDIDO').AsInteger = 0 then
      begin
        Result := 1;
      end else begin
        Result := FieldByName('rNUM_PEDIDO').AsInteger;
      end;
    end;
  finally
    FreeAndNil(vConsulta);
  end;
end;

procedure TModelPedido.InserirPedido(p_Cod_Cliente, p_Cod_Produto, p_Num_Pedido,
  p_Qtd: integer; p_Obs, p_Cep, p_Logradouro: string; p_Numero: integer;
  p_Bairro, p_Cidade, p_Estado, p_Pais: string);
var
  vInserir : TConexao;
begin
  vInserir := TConexao.Create;
  try
    try
      With vInserir.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_PEDIDO_INSERT(:P_COD_CLIENTE,:P_COD_PRODUTO,:P_NUM_PEDIDO,:P_QTD,:P_OBS,:P_CEP, ');
         SQL.Add(' :P_LOGRADOURO,:P_NUMERO,:P_BAIRRO,:P_CIDADE,:P_ESTADO,:P_PAIS )                                     ');
         ParamByName('P_COD_CLIENTE').AsInteger := p_Cod_Cliente;
         ParamByName('P_COD_PRODUTO').AsInteger := p_Cod_Produto;
         ParamByName('P_NUM_PEDIDO').AsInteger := p_Num_Pedido;
         ParamByName('P_QTD').AsInteger := p_Qtd;
         ParamByName('P_OBS').AsString := p_Obs;
         ParamByName('P_CEP').AsString := vUtilidades.FormataCEP(p_Cep);
         ParamByName('P_LOGRADOURO').AsString := p_Logradouro;
         ParamByName('P_NUMERO').AsInteger := p_Numero;
         ParamByName('P_BAIRRO').AsString := p_Bairro;
         ParamByName('P_CIDADE').AsString := p_Cidade;
         ParamByName('P_ESTADO').AsString := p_Estado;
         ParamByName('P_PAIS').AsString := p_Pais;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vInserir.Free;
  end;
end;

procedure TModelPedido.SetBairro(const Value: string);
begin
   FBairro := Value;
end;

procedure TModelPedido.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TModelPedido.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TModelPedido.SetCliente(const Value: string);
begin
  FCliente := Value;
end;

procedure TModelPedido.SetCodigo(const Value: integer);
begin
 FCodigo := Value;
end;

procedure TModelPedido.SetCod_cliente(const Value: integer);
begin
  FCod_cliente := Value;
end;

procedure TModelPedido.SetCod_produto(const Value: integer);
begin
  FCod_Produto := Value;
end;

procedure TModelPedido.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TModelPedido.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TModelPedido.SetNum_Pedido(const Value: integer);
begin
  FNum_Pedido := Value;
end;

procedure TModelPedido.SetObs(const Value: string);
begin
  FObs := Value;
end;

procedure TModelPedido.SetPais(const Value: string);
begin
  FPais := Value;
end;

procedure TModelPedido.SetProduto(const Value: string);
begin
  FProduto := Value;
end;

procedure TModelPedido.SetQuantidade(const Value: integer);
begin
  FQuantidade := Value;
end;

end.
