unit Model.Interfaces.TipoPessoa;

interface

type
    iTipoPessoa = interface
      ['{A6EF7EB3-E41C-4384-BB31-C5D1CDFC383D}']

      procedure Inserir(p_Descricao : string);
      procedure Deletar(p_Id : integer);
      procedure Alterar(p_Id : integer; p_Descricao : string);
    end;

implementation

end.
