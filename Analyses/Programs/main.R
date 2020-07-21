 {
	f <- file.path('/Users/leotemirov/Documents/R/кр/Апельсин/Analyses', c("store1_in.txt", 'store1_out.txt', "store2_in.txt", "store2_out.txt", "store3_in.txt", "store3_out.txt", "store4_in.txt", "store4_out.txt", "store5_in.txt", "store5_out.txt", "store6_in.txt", "store6_out.txt", "store7_in.txt", "store7_out.txt", "store8_in.txt", "store8_out.txt", "store9_in.txt", "store9_out.txt", "store10_in.txt", "store10_out.txt"))
	f2 <- file.path('/Users/leotemirov/Documents/R/кр/Апельсин/Analyses', c("store1_price.txt", "store2_price.txt", "store3_price.txt", "store4_price.txt", "store5_price.txt", "store6_price.txt", "store7_price.txt", "store8_price.txt", "store9_price.txt", "store10_price.txt"))
	d <- lapply(f, read.table, header = TRUE)
	d2 <- lapply(f2, read.table, header = TRUE)

	in1 <- change(d[[1]], d[[2]]) 
	in2 <- change(d[[3]], d[[4]])
	in3 <- change(d[[5]], d[[6]])
	in4 <- change(d[[7]], d[[8]])
	in5 <- change(d[[9]], d[[10]])
	in6 <- change(d[[11]], d[[12]])
	in7 <- change(d[[13]], d[[14]])
	in8 <- change(d[[15]], d[[16]])
	in9 <- change(d[[17]], d[[18]])
	in10 <- change(d[[19]], d[[20]])

	out1 <- change2(d[[1]], d[[2]]) 
	out2 <- change2(d[[3]], d[[4]])
	out3 <- change2(d[[5]], d[[6]])
	out4 <- change2(d[[7]], d[[8]])
	out5 <- change2(d[[9]], d[[10]])
	out6 <- change2(d[[11]], d[[12]])
	out7 <- change2(d[[13]], d[[14]])
	out8 <- change2(d[[15]], d[[16]])
	out9 <- change2(d[[17]], d[[18]])
	out10 <- change2(d[[19]], d[[20]])

	entire1 <- list(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10)
	entire2 <- list(out1, out2, out3, out4, out5, out6, out7, out8, out9, out10)
	P <- list(d2[[1]], d2[[2]], d2[[3]], d2[[4]], d2[[5]], d2[[6]], d2[[7]], d2[[8]], d2[[9]], d2[[10]])
	P_sale <- vector()
	P_supply <- vector()
	P_util <- vector()
	
  # заполняем вектора цен поставок, продаж и списания
	for (i in P){
		P_sale <- append(P_sale, c(i[1 : length(in1), 3]))
		P_supply <- append(P_supply, c(i[1 : length(in1), 2]))
		P_util <- append(P_util, c(i[1 : length(in1), 4]))
	}
	
	P_sale <- P_sale[!is.na(P_sale)]
	P_supply <- P_supply[!is.na(P_supply)]
	P_util <- P_util[!is.na(P_util)]
}

# создаем таблицу 
{	
  x <- (length(in1) - 1) * 10 + (length(in1) - 1) * 2 
	res.tab <- data.frame("Выручка руб" = c(rep(0, x)), "Прибыль руб"= c(rep(0, x)))
	res.tab$"Реализация, конт." <- 0
	res.tab$"Списание, конт." <- 0
	res.tab$'sd' <- 0
	res.tab$"Продажи макс" <- 0
	res.tab <- cbind(res.tab, День = c(rep(0, x)))
	res.tab$"Продажи мин" <- 0
	res.tab <- cbind(res.tab, День = c(rep(0, x)))
	res.tab$"Списание макс" <- 0
	res.tab <- cbind(res.tab, День = c(rep(0, x)))
}

