# カレンダー作成問題(今月)
require 'date'

data = Date.today
yobi = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
month1 = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December' }
diff = (data.day - 1) % 7
index_today = yobi.index(data.strftime('%a').slice(0, 2))
start = yobi[ index_today - diff]
data1 = data.to_s.split('-')
data1[2] = '-1'
data1 = data1.map(&:to_i).join(', ')
p data1 = Date.new(data1)


month1[data.month]

p "   #{month1[data.month]} #{data.year}"
p yobi.join(' ')