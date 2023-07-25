-- STORED PROCEDURE (INCLUSÃO / ALTERAÇÃO / DELEÇÃO) -- TABELA TIPO PESSOA 

-- Inclusão
CREATE OR ALTER PROCEDURE SP_TIPOPESSOA_INSERT (P_DESCRICAO VARCHAR(100))
AS 
BEGIN
   INSERT INTO TB_TIPOPESSOA (DESCRICAO) VALUES (:P_DESCRICAO);
  
END


-- Deleção
CREATE OR ALTER PROCEDURE SP_TIPOPESSOA_DELETE (P_ID INTEGER)
AS
DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	  SELECT COALESCE(COUNT(*), 0)
	   FROM TB_TIPOPESSOA
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	  
	  IF (V_COUNT > 0) THEN 
	     DELETE FROM TB_TIPOPESSOA 
	        WHERE CODIGO = :P_ID;
	  ELSE 
	       EXCEPTION EXC_REGISTRO_INEXISTENTE; 

END

-- Alteração
CREATE OR ALTER PROCEDURE SP_TIPOPESSOA_UPDATE (P_ID INTEGER, P_DESCRICAO VARCHAR(100))
AS
DECLARE VARIABLE V_COUNT INTEGER;
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM TB_TIPOPESSOA
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	 
	 
	  IF (V_COUNT > 0) THEN  
	      UPDATE
	           TB_TIPOPESSOA
	        SET 
	           DESCRICAO  =:P_DESCRICAO
	        WHERE CODIGO  =:P_ID;	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     

END

-- Consulta Total de registros
CREATE OR ALTER PROCEDURE SP_TIPOPESSOA_SELECT()
RETURNS(
   rCODIGO INTEGER,
   rDESCRICAO VARCHAR(100)
)
AS   
BEGIN	
   FOR Select codigo,descricao from TB_TIPOPESSOA
   into :rCODIGO, :rDESCRICAO DO
   SUSPEND;
END

-- Consulta um único tipo de pessoa
CREATE OR ALTER PROCEDURE SP_TIPOPESSOA_DESCRICAO_SELECT(P_ID INTEGER)
RETURNS(
   rCODIGO INTEGER,
   rDESCRICAO VARCHAR(100)
)
AS   
BEGIN	
   FOR Select codigo,descricao from TB_TIPOPESSOA
       Where codigo = :P_ID
   into :rCODIGO, :rDESCRICAO DO
   SUSPEND;
END