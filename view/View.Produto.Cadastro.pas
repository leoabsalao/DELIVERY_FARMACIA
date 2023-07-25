unit View.Produto.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Cadastro.Modelo, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Model.Classe.Produto, Model.Interfaces.Produto,
  uConexao, UDMConex, Utilidades.Modelo, Vcl.Mask;

type
  TfProdutoCadastro = class(TfModeloCadastro)
    Panel2: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    cbTipoProduto: TDBLookupComboBox;
    Label4: TLabel;
    edtProduto: TEdit;
    Label5: TLabel;
    edtNumRef: TEdit;
    Label6: TLabel;
    edtQuantidade: TEdit;
    Label7: TLabel;
    edtDataValidade: TMaskEdit;
    rgTipoMedicamento: TRadioGroup;
    Label8: TLabel;
    Label9: TLabel;
    btnLimparCampos: TButton;
    Label10: TLabel;
    edtPrescricaoMedica: TEdit;
    edtCuidadoArmaz: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoProdutoClick(Sender: TObject);
    procedure rgTipoMedicamentoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaCamposMedControlado(f : boolean);
    procedure GravarProduto;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  fProdutoCadastro: TfProdutoCadastro;
  vControlado, vSensivel, vComum : Boolean;

implementation

{$R *.dfm}

procedure TfProdutoCadastro.btnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfProdutoCadastro.btnLimparCamposClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
end;

procedure TfProdutoCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if ((cbTipoProduto.KeyValue = null) or (edtProduto.Text = '') or
      (edtNumRef.Text = '') or (edtQuantidade.Text = '') or (edtDataValidade.Text = '____/__/__') ) then
      raise Exception.Create('Campos não preenchidos.');

    GravarProduto;
end;

procedure TfProdutoCadastro.cbTipoProdutoClick(Sender: TObject);
begin
  inherited;
  if cbTipoProduto.KeyValue = 1 then
  begin
    rgTipoMedicamento.Visible := true
  end else begin
    rgTipoMedicamento.Visible := false;
    HabilitaCamposMedControlado(false);
  end;
end;

procedure TfProdutoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  with DMConex.QTipoProduto do
  begin
    Close;
    Open;
  end;
end;

procedure TfProdutoCadastro.GravarProduto;
var
  vProdutoSalvar : iProduto;
  DataValid : string;
begin
  DataValid := StringReplace(edtDataValidade.Text, '/', '-',[rfReplaceAll, rfIgnoreCase]);
  vProdutoSalvar := TProduto.Create;
  try
    try
      vProdutoSalvar.Inserir(cbTipoProduto.KeyValue,edtProduto.Text,edtNumRef.Text,StrToInt(edtQuantidade.Text),
                             DataValid,0.0,vComum,vControlado,vSensivel,edtPrescricaoMedica.Text,edtCuidadoArmaz.Text);
    except
      raise Exception.Create('Error durante a inserção do produto. Movimentação Cancelada.');
      exit
    end;
  finally
    LimparCampos;
    MessageDlg('Produto Inserido com Sucesso!',mtInformation,[mbok],0);
  end;
end;

procedure TfProdutoCadastro.HabilitaCamposMedControlado(f : boolean);
begin
  edtPrescricaoMedica.Visible := f;
  edtCuidadoArmaz.Visible := f;
end;

procedure TfProdutoCadastro.LimparCampos;
begin
  cbTipoProduto.KeyValue := 0;
  rgTipoMedicamento.ItemIndex := -1;
  rgTipoMedicamento.Visible := false;
  edtProduto.Clear;
  edtNumRef.Clear;
  edtQuantidade.Clear;
  edtDataValidade.Text := '____/__/__';
  edtPrescricaoMedica.Clear;
  edtPrescricaoMedica.Visible := false;
  edtCuidadoArmaz.Clear;
  edtCuidadoArmaz.Visible := false;
end;

procedure TfProdutoCadastro.rgTipoMedicamentoClick(Sender: TObject);
begin
  inherited;
  if rgTipoMedicamento.ItemIndex = 0 then
  begin
    vComum := true;
    vControlado := false;
    vSensivel := false;
    HabilitaCamposMedControlado(false);
  end
  else if rgTipoMedicamento.ItemIndex = 1 then
  begin
    vComum := false;
    vControlado := true;
    vSensivel := false;
    HabilitaCamposMedControlado(true);
  end
  else if rgTipoMedicamento.ItemIndex = 2 then
  begin
    vComum := false;
    vControlado := false;
    vSensivel := true;
    HabilitaCamposMedControlado(true);
  end;

  edtProduto.SetFocus;
end;

end.
