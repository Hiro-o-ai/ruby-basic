def greeting(contry)
  return "contryを入力してください" if contry.nil?
  if contry == "japan"
    "こんにちは"
  else
    "hello"
  end
end

def calc_with_break
  numbers = [1, 2, 3, 4, 5, 6]
  target = nil
  numbers.shuffle.each do |n|
    target = n
    return if n.even?
  end
  target * 10
end

numbers = [1, 2, 3, 4, 5]
i = 0
while i < numbers.size
  n = numbers[i]
  i += 1
#numbers.each do |n|
  next if n.even?
  p n
end

fruits = ["apple", "orange", "lemon"]
fruits.each do |fruit|
  numbers.each do |n|
    next if n.even?
    p "#{fruit}, #{n}"
  end
end

foods = ["tomoto", "トマト", "セロリ"]
count = 0
foods.each do |food|
  print "#{food}は好きですか？ =>"
  answer = ["はい","いいえ"].sample
  p answer

  count += 1
  redo if answer != "はい" && count < 2
  count = 0
end


