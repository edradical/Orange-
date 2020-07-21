{
  plot(x = out1[1:2], col = 'pink', cex = 1.5, pch = 23, type = 'b', bg = 'red', lty = 2, lwd = 2, main = 'Объем продаж молока в 1 магазине', ylab = 'Количество проданных конт.')
  abline(v = seq(1, 9, 1), h = seq(1, 90, 1), col = c('blue', 'green'), lty = 3)
}

{
  plot(x = out2[1:2], col = 'pink', cex = 1.5, pch = 23, type = 'b', bg = 'red', lty = 2, lwd = 2, main = 'Объем продаж молока во втором магазине', ylab = 'Количество проданных конт.')
  abline(v = seq(1, 9, 1), h = seq(1, 90, 1), col = c('blue', 'green'), lty = 3)
}

{
  x <-  out1[, 2] * P_sale[1]
  plot(x = x, col = 'black', cex = 2, pch = 23, bg = 'yellow', lty = 1, lwd = 2, type = 'b', main = 'Выручка 1 магазина', xlab = 'День', ylab = 'Количество вырученных денег за молоко в руб.')
  abline(v = seq(1, length(x), 1), h = seq(1, max(x), 500), col = 'blue', lty = 3)
}

{
  y <- out2[, 2] * P_sale[4]
  plot(x = y, col = 'black', cex = 2, pch = 23, bg = 'yellow', lty = 1, lwd = 2, type = 'b', main = 'Выручка 2 магазина', xlab = 'День', ylab = 'Количество вырученных денег за молоко в руб.')
  abline(v = seq(1, length(y), 1), h = seq(1, max(y), 500), col = 'blue', lty = 3)
}

{
  z <- (out1[, 2] * P_sale[1]) - ((P_util[1] * (in1[, 2] - out1[, 2])) + (P_supply[1] * in1[, 2]))
  plot(x = z, col = 'red', cex = 2, pch = 23, bg = 'green', lty = 1, lwd = 2, type = 'b', main = 'Прибыль 1 магазина за продажу молока', xlab = 'День', ylab = 'Прибыль в руб.')
  abline(v = seq(1, length(z), 1), h = seq(min(z), max(z), 500), col = 'black', lty = 3)
}

{
  p <- (out2[, 2] * P_sale[4]) - ((P_util[4] * (in2[, 2] - out2[, 2])) + (P_supply[4] * in2[, 2]))
  plot(x = p, col = 'red', cex = 2, pch = 23, bg = 'green', lty = 1, lwd = 2, type = 'b', main = 'Прибыль 2 магазина за продажу молока', xlab = 'День', ylab = 'Прибыль в руб.')
  abline(v = seq(1, length(p), 1), h = seq(min(p), max(p), 500), col = 'black', lty = 3)
}

{
  s <- in1[, 2] - out1[, 2]
  plot(x = s, col = 'green', cex = 2, pch = 22, bg = 'blue', lty = 1, lwd = 2, type = 'b', main = 'Списания 1 магазина', xlab = 'День', ylab = 'Количество списанных конт.')
  abline(v = seq(1, length(s), 1), h = seq(min(s), max(s), 4), col = 'black', lty = 3)
}

{
  s2 <- in2[, 2] - out2[, 2]
  plot(x = s2, col = 'green', cex = 2, pch = 22, bg = 'blue', lty = 1, lwd = 2, type = 'b', main = 'Списания 2 магазина', xlab = 'День', ylab = 'Количество списанных конт.')
  abline(v = seq(1, length(s2), 1), h = seq(min(s2), max(s2), 4), col = 'black', lty = 3)
}

{
  r <- ((out1[, 2] * P_sale[1]) - ((P_util[1] * (in1[, 2] - out1[, 2])) + (P_supply[1] * in1[, 2]))) / (out1[, 2] * P_sale[1]) * 100
  plot(x = r, col = 'green', cex = 2, pch = 22, bg = 'blue', lty = 1, lwd = 2, type = 'b', main = 'Рентабельность 1 магазина', xlab = 'День', ylab = 'руб.')
  abline(v = seq(1, length(r), 1), h = seq(min(r), max(r), 5000), col = 'black', lty = 3)
}

{
  r2 <- ((out2[, 2] * P_sale[4]) - ((P_util[4] * (in2[, 2] - out2[, 2])) + (P_supply[4] * in2[, 2]))) / (out2[, 2] * P_sale[4]) * 100
  plot(x = r2, col = 'green', cex = 2, pch = 22, bg = 'blue', lty = 1, lwd = 2, type = 'b', main = 'Рентабельность 2 магазина', xlab = 'День', ylab = 'руб.')
  abline(v = seq(1, length(r2), 1), h = seq(min(r2), max(r2), 5000), col = 'black', lty = 3)
}
