setwd('/Users/leotemirov/Documents/R/кр/Апельсин')

{
    generate.price.stores <- function (name, names, min, max){  
        # заполняем вектора случайными значениями в заданном диапозоне
        supply <- rep(0, length(names))
        sale <- rep(0, length(names))
        util <- rep(0, length(names))
        for (i in 1 : length(supply)){
            supply[i] <- sample(min : max, 1) 
            sale[i] <- sample(min : max, 1)
            util[i] <- sample(10 : 20, 1)
        }
        # меняем значения если в цены поставок больше цен продаж и увеличиваем на 40 чтобы стабилизировать прибыль
        supply[sale < supply] <- sale[sale < supply]
        sale[sale < supply] <- supply[sale < supply] 
  		sale <- sale + 40
        
        table <- data.frame("Товар" = names, "Поставка" = supply, "Продажа" = sale, "Списание" = util) 
        write.table(table, file = name, row.names = FALSE, quote = FALSE) 
    } 
}

generate.price.stores (name = "Shop1/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 20, max = 70) 
generate.price.stores (name = "Shop2/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 25, max = 55)
generate.price.stores (name = "Shop3/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 30, max = 76) 
generate.price.stores (name = "Shop4/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 22, max = 78)
generate.price.stores (name = "Shop5/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 34, max = 81) 
generate.price.stores (name = "Shop6/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 32, max = 67)
generate.price.stores (name = "Shop7/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 36, max = 95) 
generate.price.stores (name = "Shop8/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 23, max = 69)
generate.price.stores (name = "Shop9/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 30, max = 75) 
generate.price.stores (name = "Shop10/price.txt",  names = c("Молоко", "Хлеб", "Яйца"), min = 25, max = 93)


