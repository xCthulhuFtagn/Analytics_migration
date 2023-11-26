Выведите список брендов (Brand), которые продаются в Глобусе (ChainName)

SELECT DISTINCT Brand FROM DIM_Products as DP JOIN Sales as S
	ON (DP.IDSku = S.IDSku) JOIN DIM_Shops as DS ON (S.IDShop = DS.IDShop)
	WHERE ChainName = 'Глобус'

Посчитайте сумму продаж в гипермаркете METRO (ChainName) за февраль 2021 (Quantity и Amount)

SELECT SUM(Amount) as sum_sales FROM DIM_Products as DP JOIN Sales as S
	ON (DP.IDSku = S.IDSku) JOIN DIM_Shops as DS ON (S.IDShop = DS.IDShop)
	WHERE ChainName = 'METRO' AND MONTH(Date) = 2 AND YEAR(Date) = 2021

Посчитайте кол-во магазинов Эльдорадо (ChainName), по которым были продажи 12/02/2021

SELECT COUNT(DISTINCT D.IDShop) AS 'кол-во магазинов' 
	FROM Sales AS S JOIN DIM_Shops AS D ON (S.IDShop = D.IDShop) 
	WHERE ChainName = 'Эльдорадо'

Выведите 5 самых продаваемых товаров (код товара и название) в ДНС (ChainName)  

SELECT TOP(5) D.IDSku, D.SkuName, COUNT(*) AS CNT
	FROM SALES AS S JOIN DIM_Products AS D ON (S.IDSku = D.IDSku) JOIN DIM_Shops AS DS ON (S.IDShop = DS.IDShop)
	GROUP BY D.IDSku, D.SkuName
	ORDER BY CNT DESC 