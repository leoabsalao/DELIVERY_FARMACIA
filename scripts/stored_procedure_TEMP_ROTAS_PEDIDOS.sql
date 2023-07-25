-- Calcula a Ordem dos Pedidos, na prioridade de entrega.
CREATE OR ALTER PROCEDURE SP_PEDIDO_ORDEM_ENTREGA
RETURNS(
   rNUM_PEDIDO INTEGER,
   rCLIENTE VARCHAR(100),
   rDATA_PEDIDO DATE,
   rNUM_REF VARCHAR(14),
   rPRODUTO VARCHAR(50),
   rQTD INTEGER,
   rDT_VALIDADE VARCHAR(20)
)
AS   
BEGIN	
	
   delete from TEMP_ROTAPEDIDOS;
  
   -- PRIMEIRA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_RotaPedidos (num_pedido,cliente,data_pedido,num_ref,produto,qtd,dt_validade)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE,tp.DATA_PEDIDO,tp3.NUM_REF,tp3.DESCRICAO,tp.QTD,tp3.DT_VALIDADE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 1 and tp3.TIPO_SENSIVEL = true
  and tp.STATUS_PEDIDO = 'ABERTA'
  Order by tp.DATA_PEDIDO; 
  
  -- SEGUNDA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_RotaPedidos (num_pedido,cliente,data_pedido,num_ref,produto,qtd,dt_validade)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE,tp.DATA_PEDIDO,tp3.NUM_REF,tp3.DESCRICAO,tp.QTD,tp3.DT_VALIDADE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 1 and tp3.TIPO_CONTROLADO = true
  and tp.STATUS_PEDIDO = 'ABERTA'
  Order by tp.DATA_PEDIDO;
	
  -- TERCEIRA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_RotaPedidos (num_pedido,cliente,data_pedido,num_ref,produto,qtd,dt_validade)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE,tp.DATA_PEDIDO,tp3.NUM_REF,tp3.DESCRICAO,tp.QTD,tp3.DT_VALIDADE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 3 and tp.STATUS_PEDIDO = 'ABERTA'
  Order by tp.DATA_PEDIDO; 
  
  -- QUARTA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_RotaPedidos (num_pedido,cliente,data_pedido,num_ref,produto,qtd,dt_validade)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE,tp.DATA_PEDIDO,tp3.NUM_REF,tp3.DESCRICAO,tp.QTD,tp3.DT_VALIDADE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO in (2,4) and tp.STATUS_PEDIDO = 'ABERTA'
  Order by tp.DATA_PEDIDO; 
  
  
   FOR Select tr.NUM_PEDIDO,tr.CLIENTE,tr.DATA_PEDIDO,tr.NUM_REF,tr.PRODUTO,tr.QTD,tr.DT_VALIDADE  
       FROM temp_RotaPedidos tr                    
     INTO :rNUM_PEDIDO,:rCLIENTE,:rDATA_PEDIDO,:rNUM_REF,:rPRODUTO,:rQTD,:rDT_VALIDADE DO
        
   SUSPEND;
END