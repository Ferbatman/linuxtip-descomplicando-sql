-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- leia-se: selecione TUDO da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido, descSituacao FROM silver_olist.pedido

-- COMMAND ----------

SELECT idPedido, descSituacao FROM silver_olist.pedido
LIMIT 5

-- COMMAND ----------

select *, datediff(dtEstimativaEntrega, dtEntregue) as qtDiasPromessaEntrega
from silver_olist.pedido
Limit 5
