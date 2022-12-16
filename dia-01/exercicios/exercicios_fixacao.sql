-- Databricks notebook source
-- 06 Lista de pedidos feitos em dezembro de 2017 e entregues com atraso

select *
from silver_olist.pedido

where YEAR(dtPedido) = 2017 and MONTH(dtPedido) = 12
and descSituacao = 'delivered'
and date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- 08 Lista de pedidos com 2 ou mais parcelas menores que R$20,00

select *
from silver_olist.pagamento_pedido

where nrPacelas >= 2
and vlPagamento / nrPacelas < 20

-- COMMAND ----------

-- case 02 Selecione os itens de pedidos e defina os grupos em uma nova coluna:
-- para frete inferior à 10%: '10%'
-- para frete entre 10% e 25%: '10% e 25%'
-- para frete entre 25 e 50%: '25% e 50%'
-- para frete maior que 50%: '+50%'

select *,
       vlPreco + vlFrete AS vlTotal,
       vlFrete / (vlPreco + vlFrete) AS pctFrete,
       
       CASE
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% A 50%'
         ELSE '+50%'
       END AS descFretePct
       
from silver_olist.item_pedido

