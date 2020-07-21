{
  plot(x = out1[1:2], col = 'orange', cex = 2, pch = 23, type = 'b', bg = 'yellow', lty = 2, lwd = 2, main = 'Объем продаж молока в 1 магазине', ylab = 'Количество проданных конт.', ylim = c(20, max(out1)))
  lines(x = out1[3], col = 'black', cex = 2, pch = 22, type = 'b', bg = 'red', lty = 2, lwd = 2)
  lines(x = out1[4], col = 'green', cex = 2, pch = 21, type = 'b', bg = 'orchid', lty = 2, lwd = 2)
  abline(v = seq(1, 10, 1), h = seq(20, max(out1), 5), col = 'blue', lty = 3)
  legend(4, 55, legend = c('Молоко', 'Хлеб', 'Яйца'), col = c('orange', 'black', 'green'), lty = 3:4, cex = 0.8, text.font = 4)
}

{
  x <-  out1[, 4] * P_sale[1]
  y <- out1[, 2] * P_sale[2]
  z <- out1[, 3] * P_sale[3]
  plot(x = y, col = 'orange', cex = 2, pch = 23, type = 'b', bg = 'yellow', lty = 2, lwd = 2, main = 'Выручка в 1 магазине', ylab = 'Выручка в руб.', xlab = 'День', ylim = c(min(x, y, z), max(x, y, z)))
  lines(x = z, col = 'black', cex = 2, pch = 22, type = 'b', bg = 'red', lty = 2, lwd = 2)
  lines(x = x, col = 'green', cex = 2, pch = 21, type = 'b', bg = 'orchid', lty = 2, lwd = 2)
  abline(v = seq(1, 10, 1), h = seq(20, max(x, y, z), 500), col = 'blue', lty = 3)
  legend(5, 4900, legend = c('Молоко', 'Хлеб', 'Яйца'), col = c('orange', 'black', 'green'), lty = 3:4, cex = 0.8, text.font = 4)
}

{
  x2 <- (out1[, 2] * P_sale[1]) - ((P_util[1] * (in1[, 2] - out1[, 2])) + (P_supply[1] * in1[, 2]))
  y2 <- (out1[, 3] * P_sale[1]) - ((P_util[2] * (in1[, 3] - out1[, 3])) + (P_supply[2] * in1[, 3]))
  z2 <- (out1[, 4] * P_sale[3]) - ((P_util[3] * (in1[, 4] - out1[, 4])) + (P_supply[3] * in1[, 4]))
  plot(x = x2, col = 'orange', cex = 2, pch = 23, type = 'b', bg = 'yellow', lty = 2, lwd = 2, main = 'Прибыль в 1 магазине', ylab = 'Прибыль в руб.', xlab = 'День', ylim = c(min(x2, y2, z2), max(x2, y2, z2)))
  lines(x = y2, col = 'black', cex = 2, pch = 22, type = 'b', bg = 'red', lty = 2, lwd = 2)
  lines(x = z2, col = 'green', cex = 2, pch = 21, type = 'b', bg = 'orchid', lty = 2, lwd = 2)
  abline(v = seq(1, 10, 1), h = seq(min(x2, y2, z2), max(x, y, z), 500), col = 'blue', lty = 3)
  legend(5, 1900, legend = c('Молоко', 'Хлеб', 'Яйца'), col = c('orange', 'black', 'green'), lty = 3:4, cex = 0.8, text.font = 4)
}

{
  x3 <- in1[, 2] - out1[, 2]
  y3 <- in1[, 3] - out1[, 3]
  z3 <- in1[, 4] - out1[, 4]
  plot(x = x3, col = 'orange', cex = 2, pch = 23, type = 'b', bg = 'yellow', lty = 2, lwd = 2, main = 'Списание в 1 магазине', ylab = 'Списано конт.', xlab = 'День', ylim = c(min(x3, y3, z3), max(x3, y3, z3)))
  lines(x = y3, col = 'black', cex = 2, pch = 22, type = 'b', bg = 'red', lty = 2, lwd = 2)
  lines(x = z3, col = 'green', cex = 2, pch = 21, type = 'b', bg = 'orchid', lty = 2, lwd = 2)
  abline(v = seq(1, 10, 1), h = seq(1, max(x3, y3, z3), 2), col = 'blue', lty = 3)
  legend(5, 50, legend = c('Молоко', 'Хлеб', 'Яйца'), col = c('orange', 'black', 'green'), lty = 3:4, cex = 0.8, text.font = 4)

}

