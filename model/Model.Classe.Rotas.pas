unit Model.Classe.Rotas;

interface

uses Model.Interfaces.Rotas,uConexao,System.SysUtils,System.Classes,Dialogs,
     Utilidades.Modelo;

type
  TModelRotas = class(TInterfacedObject, iRotas)
  private
    FCodigo : integer;
    FNum_Rota : integer;
    FCod_Entregador : integer;
    FNum_Pedido : integer;
    FStatus : string;

    procedure SetCodigo(const Value: integer);
    procedure SetNum_Rota(const Value: integer);
    procedure SetCod_Entregador(const Value: integer);
    procedure SetNum_Pedido(const Value: integer);
    procedure SetStatus(const Value: string);
  public
    constructor Create;
    destructor destroy; override;

    property Codigo : integer read FCodigo write SetCodigo;
    property Num_Rota : integer read FNum_Rota write SetNum_Rota;
    property Cod_Entregador : integer read FCod_Entregador write SetCod_Entregador;
    property Num_Pedido : integer read FNum_Pedido write SetNum_Pedido;
    property Status : string read FStatus write SetStatus;

    procedure InserirRota(p_Num_Rota : integer; p_Cod_Entregador : integer; p_Num_Pedido : integer; p_Status : string);
    function GeraNumRotas : integer;
  end;

implementation

{ TModelRotas }

constructor TModelRotas.Create;
begin
//
end;

destructor TModelRotas.destroy;
begin
  inherited;
end;

function TModelRotas.GeraNumRotas: integer;
var
  vConsultaRotas : TConexao;
begin
  inherited;
  vConsultaRotas := TConexao.Create;
  try
    with vConsultaRotas.cQuery do
    begin
      sql.Clear;
      sql.Add(' SELECT rNUM_ROTA FROM SP_GERA_NUM_ROTA; ');
      Open;
      if FieldByName('rNUM_ROTA').AsInteger = 0 then
      begin
        Result := 1;
      end else begin
        Result := FieldByName('rNUM_ROTA').AsInteger;
      end;
    end;
  finally
    FreeAndNil(vConsultaRotas);
  end;
end;

procedure TModelRotas.InserirRota(p_Num_Rota, p_Cod_Entregador,
  p_Num_Pedido: integer; p_Status: string);
var
  vInserirRota : TConexao;
begin
  vInserirRota := TConexao.Create;
  try
    try
      With vInserirRota.cQuery do
      begin
         SQL.Add(' EXECUTE PROCEDURE SP_ROTA_INSERT(:P_COD_ENTREGADOR,:P_NUM_ROTA,:P_NUM_PEDIDO,:P_STATUS)  ');
         ParamByName('P_COD_ENTREGADOR').AsInteger := p_Cod_Entregador;
         ParamByName('P_NUM_ROTA').AsInteger := p_Num_Rota;
         ParamByName('P_NUM_PEDIDO').AsInteger := p_Num_Pedido;
         ParamByName('P_STATUS').AsString := p_Status;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vInserirRota.Free;
  end;
end;

procedure TModelRotas.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TModelRotas.SetCod_Entregador(const Value: integer);
begin
  FCod_Entregador := Value;
end;

procedure TModelRotas.SetNum_Pedido(const Value: integer);
begin
  FNum_Pedido := Value;
end;

procedure TModelRotas.SetNum_Rota(const Value: integer);
begin
  FNum_Rota := Value;
end;

procedure TModelRotas.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

end.
