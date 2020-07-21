getwd()
setwd('/Users/leotemirov/Documents/R/кр/Апельсин')
dir()
{
	generate.sale.level  <- function(name, type, day = 7, goods = 2, list_of_goods = c('Молоко', 'Хлеб'), supply = 'in.txt', saleLevel = c(NA, 50, 34)){
		days <- (1 : day)
		name <- paste(name, '/out.txt', sep = '')
		out.table <- data.frame(День = days)
		supply.table <- read.table(supply, header = T)		 
		for (i in 1 : goods){
			p <- paste0('Продажа:', list_of_goods[i])
			out.table[[p]] <- NA
		}
		for (i in 2 : (goods + 1)){
			for (j in 1 : 7) {
				out.table[j, i] <- floor(saleLevel[i] / 100 * supply.table[j, i])
			}		
		}
		return(write.table(out.table, file = name, row.names = FALSE, quote = F, sep = '\t'))
	}
}

generate.sale.level('Shop1/', supply = 'Shop1/in.txt')
generate.sale.level('Shop2/', supply = 'Shop2/in.txt')
generate.sale.level('Shop3/', supply = 'Shop3/in.txt')
generate.sale.level('Shop4/', supply = 'Shop4/in.txt')
generate.sale.level('Shop5/', supply = 'Shop5/in.txt')
generate.sale.level('Shop6/', supply = 'Shop6/in.txt')
generate.sale.level('Shop7/', supply = 'Shop7/in.txt')
generate.sale.level('Shop8/', supply = 'Shop8/in.txt')
generate.sale.level('Shop9/', supply = 'Shop9/in.txt')
generate.sale.level('Shop10/', supply = 'Shop10/in.txt')