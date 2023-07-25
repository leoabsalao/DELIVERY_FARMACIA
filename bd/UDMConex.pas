unit UDMConex;

interface

uses
  System.SysUtils, System.Classes, uConexao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, IniFiles, dialogs, Forms,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDMConex = class(TDataModule)
    DsCliente: TDataSource;
    QCliente: TFDQuery;
    QClienteCodigo: TIntegerField;
    QClienteNome: TStringField;
    FConex: TFDConnection;
    DsProduto: TDataSource;
    QProduto: TFDQuery;
    QTipoProduto: TFDQuery;
    DsTipoProduto: TDataSource;
    QEntregador: TFDQuery;
    DsEntregador: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarConexFisico;
    var ArqIni : TIniFile;
  public
    { Public declarations }
  end;

var
  DMConex: TDMConex;

const
  SqlConsultaProduto = ' Select t.NUM_REF,t.DESCRICAO,tt.DESCRICAO as TIPO_PRODUTO,t.DT_VALIDADE,t.QUANT,  '+
                       '  Case t.TIPO_COMUM WHEN true then ''X'' end as TIPO_COMUM,                        '+
                       '  Case t.TIPO_CONTROLADO WHEN true then ''X'' end as TIPO_CONTROLADO,              '+
                       '  Case t.TIPO_SENSIVEL WHEN true then ''X'' end as TIPO_SENSIVEL,                  '+
                       '   t.PRESC_MEDICA,t.CUIDADO_ARMAZ, t.CODIGO From tb_produto t, TB_TIPOPRODUTO tt   '+
                       ' Where t.COD_TIPOPRODUTO = tt.CODIGO                                               ';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConex.ConfigurarConexFisico;
var
  Caminho, Servidor : string;
begin
  try
    ArqIni   := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
    Servidor := ArqIni.ReadString('BANCO_PARAMS','SERVIDOR','');
    Caminho  := ArqIni.ReadString('BANCO_PARAMS','CAMINHO','');
    try
     FConex.Params.DriverID := 'FB';
     FConex.Params.Database := Servidor + ':' + Caminho;
     FConex.Params.UserName := 'SYSDBA';
     FConex.Params.Password := 'masterkey';
     FConex.LoginPrompt := False;
     FConex.Connected := true;
     QCliente.Active := True;
    except
      MessageDlg('Configure o aqruivo INI para a conex�o com o banco de dados FIREBIRD. Conex�o Falhou.',mtInformation,[mbok],0);
      exit;
    end;
  finally
     FreeAndNil(ArqIni);
  end;
end;

procedure TDMConex.DataModuleCreate(Sender: TObject);
var
  vConex : TConexao;
begin
  try
    try
      vConex := TConexao.Create;
      vConex.GetConn.Connected := True;
      ConfigurarConexFisico;
    finally
      FreeAndNil(vConex);
    end;
  except
    raise Exception.Create('Erro ao conectar com a base de dados. Contate o Administrador.');
  end;
end;

//initialization
//  ReportMemoryLeaksOnShutdown := True;

end.
