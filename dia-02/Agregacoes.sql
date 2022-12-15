-- Databricks notebook source
SELECT COUNT(*) AS nrLinhasNaoNulas -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClienteNaoNulo
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClienteNaoNulo,
  COUNT(distinct idCliente) AS nrIdClienteDistintos -- id de clientes distintos
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClienteNaoNulo,
  COUNT(distinct idCliente) AS nrIdClienteDistintos, -- id de clientes distintos
  COUNT(idClienteUnico) AS nrIdClienteUnico,
  COUNT(distinct idClienteUnico) AS nrIdClienteUnicoDistintos
  
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  count(*) As qtLinhas,
  count (distinct idCliente) AS qtdClientes,
  count (distinct idClienteUnico) AS qtdClientesUnicos
FROM silver_olist.cliente
WHERE descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT  
  ROUND(AVG(vlPreco), 2) AS avgPreco, -- média da coluna vlPreco
  
  INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco, -- preço mediano dos produtos
  
  MAX(vlPreco) AS maxPreco, -- maximo da coluna vlPreco
  AVG(vlFrete) AS avgFrete,
  MAX(vlFrete) AS maxFrete,
  MIN(vlFrete) AS minFrete
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*)
FROM silver_olist.cliente
WHERE descUF = 'SP'