# выполняем расчеты
{
	Q_sale <- summarize(entire2) 
	Q_supply <- summarize(entire1)
	Q_util <- Q_supply - Q_sale
	TR <- P_sale * Q_sale
	TC <- Q_supply * P_supply + Q_util * P_util 
	Pr <- TR - TC 

# заполняем вектор uniformity1 значениями равномерности продаж
	k <- 1
	v <- 7
	l <- 1
	uniformity <- vector()
	uniformity1 <- vector()
	while(k <= length(entire2)){
		h <- entire2[[k]]
		for (j in 2 : ncol(h)){
			for (i in 1 : nrow(h)){			
				uniformity <- append(uniformity, h[i,j])
			}
			uniformity1 <- append(uniformity1, sd(uniformity[k : v]))
			uniformity <- uniformity[1:l]
			v <- v + 1
			l <- l + 1
		}
		k <- k + 1
	}

	res.tab <- enter(Q_sale, f = in1, table = res.tab, 3)
	res.tab <- enter(TR, f = in1, table = res.tab, 1)
	res.tab <- enter(Pr, f = in1, table = res.tab, 2)
	res.tab <- enter(Q_util, f = in1, table = res.tab, 4)
	res.tab <- enter(uniformity1, f = in1, table = res.tab, 5)

# вычисляем вектор максимального списания и соответсвующего дня
	j <- 1
	i <- 2
	max_util <- vector()
	day_max_util <- vector()
	while (i <= length(in1)){
		while (j <= length(entire1)){
			x <- as.matrix(entire1[[j]])
			y <- as.matrix(entire2[[j]])
			max_util <- append(max_util, max(x[, i] - y[, i]))
			day_max_util <- append(day_max_util, which.max((x[, i] - y[, i])))
			j <- j + 1
		}
		i <- i + 1
		j <- 1
	}
}

{		
# вычисляем вектора максимальных и минимальных продаж и дней соответственно
	i <- 2
	j <- 1
	max_sale <- vector()
	min_sale <- vector()
	day_max_sale <- vector()
	day_min_sale <- vector()
	while (i <= length(in1)){
		while (j <= length(entire2)){
			x <- as.matrix(entire2[[j]])
			max_sale <- append(max_sale, values = max(x[, i]))
			min_sale <- append(min_sale, values = min(x[, i]))
			day_min_sale <- append(day_min_sale, which.min(x[, i]))
			day_max_sale <- append(day_max_sale, which.max(x[, i]))		
			j <- j + 1
		}
		i <- i + 1
		j <- 1
	}

}	

{	

	res.tab <- addition(max_util, table = res.tab, 10)
	res.tab <- addition(max_sale, table = res.tab, 6)
	res.tab <- addition(min_sale, table = res.tab, 8)
	res.tab <- addition(day_max_sale, table = res.tab, 7)
	res.tab <- addition(day_min_sale, table = res.tab, 9)
	res.tab <- addition(day_max_util, table = res.tab, 11)

# выделяем названия продуктов и заполняем вектор названий строк 
	library(stringr)
	names1 <- as.vector(colnames(in1))
	names1 <- str_remove(names1, 'Поставка.')
	names <- rep(c('Магазин1', 'Магазин2', 'Магазин3', 'Магазин4', 'Магазин5', 'Магазин6', 'Магазин7', 'Магазин8', 'Магазин9', 'Магазин10', 'Итого', 'Среднее'), (length(in1) - 1))
	rownames(res.tab) <- make.names(names, unique = TRUE)

# сохраняем таблицу/таблицы с соответсвующими названиями продуктов
	k <- 12
	i <- 1
	n <- 2
	while (i <= nrow(res.tab)){
		write.table(res.tab[i:k,], file = paste('/Users/leotemirov/Documents/R/кр/Апельсин/Result/resTab', names1[n], '.csv'), sep = ';', col.names = NA,  dec = ',' )
		i <- i + 12
		k <- k + 12
		n <- n + 1
	}

} 