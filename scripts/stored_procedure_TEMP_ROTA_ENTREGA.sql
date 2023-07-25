-- Calcula a Ordem dos Pedidos, na prioridade de entrega.
CREATE OR ALTER PROCEDURE SP_ROTA_ENTREGA
RETURNS(
   rNUM_PEDIDO INTEGER,
   rCLIENTE VARCHAR(50)
)
AS   
BEGIN		
	
   delete from temp_ROTA_ENTREGA;   
  
   -- PRIMEIRA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_ROTA_ENTREGA (num_pedido,cliente)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 1 and tp3.TIPO_SENSIVEL = true
  Order by tp.DATA_PEDIDO;
  
  -- SEGUNDA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_ROTA_ENTREGA (num_pedido,cliente)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE   
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 1 and tp3.TIPO_CONTROLADO = true
  Order by tp.DATA_PEDIDO;
	
  -- TERCEIRA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_ROTA_ENTREGA (num_pedido,cliente)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE  
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO = 3 
  Order by tp.DATA_PEDIDO;
  
  -- QUARTA VALIDAÇÃO DE ENTREGA DOS PEDIDOS.
  Insert into temp_ROTA_ENTREGA (num_pedido,cliente)
  Select tp.NUM_PEDIDO,tp2.NOME as CLIENTE   
  from TB_PEDIDO tp, TB_PESSOA tp2, TB_PRODUTO tp3, TB_TIPOPRODUTO tt  
  Where tp.COD_CLIENTE  = tp2.CODIGO and tp.COD_PRODUTO = tp3.CODIGO and tp3.COD_TIPOPRODUTO = tt.CODIGO
  and tp3.COD_TIPOPRODUTO in (2,4) 
  Order by tp.DATA_PEDIDO;  
  
  
   FOR Select tr.NUM_PEDIDO,tr.CLIENTE  
       FROM temp_ROTA_ENTREGA tr                    
     INTO :rNUM_PEDIDO,:rCLIENTE DO
        
   SUSPEND;
END