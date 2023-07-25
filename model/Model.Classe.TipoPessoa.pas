unit Model.Classe.TipoPessoa;

interface
uses Model.Interfaces.TipoPessoa, uConexao, System.SysUtils, System.Classes;

type
   TModelTipoPessoa = class(TInterfacedObject, iTipoPessoa)
   private
     FCodigo : integer;
     FDescricao : string;
     procedure SetCodigo(const Value: integer);
     procedure SetDescricao(const Value: string);
   public
     constructor Create;
     destructor Destroy; override;

     property Codigo : integer read FCodigo write SetCodigo;
     property Descricao : string read FDescricao write SetDescricao;

     procedure Inserir(p_Descricao : string);
     procedure Deletar(p_Id : integer);
     procedure Alterar(p_Id : integer; p_Descricao : string);
   end;

implementation

var vConex : TConexao;

{ TModelTipoPessoa }

procedure TModelTipoPessoa.Alterar(p_Id : integer; p_Descricao : string);
var
  vAlterar : TConexao;
begin
  vAlterar := TConexao.Create;
  try
    try
      With vAlterar.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_TIPOPESSOA_UPDATE(:P_ID, :P_DESCRICAO) ');
         ParamByName('P_ID').AsInteger := p_Id;
         ParamByName('P_DESCRICAO').AsString := p_Descricao;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na altera��o. Movimentacao Cancelada.');
    end;
  finally
   vAlterar.Free;
  end;
end;

constructor TModelTipoPessoa.Create;
begin
//
end;

procedure TModelTipoPessoa.Deletar(p_Id : integer);
var
  vDelete : TConexao;
begin
  vDelete := TConexao.Create;
  try
    try
      With vDelete.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_TIPOPESSOA_DELETE(:P_ID) ');
         ParamByName('P_ID').AsInteger := p_Id;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na exclus�o. Movimentacao Cancelada.');
    end;
  finally
   vDelete.Free;
  end;
end;

destructor TModelTipoPessoa.Destroy;
begin
  inherited;
end;

procedure TModelTipoPessoa.Inserir(p_Descricao : string);
var
  vInserir : TConexao;
begin
  vInserir := TConexao.Create;
  try
    try
      With vInserir.cQuery do
      begin
         SQL.Add('EXECUTE PROCEDURE SP_TIPOPESSOA_INSERT(:P_DESCRICAO) ');
         ParamByName('P_DESCRICAO').AsString := p_Descricao;
         ExecSQL;
      end;
    except
       raise Exception.Create('Erro na inclus�o. Movimentacao Cancelada.');
    end;
  finally
   vInserir.Free;
  end;
end;

procedure TModelTipoPessoa.SetCodigo(const Value: integer);
begin
   FCodigo := Value;
end;

procedure TModelTipoPessoa.SetDescricao(const Value: string);
begin
   FDescricao := Value;
end;

end.