{
  x4 <- ((out1[, 2] * P_sale[1]) - ((P_util[1] * (in1[, 2] - out2[, 2])) + (P_supply[1] * in2[, 2]))) / (out2[, 2] * P_sale[1]) * 100
  y4 <- ((out1[, 3] * P_sale[1]) - ((P_util[2] * (in1[, 3] - out2[, 3])) + (P_supply[2] * in2[, 3]))) / (out2[, 3] * P_sale[2]) * 100
  z4 <- ((out1[, 4] * P_sale[1]) - ((P_util[3] * (in1[, 4] - out2[, 4])) + (P_supply[3] * in2[, 4]))) / (out2[, 4] * P_sale[3]) * 100
  plot(x = x4, col = 'orange', cex = 2, pch = 23, type = 'b', bg = 'yellow', lty = 2, lwd = 2, main = 'Рентабельность в 1 магазине', ylab = 'руб.', xlab = 'День', ylim = c(min(x4, y4, z4), max(x4, y4, z4)))
  lines(x = y4, col = 'black', cex = 2, pch = 22, type = 'b', bg = 'red', lty = 2, lwd = 2)
  lines(x = z4, col = 'green', cex = 2, pch = 21, type = 'b', bg = 'orchid', lty = 2, lwd = 2)
  abline(v = seq(1, 10, 1), h = seq(min(x4, y4, z4), max(x4, y4, z4), 10), col = 'blue', lty = 3)
  legend(5, 60, legend = c('Молоко', 'Хлеб', 'Яйца'), col = c('orange', 'black', 'green'), lty = 3:4, cex = 0.8, text.font = 4)
  
}

{
  plot(x = out1[1:2], col = 'yellow', cex = 1, type = 'b', pch = 23, bg = 'yellow', lty = 1, lwd = 1, main = 'Динамика объема продаж молока', ylab = 'Количество проданных конт.', ylim = c(20, 77))
  lines(x = out2[2], col = 'red', cex = 1, type = 'b', pch = 23,  bg = 'red', lty = 1, lwd = 1)
  lines(x = out3[2], col = 'black', cex = 1, type = 'b', pch = 23,  bg = 'black', lty = 1, lwd = 1)
  lines(x = out4[2], col = 'orange', cex = 1, type = 'b', pch = 23,  bg = 'orange', lty = 1, lwd = 1)
  lines(x = out5[2], col = 'green', cex = 1, type = 'b', pch = 23,  bg = 'green', lty = 1, lwd = 1)
  lines(x = out6[2], col = 'purple', cex = 1, type = 'b', pch = 23,  bg = 'purple', lty = 1, lwd = 1)
  lines(x = out7[2], col = 'brown', cex = 1, type = 'b', pch = 23,  bg = 'brown', lty = 1, lwd = 1)
  lines(x = out8[2], col = 'olivedrab3', cex = 1, type = 'b', pch = 23,  bg = 'olivedrab3', lty = 1, lwd = 1)
  lines(x = out9[2], col = rgb(1,0,0,0.5), cex = 1, type = 'b', pch = 23,  bg = rgb(1,0,0,0.5), lty = 1, lwd = 1)
  lines(x = out10[2], col = 'red3', cex = 1, type = 'b', pch = 23, bg = 'red3', lty = 1, lwd = 1)
  abline(v = seq(1, 9, 1), h = seq(20, 90, 2), col = 'blue', lty = 3, lwd = 0.5)
  legend(5.3, 79, legend = c('Магазин1', 'Магазин2', 'Магазин3', 'Магазин4', 'Магазин5', 'Магазин6', 'Магазин7', 'Магазин8', 'Магазин9', 'Магазин10'), col = c('yellow', 'red', 'black', 'orange', 'green', 'purple', 'brown', 'olivedrab3', rgb(1,0,0,0.5), 'red3'), lty = 1, cex = 0.8, text.font = 4)
}

