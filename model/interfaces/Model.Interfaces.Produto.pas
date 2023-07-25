unit Model.Interfaces.Produto;

interface

type
    iProduto = interface
    ['{2E4957FD-AF5A-4459-A4A9-7C725325552F}']

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

end.
