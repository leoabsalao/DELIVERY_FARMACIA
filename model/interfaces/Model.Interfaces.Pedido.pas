unit Model.Interfaces.Pedido;

interface

type
   iPedido = interface
   ['{45C9B182-129B-4834-AAB0-8C1E7FC964D8}']

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

end.
