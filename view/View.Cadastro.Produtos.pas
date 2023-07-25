unit View.Cadastro.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.Classe.Produto,
  Model.Interfaces.Produto, uConexao, UDMConex;

type
  TfProdutoCad = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProdutoCad: TfProdutoCad;

implementation

{$R *.dfm}

end.
