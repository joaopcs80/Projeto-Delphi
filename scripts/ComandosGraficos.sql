--grafico vendas por cliente na semana
SELECT CONVERT(VARCHAR, vendas.clienteId) +' - '+clientes.nome as Label, 
       SUM(vendas.totalVenda) As Value
  FROM vendas
       INNER JOIN clientes ON clientes.clienteId = vendas.clienteId
 WHERE vendas.datavenda BETWEEN CONVERT(DATE, GETDATE()-7) and CONVERT(DATE, GETDATE())
 GROUP BY vendas.clienteId, clientes.Nome

--grafico 10 produtos mais vendidos
 SELECT TOP 10 CONVERT(VARCHAR, vi.produtoId) +'-'+p.nome As Label,
        SUM(vi.totalProduto) As Value
   FROM vendasItens as vi
        INNER JOIN produtos AS p ON p.produtoId = vi.produtoId
  GROUP BY vi.produtoId, p.nome
  ORDER BY Label DESC		 

--Grafico Vendas da última semana
  SELECT vendas.dataVenda As Label, 
         SUM(vendas.totalVenda) AS Value
    FROM vendas
   WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) and CONVERT(DATE, GETDATE())
   GROUP BY vendas.dataVenda