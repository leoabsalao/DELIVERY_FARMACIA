unit Model.Classe.Produto;

interface
uses Model.Interfaces.Produto,uConexao,System.SysUtils, System.Classes;

type
  TProduto = class(TInterfacedObject, iProduto)
  private
    FCodigo : integer;
    FCod_TipoProduto : integer;
    FTipoProduto : string;
    FDescricao : string;
    FNumRef   : string;
    FQuant : integer;
    FDT_Validade : string;
    FPreco_Unit : real;
    FTipoComum : boolean;
    FTipoControlado : boolean;
    FTipoSensivel : boolean;
    FPresc_Medica : string;
    FCuidado_Armaz : string;

    procedure SetCodigo(const Value: integer);
    procedure SetCod_TipoProduto(const Value: integer);
    procedure SetTipoProduto(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetNumRef(const Value: string);
    procedure SetQuant(const Value: integer);
    procedure SetDT_Validade(const Value: string);
    procedure SetPreco_Unit(const Value: real);
    procedure SetTipoComum(const Value: boolean);
    procedure SetTipoControlado(const Value: boolean);
    procedure SetTipoSensivel(const Value: boolean);
    procedure SetPresc_Medica(const Value: string);
    procedure SetCuidado_Armaz(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    property Codigo : integer read FCodigo write SetCodigo;
    property Cod_TipoProduto : integer read FCod_TipoProduto write SetCod_TipoProduto;
    property TipoProduto : string read FTipoProduto write SetTipoProduto;
    property Descricao : string read FDescricao write SetDescricao;
    property NumRef : string read FNumRef write SetNumRef;
    property Quant : integer read FQuant write SetQuant;
    property DT_Validade : string read FDT_Validade write SetDT_Validade;
    property Preco_Unit : real read FPreco_Unit write SetPreco_Unit;
    property TipoComum : boolean read FTipoComum write SetTipoComum;
    property TipoControlado : boolean read FTipoControlado write SetTipoControlado;
    property TipoSensivel : boolean read FTipoSensivel write SetTipoSensivel;
    property Presc_Medica : string read FPresc_Medica write SetPresc_Medica;
    property Cuidado_Armaz : string read FCuidado_Armaz write SetCuidado_Armaz;


    procedure Inserir(p_Cod_TipoProduto : integer; p_Descricao : string; p_NUM_REF : string;
                        p_Quant : integer; p_DT_Validade : string; p_Preco_Unit : real; p_TipoComum : boolean;
                        p_TipoControlado : boolean; p_TipoSensivel : boolean; p_PrescMedica : string;
                        p_CuidadoArmaz : string);
    procedure Alterar(p_Id : integer; p_Cod_TipoProduto : integer; p_Descricao : string; p_NUM_REF : string;
                        p_Quant : integer; p_DT_Validade : string; p_Preco_Unit : real; p_TipoComum : boolean;
                        p_TipoControlado : boolean; p_TipoSensivel : boolean; p_PrescMedica : string;
                        p_CuidadoArmaz : string);
    procedure Deletar(p_ID : integer);
  end;

implementation

{ TProduto }

procedure TProduto.Alterar(p_Id, p_Cod_TipoProduto: integer; p_Descricao,
  p_NUM_REF: string; p_Quant: integer; p_DT_Validade: string;
  p_Preco_Unit: real; p_TipoComum, p_TipoControlado, p_TipoSensivel: boolean;
  p_PrescMedica, p_CuidadoArmaz: string);
var
  vAlterar : TConexao;
begin
  vAlterar := TConexao.Create;
  try
    try
      With vAlterar.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_PRODUTO_UPDATE(:P_ID,:P_COD_TIPOPRODUTO,:P_DESCRICAO,:P_NUM_REF,:P_QUANT,:P_DT_VALIDADE,:P_PRECO_UNIT ');
         SQL.Add('  :P_TIPO_COMUM,:P_TIPO_CONTROLADO,:P_TIPO_SENSIVEL,:P_PRESC_MEDICA,:P_CUIDADOS_ARMAZ) ');
         ParamByName('P_ID').AsInteger := p_Id;
         ParamByName('P_COD_TIPOPRODUTO').AsInteger := p_Cod_TipoProduto;
         ParamByName('P_DESCRICAO').AsString := p_Descricao;
         ParamByName('P_NUM_REF').AsString := p_NUM_REF;
         ParamByName('P_QUANT').AsInteger := p_Quant;
         ParamByName('P_DT_VALIDADE').AsString := p_DT_Validade;
         ParamByName('P_PRECO_UNIT').AsCurrency := p_Preco_Unit;
         ParamByName('P_TIPO_COMUM').AsBoolean := p_TipoComum;
         ParamByName('P_TIPO_CONTROLADO').AsBoolean := p_TipoControlado;
         ParamByName('P_TIPO_SENSIVEL').AsBoolean := p_TipoSensivel;
         ParamByName('P_PRESC_MEDICA').AsString := p_PrescMedica;
         ParamByName('P_CUIDADOS_ARMAZ').AsString := p_CuidadoArmaz;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vAlterar.Free;
  end;
end;

constructor TProduto.Create;
begin
   //
end;

procedure TProduto.Deletar(p_ID : integer);
var
  vExcluir : TConexao;
begin
  vExcluir := TConexao.Create;
  try
    try
      With vExcluir.cQuery do
      begin
         SQL.Add(' EXECUTE PROCEDURE SP_PRODUTO_DELETE(:P_ID) ');
         ParamByName('P_ID').AsInteger := p_ID;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vExcluir.Free;
  end;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

procedure TProduto.Inserir(p_Cod_TipoProduto: integer; p_Descricao,
  p_NUM_REF: string; p_Quant: integer; p_DT_Validade: string;
  p_Preco_Unit: real; p_TipoComum, p_TipoControlado, p_TipoSensivel: boolean;
  p_PrescMedica, p_CuidadoArmaz: string);
var
  vInserir : TConexao;
begin
  vInserir := TConexao.Create;
  try
    try
      With vInserir.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_PRODUTO_INSERT(:P_COD_TIPOPRODUTO,:P_DESCRICAO,:P_NUM_REF,:P_QUANT,:P_DT_VALIDADE,:P_PRECO_UNIT, ');
         SQL.Add(':P_TIPO_COMUM,:P_TIPO_CONTROLADO,:P_TIPO_SENSIVEL,:P_PRESC_MEDICA,:P_CUIDADOS_ARMAZ) ');
         ParamByName('P_COD_TIPOPRODUTO').AsInteger := p_Cod_TipoProduto;
         ParamByName('P_DESCRICAO').AsString := p_Descricao;
         ParamByName('P_NUM_REF').AsString := p_NUM_REF;
         ParamByName('P_QUANT').AsInteger := p_Quant;
         ParamByName('P_DT_VALIDADE').AsString := p_DT_Validade;
         ParamByName('P_PRECO_UNIT').AsInteger := 0;
         ParamByName('P_TIPO_COMUM').AsBoolean := p_TipoComum;
         ParamByName('P_TIPO_CONTROLADO').AsBoolean := p_TipoControlado;
         ParamByName('P_TIPO_SENSIVEL').AsBoolean := p_TipoSensivel;
         ParamByName('P_PRESC_MEDICA').AsString := p_PrescMedica;
         ParamByName('P_CUIDADOS_ARMAZ').AsString := p_CuidadoArmaz;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vInserir.Free;
  end;
end;

procedure TProduto.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetCod_TipoProduto(const Value: integer);
begin
  FCod_TipoProduto := Value;
end;

procedure TProduto.SetCuidado_Armaz(const Value: string);
begin
  FCuidado_Armaz := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetDT_Validade(const Value: string);
begin
  FDT_Validade := Value;
end;

procedure TProduto.SetNumRef(const Value: string);
begin
  FNumRef := Value;
end;

procedure TProduto.SetPreco_Unit(const Value: real);
begin
  FPreco_Unit := Value;
end;

procedure TProduto.SetPresc_Medica(const Value: string);
begin
  FPresc_Medica := Value;
end;

procedure TProduto.SetQuant(const Value: integer);
begin
  FQuant := Value;
end;

procedure TProduto.SetTipoComum(const Value: boolean);
begin
  FTipoComum := Value;
end;

procedure TProduto.SetTipoControlado(const Value: boolean);
begin
  FTipoControlado := Value;
end;

procedure TProduto.SetTipoProduto(const Value: string);
begin
  FTipoProduto := Value;
end;

procedure TProduto.SetTipoSensivel(const Value: boolean);
begin
  FTipoSensivel := Value;
end;

end.
