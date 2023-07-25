program Projeto.FARMACIA;

uses
  Vcl.Forms,
  View.Principal in 'view\View.Principal.pas' {fPrincipal},
  UDMConex in 'bd\UDMConex.pas' {DMConex: TDataModule},
  View.MainProjeto in 'view\View.MainProjeto.pas' {fMainProjeto},
  Utilidades.Modelo in 'utilidades\Utilidades.Modelo.pas',
  uConexao in 'bd\uConexao.pas',
  Model.Interfaces.TipoPessoa in 'model\interfaces\Model.Interfaces.TipoPessoa.pas',
  Model.Classe.TipoPessoa in 'model\Model.Classe.TipoPessoa.pas',
  Model.Interfaces.Pessoa in 'model\interfaces\Model.Interfaces.Pessoa.pas',
  Model.Classe.Pessoa in 'model\Model.Classe.Pessoa.pas',
  Model.Interfaces.Produto in 'model\interfaces\Model.Interfaces.Produto.pas',
  Model.Classe.Produto in 'model\Model.Classe.Produto.pas',
  Model.Interfaces.Pedido in 'model\interfaces\Model.Interfaces.Pedido.pas',
  Model.Classe.Pedido in 'model\Model.Classe.Pedido.pas',
  View.Cadastro.Modelo in 'view\View.Cadastro.Modelo.pas' {fModeloCadastro},
  View.Pedidos in 'view\View.Pedidos.pas' {fPedidos},
  UViaCEP in 'utilidades\UViaCEP.pas',
  View.Produtos in 'view\View.Produtos.pas' {fProdutos},
  View.Cadastro.Produtos in 'view\View.Cadastro.Produtos.pas' {fProdutoCad},
  View.Produto.Cadastro in 'view\View.Produto.Cadastro.pas' {fProdutoCadastro},
  Model.Interfaces.Rotas in 'model\interfaces\Model.Interfaces.Rotas.pas',
  Model.Classe.Rotas in 'model\Model.Classe.Rotas.pas',
  View.RotaPedidos in 'view\View.RotaPedidos.pas' {fRotaPedidos},
  View.VerificaStatusPedido in 'view\View.VerificaStatusPedido.pas' {fVerificaPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DELIVERY&FARMA';
  Application.CreateForm(TDMConex, DMConex);
  Application.CreateForm(TfMainProjeto, fMainProjeto);
  Application.Run;
end.
