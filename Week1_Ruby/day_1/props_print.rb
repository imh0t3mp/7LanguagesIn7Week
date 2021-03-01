
# Вывести текст по содержимому массива
properties = ['object oriented', 'duck typed', 'productive', 'fun']

# Пройти по массиву и для каждого значения сформировать строку
# "#{property} - вставка в строку значения переменной property"
properties.each { |property| puts "Ruby is #{property}." }
