# カレンダー作成問題(今月)
require 'date'

# 本日の日付
data = Date.today
yobi = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
month1 = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December' }
# 1日と今日の曜日差
diff = (data.day - 1) % 7
# 今日の曜日はyobi配列のどこにあるのか
index_today = yobi.index(data.strftime('%a').slice(0, 2))
# 1日の曜日
start = yobi[ index_today - diff]
# 月末の日にち
data_last = Date.new(data.year, data.month, -1)
array = (1..data_last.day).to_a
week = []
# p yobi.index(start)
unless start == 'Su'
  yobi.index(start).times {
    week << '  '
  }
end
array.each do |d|
  if d < 10
    week << ' '  + d.to_s
  else
    week << d.to_s
  end
end

p "   #{month1[data.month]} #{data.year}"
p yobi.join(' ').to_s
week1 = week.each_slice(7).to_a
week1.each do |a|
  puts a.join(' ')
end
