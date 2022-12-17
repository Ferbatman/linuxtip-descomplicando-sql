-- Databricks notebook source
-- Qual categoria tem mais produtos vendidos?

SELECT T2.descCategoria,
       COUNT(*)    -- contagem de linhas do produto
FROM silver_olist.item_pedido AS T1  -- tabela de vendas
LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria  -- group por produto
ORDER BY COUNT(*) DESC

LIMIT 1

-- COMMAND ----------

-- Qual categoria tem produtos mais caros, em média?

SELECT T2.descCategoria,
       AVG(T1.vlPreco)
       
FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria
ORDER BY AVG(T1.vlPreco) DESC

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frete?

SELECT 
       T3.descUF,
       AVG(T1.vlFrete)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.pedido AS T2
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF

HAVING AVG(T1.vlFrete) > 40

ORDER BY 2 DESC
