getwd()
setwd('/Users/leotemirov/Documents/R/кр/Апельсин')
dir()
{
	generate.supply.sale.many <- function(name, type, min_val, max_val, day = 7, goods = 3, list_of_goods = c('Молоко', 'Хлеб', 'Яйца')){
		days <- (1 : day)
		f <- data.frame(День = days)		
		if (type == 'in'){      # заполняем таблицы поставок и продаж и добавляем к продуктам названия 'Поставок' или 'Продаж'
			for (i in 1 : goods){
				x <- sample(min_val : max_val, day, replace = T)
				p <- paste0('Поставка:', list_of_goods[i])
				f[[p]] <- x
			}
			return(write.table(f, file = name, row.names = FALSE, quote = F, sep = '\t'))
		}
		else {
			for (i in 1 : goods){
				x <- sample(min_val : max_val, day, replace = T)
				p <- paste0('Продажа:', list_of_goods[i])
				f[[p]] <- x
			}		
			return(write.table(f, file = name, row.names = FALSE, quote = F, sep = '\t'))
		}		
		
	}
	generate.supply.sale.many('Shop1/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop2/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop3/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop4/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop5/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop6/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop7/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop8/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop9/in.txt', 'in', 20, 80)
	generate.supply.sale.many('Shop10/in.txt', 'in', 20, 80)
	
	generate.supply.sale.many('Shop1/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop2/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop3/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop4/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop5/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop6/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop7/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop8/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop9/out.txt', 'out', 20, 80)
	generate.supply.sale.many('Shop10/out.txt', 'out', 20, 80)
	
}