unit View.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Cadastro.Modelo, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uConexao, UDMConex,
  Model.Interfaces.Produto, Utilidades.Modelo,View.Produto.Cadastro,
  Model.Classe.Produto;

type
  TfProdutos = class(TfModeloCadastro)
    Panel3: TPanel;
    Label14: TLabel;
    edtPesquisaProduto: TEdit;
    btnNovoProduto: TButton;
    dbGrid_Produto: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaProdutoChange(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure dbGrid_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ListarTodosProdutos;
    procedure AbrirTelaCadastroProdutos;
    procedure DeletarProduto(vID : integer);
  public
    { Public declarations }
  end;

var
  fProdutos: TfProdutos;


implementation

{$R *.dfm}

procedure TfProdutos.AbrirTelaCadastroProdutos;
begin
    Application.CreateForm(TfProdutoCadastro, fProdutoCadastro);
    fProdutoCadastro.Show;
    close;
end;

procedure TfProdutos.btnNovoProdutoClick(Sender: TObject);
begin
  inherited;
  AbrirTelaCadastroProdutos;
end;

procedure TfProdutos.dbGrid_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
  begin
     if MessageDlg('Deseja Excluir esse Produto Selecionado?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
     begin
       DeletarProduto(DMConex.QProduto.FieldByName('CODIGO').AsInteger);
       ListarTodosProdutos;
     end;
  end;
end;

procedure TfProdutos.DeletarProduto(vID : integer);
var
  vProdutoDeletar : iProduto;
begin
  vProdutoDeletar := TProduto.Create;
  try
    try
      vProdutoDeletar.Deletar(vID);
    except
      raise Exception.Create('Error durante a exclusão do produto. Movimentação Cancelada.');
      exit
    end;
  finally
    MessageDlg('Produto Excluido com Sucesso!',mtInformation,[mbok],0);
  end;
end;

procedure TfProdutos.edtPesquisaProdutoChange(Sender: TObject);
begin
  inherited;
   if Length(Trim(edtPesquisaProduto.Text)) > 0 then
   begin
      with DMConex.QProduto do
      begin
         Close;
         Sql.Text := SqlConsultaProduto;
         Sql.Add(' and Upper(t.DESCRICAO) like :DESCRICAO ');
         Sql.Add(' Order by t.DESCRICAO ');
         ParamByName('DESCRICAO').AsString := '%'+edtPesquisaProduto.text+'%';
         Open;
         First;
      end;
   end else
   begin
      ListarTodosProdutos;
   end;
end;

procedure TfProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  ListarTodosProdutos;
end;

procedure TfProdutos.ListarTodosProdutos;
begin
  with DMConex.QProduto do
  begin
     Close;
     Sql.Text := SqlConsultaProduto;
     Sql.Add(' Order by t.DESCRICAO ');
     Open;
     First;
  end;
end;

end.
