-- Databricks notebook source
SELECT * FROM silver_olist.pedido
WHERE descSituacao = 'canceled'
--LIMIT 100

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE descSituacao = 'shipped' and year(dtPedido) = '2018'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE (descSituacao = 'shipped' or descSituacao = 'canceled') 
and year(dtPedido) = '2018'

-- COMMAND ----------

SELECT * FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled') 
and year(dtPedido) = '2018'

-- COMMAND ----------

SELECT *, datediff(dtEstimativaEntrega, dtAprovado) as diffDatasAprovadoPrecisao
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled') 
and year(dtPedido) = '2018'
and datediff(dtEstimativaEntrega, dtAprovado) > 30
