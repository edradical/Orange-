{
  fixCost <- c(200, 150, 80, 450, 322, 144, 55, 123, 99, 77)

# Учтем постоянные затраты 
  i <- 1
  total_profit <- rep(0 , 10)
  k <- 1
  while (k < length(Pr)){
    total_profit[i] <- Pr[k] 
    k <- k + 1
    total_profit[i] <- total_profit[i] + Pr[k]
    k <- k + 1
    total_profit[i] <- total_profit[i] + Pr[k]
    k <- k + 1
    i <- i + 1
  }
  total_profit <- total_profit - fixCost
  
  # Построим график прибыли магазинов 
  plot(x = total_profit, cex = 2, pch = 23, bg = 'yellow', col = 'green', type = 'b', lty = 1, lwd = 2, main = 'Общая прибыль 10 магазинов', xlab = 'Номер магазина', ylab = 'Прибыль по 3-ём товарам в руб.')
  abline(v = seq(1, 10, 1), h = seq(min(total_profit), max(total_profit), 1000), col = 'blue', lty = 3)
  
  # сортируем магазины по прибыли
  shop_table <- data.frame(c(1 : 10), total_profit)
  colnames(shop_table) <- c('Номер магазина', 'Прибыль')
  shop_table <- shop_table[order(shop_table$Прибыль),]
  
  # считаем премию директорам
  i <- c(6 : 10)
  j <- c(1 : 5)
  store_director <- (0.03 + (i - 5) * 0.01) * total_profit[6 : 10]
  store_director2 <- (0.05 - j * 0.01) * total_profit[1 : 5]
  store_director <- data.frame(c(6:10), store_director)
  
  # Построим графики премий и штрафов директоров
  plot(x = store_director, cex = 3, pch = 23, bg = 'yellow', col = 'green', type = 'b', lty = 1, lwd = 2, main = 'Премии директоров магазинов 6-10', xlab = 'Номер магазина', ylab = 'Премия в руб.')
  abline(v = seq(1, 10, 1), h = seq(min(store_director), max(store_director), 100), col = 'blue', lty = 3)
  
  plot(x = store_director2, cex = 3, pch = 23, bg = 'yellow', col = 'green', type = 'b', lty = 1, lwd = 2, main = 'Штрафы директоров магазинов 1-5', xlab = 'Номер магазина', ylab = 'Штраф в руб.')
  abline(v = seq(1, 10, 1), h = seq(min(store_director2), max(store_director2), 20), col = 'blue', lty = 3)
  
  # посчитаем рентабельность а также премии и штрафы 
  Q_sale2 <- c(sum(out1[, 2] * P_sale[1], out1[, 3] * P_sale[2], out1[, 4] * P_sale[3]), 
               sum(out2[, 2] * P_sale[4], out2[, 3] * P_sale[5], out2[, 4] * P_sale[6]), 
               sum(out3[, 2] * P_sale[7], out3[, 3] * P_sale[8], out3[, 4] * P_sale[9]), 
               sum(out4[, 2] * P_sale[10], out4[, 3] * P_sale[11], out4[, 4] * P_sale[12]), 
               sum(out5[, 2] * P_sale[13], out5[, 3] * P_sale[14], out5[, 4] * P_sale[15]), 
               sum(out6[, 2] * P_sale[16], out6[, 3] * P_sale[17], out6[, 4] * P_sale[18]), 
               sum(out7[, 2] * P_sale[19], out7[, 3] * P_sale[20], out7[, 4] * P_sale[21]), 
               sum(out8[, 2] * P_sale[22], out8[, 3] * P_sale[23], out8[, 4] * P_sale[24]), 
               sum(out9[, 2] * P_sale[25], out9[, 3] * P_sale[26], out9[, 4] * P_sale[27]),
               sum(out10[, 2] * P_sale[28], out10[, 3] * P_sale[29], out10[, 4] * P_sale[30]))
  r <- total_profit / Q_sale2 * 100
  
  director2 <- (2 - j * 0.01) * r[1 : 5]
  director1 <- data.frame(c(6:10), c((3 + (5 - i) * 0.01) * r[6 : 10]))
  
  #построим графики
  plot(x = director1, cex = 3, pch = 23, bg = 'yellow', col = 'green', type = 'b', lty = 1, lwd = 2, main = 'Премии директоров магазинов 6-10', xlab = 'Номер магазина', ylab = 'Премия в руб.')
  abline(v = seq(1, 10, 1), h = seq(min(director1), max(director1), 20), col = 'blue', lty = 3)
  
  plot(x = director2, cex = 3, pch = 23, bg = 'yellow', col = 'green', type = 'b', lty = 1, lwd = 2, main = 'Штрафы директоров магазинов 1-5', xlab = 'Номер магазина', ylab = 'Штраф в руб.')
  abline(v = seq(1, 10, 1), h = seq(min(director2), max(director2), 20), col = 'blue', lty = 3)
  
}