{
  plot(x = out1[1:2], col = 'yellow', cex = 1, type = 'b', pch = 22, bg = 'yellow', lty = 1, lwd = 1, main = 'Динамика объема продаж молока', ylab = 'Количество проданных конт.', ylim = c(20, 85))
  lines(x = out2[2], col = 'red', cex = 1, type = 'b', pch = 22,  bg = 'red', lty = 1, lwd = 1)
  lines(x = out3[2], col = 'black', cex = 1, type = 'b', pch = 22,  bg = 'black', lty = 1, lwd = 1)
  lines(x = out4[2], col = 'orange', cex = 1, type = 'b', pch = 22,  bg = 'orange', lty = 1, lwd = 1)
  lines(x = out5[2], col = 'green', cex = 1, type = 'b', pch = 22,  bg = 'green', lty = 1, lwd = 1)
  lines(x = out6[2], col = 'purple', cex = 1, type = 'b', pch = 22,  bg = 'purple', lty = 1, lwd = 1)
  lines(x = out7[2], col = 'brown', cex = 1, type = 'b', pch = 22,  bg = 'brown', lty = 1, lwd = 1)
  lines(x = out8[2], col = 'olivedrab3', cex = 1, type = 'b', pch = 22,  bg = 'olivedrab3', lty = 1, lwd = 1)
  lines(x = out9[2], col = rgb(1,0,0,0.5), cex = 1, type = 'b', pch = 22,  bg = rgb(1,0,0,0.5), lty = 1, lwd = 1)
  lines(x = out10[2], col = 'red3', cex = 1, type = 'b', pch = 22, bg = 'red3', lty = 1, lwd = 1)
  abline(v = seq(1, 9, 1), h = seq(20, 90, 2), col = 'blue', lty = 3, lwd = 0.5)
  legend(5.3, 85, legend = c('Магазин1', 'Магазин2', 'Магазин3', 'Магазин4', 'Магазин5', 'Магазин6', 'Магазин7', 'Магазин8', 'Магазин9', 'Магазин10'), col = c('yellow', 'red', 'black', 'orange', 'green', 'purple', 'brown', 'olivedrab3', rgb(1,0,0,0.5), 'red3'), lty = 1, cex = 0.8, text.font = 4)
  legend(4, 80, legend = c('Молоко', 'Хлеб'), pch = c(22, 23), cex = 1)
  
  lines(x = out1[3], col = 'yellow', cex = 1, type = 'b', pch = 23, bg = 'yellow', lty = 1, lwd = 1)
  lines(x = out2[3], col = 'red', cex = 1, type = 'b', pch = 23,  bg = 'red', lty = 1, lwd = 1)
  lines(x = out3[3], col = 'black', cex = 1, type = 'b', pch = 23,  bg = 'black', lty = 1, lwd = 1)
  lines(x = out4[3], col = 'orange', cex = 1, type = 'b', pch = 23,  bg = 'orange', lty = 1, lwd = 1)
  lines(x = out5[3], col = 'green', cex = 1, type = 'b', pch = 23,  bg = 'green', lty = 1, lwd = 1)
  lines(x = out6[3], col = 'purple', cex = 1, type = 'b', pch = 23,  bg = 'purple', lty = 1, lwd = 1)
  lines(x = out7[3], col = 'brown', cex = 1, type = 'b', pch = 23,  bg = 'brown', lty = 1, lwd = 1)
  lines(x = out8[3], col = 'olivedrab3', cex = 1, type = 'b', pch = 23,  bg = 'olivedrab3', lty = 1, lwd = 1)
  lines(x = out9[3], col = rgb(1,0,0,0.5), cex = 1, type = 'b', pch = 23,  bg = rgb(1,0,0,0.5), lty = 1, lwd = 1)
  lines(x = out10[3], col = 'red3', cex = 1, type = 'b', pch = 23, bg = 'red3', lty = 1, lwd = 1)

}
