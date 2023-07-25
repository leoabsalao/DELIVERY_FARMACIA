unit View.Cadastro.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfModeloCadastro = class(TForm)
    pnlTopoPrincipal: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fModeloCadastro: TfModeloCadastro;

implementation

{$R *.dfm}

procedure TfModeloCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.