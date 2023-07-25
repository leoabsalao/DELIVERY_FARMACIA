object DMConex: TDMConex
  OnCreate = DataModuleCreate
  Height = 299
  Width = 617
  object DsCliente: TDataSource
    DataSet = QCliente
    Left = 512
    Top = 168
  end
  object QCliente: TFDQuery
    Connection = FConex
    SQL.Strings = (
      'Select Codigo, Nome from tb_pessoa where COD_TIPOPESSOA = 2')
    Left = 512
    Top = 104
    object QClienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object QClienteNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
  end
  object FConex: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 512
    Top = 40
  end
  object DsProduto: TDataSource
    DataSet = QProduto
    Left = 416
    Top = 168
  end
  object QProduto: TFDQuery
    Connection = FConex
    Left = 416
    Top = 96
  end
  object QTipoProduto: TFDQuery
    Connection = FConex
    SQL.Strings = (
      'Select CODIGO, DESCRICAO  '
      'from TB_TIPOPRODUTO '
      'Order by CODIGO ')
    Left = 312
    Top = 96
  end
  object DsTipoProduto: TDataSource
    DataSet = QTipoProduto
    Left = 312
    Top = 176
  end
  object QEntregador: TFDQuery
    Connection = FConex
    SQL.Strings = (
      'Select tp.CODIGO, tp.NOME '
      'from TB_PESSOA tp where tp.COD_TIPOPESSOA = 3')
    Left = 208
    Top = 96
  end
  object DsEntregador: TDataSource
    DataSet = QEntregador
    Left = 208
    Top = 176
  end
end
