unit Model.Interfaces.Pessoa;

interface

type
    iPessoa = interface
     ['{9846B124-460A-4EA9-A655-76907D2268AE}']

      procedure Inserir(p_Cod_TipoPessoa : integer; p_Nome : string; p_RG : string;
                        p_CPF : string; p_CNPJ : string; p_DT_NASC : string; p_Email : string;
                        p_Fone : string; p_CEP : string; p_Logradouro : string;
                        p_Numero : integer; p_Bairro : string; p_Cidade : string;
                        p_Estado : string; p_Pais : string; p_Complemento : string);
      procedure Deletar(p_Id : integer);
      procedure Alterar(p_Id : integer; p_Cod_TipoPessoa : integer; p_Nome : string; p_RG : string;
                        p_CPF : string; p_CNPJ : string; p_DT_NASC : string; p_Email : string;
                        p_Fone : string; p_CEP : string; p_Logradouro : string;
                        p_Numero : integer; p_Bairro : string; p_Cidade : string;
                        p_Estado : string; p_Pais : string; p_Complemento : string);
    end;

implementation

end.
