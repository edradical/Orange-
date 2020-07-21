# Orange-
Примитивная имитация сети магазинов Orange
Отчет по работе сети магазинов «Orange»

Для формирования значений поставок и продаж необходимо зайти в папку «generate data». Там находится три файла: «generation data 2», «generation data 3», «generation data 4». Первые два файла отличаются тем, что 1 генерирует лишь один товар, а второй произвольное количество товаров и дней. А также третий файл генерирует продажи на основе поставок. Нужно запустить один из этих файлов. После генерации поставок и продаж, необходимо перейти в папку «Programs», которая находится в папке «Analyses». Там нужно запустить программу, которая генерирует цены. После этого все необходимые файлы будут генерированы и остается их перенести в папку «Analyses». Для этого у нас есть файл moving, написанный на bash.script. Для его запуска нужно открыть директорию в которой он находится затем перенести его в терминал и набрать цифры «1 10» (означает магазины с 1 по 10). После этого все файлы будут перенесены в нужную папку и можно переходить к основной программе. Заходим в папку «Programs» и открываем файлы «function.shop», «main». В «R.studio» нажимаем на «source» в файле, где расположены функции, затем запускаем основную программу. Данная программа работает с произвольным количеством дней и товаров. Результат работы будет находится в папке «Result». Там находятся файл bash.script для открытия все находящихся в данной папке таблиц. Таблицы содержатся в формате «csv» (правда могут не открываться так как рассчитано на открытие в программе «Numbers» «macOS»). Затем переходим в папку «graphic», там расположены две программы и изображения графиков программы «graphics2», данные графики построены без учета фиксированных затрат (так как все их мы учитываем потом). Эти программы будут работать, если нажмем «source» в программе «main». И затем переходим в папку «9», там расположены графики с учетом фиксированных затрат, а также премий и штрафов.
