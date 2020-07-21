# change и change2 меняют сзначения, если значения in меньше значений out
change <- function(ini, out){
  ini[ini < out] <- out[ini < out]
  return(ini)
}

change2 <- function(ini, out){
  out[ini < out] <- ini[ini < out]
  return(out)
}
#-------------------------------------------------------

# summarize для заполнения Q_sale и Q_supply
summarize <- function(en, f = in1){
  i <- 2
  Q <- vector()
  while (i <= length(f)){
    for (j in en){
      Q <- append(Q, values = sum(j[i]))
    }
    i <- i + 1
  }
  return(Q)
}

# enter добавялет значения "итого" и "среднее" в вектора и заполняет таблицу этими векторами
enter <- function(x, f = in1, table = res.tab, number){
  i <- 1
  k <- 10
  while (i < (length(f) - 1) * 10){
    x <- append(x, values = c(sum(x[i:k]), mean(x[i:k])), after = k)
    i <- i + 12
    k <- k + 12
  }
  res.tab[[number]] <- x
  return(res.tab)
}

# addiiton делает пробелы в векторах максимального списания, продаж и минимальных продаж, и затем заполняет этими векторами таблицу
addition <- function(m, table = res.tab, number){
  i <- 10
  while (i <= nrow(table)){
    m <- append(m, c('', ''), after = i)
    i <- i + 12
  }
  table[[number]] <- m
  return(table)
}