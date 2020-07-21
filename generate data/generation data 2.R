getwd()
setwd('/Users/leotemirov/Documents/R/кр/Апельсин')
dir()
{
	generate.supply.sale <- function(name, type, min_val, max_val){
		f <- read.table(name, head = T)	
		x <- sample(min_val : max_val, 7, replace = T)	
		day <- (1:7)
		if (type == 'in'){
			f <- data.frame(День = day, Поставка = x)
			return(write.table(f, file = name, row.names = FALSE, quote = F))
		}
			else{
			f <- data.frame(День = day, Продажи = x)
			return(write.table(f, file = name, row.names = FALSE, quote = F))
			}	
	}
	
	generate.supply.sale('Shop1/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop2/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop3/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop4/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop5/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop6/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop7/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop8/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop9/in.txt', 'in', 10, 80)
	generate.supply.sale('Shop10/in.txt', 'in', 10, 80)
	
	generate.supply.sale('Shop1/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop2/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop3/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop4/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop5/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop6/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop7/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop8/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop9/out.txt', 'out', 10, 80)
	generate.supply.sale('Shop10/out.txt', 'out', 10, 80)
	




}


