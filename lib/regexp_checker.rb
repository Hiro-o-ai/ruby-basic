print 'Text?:'
text = gets.chomp
begin
  print 'Pattern?:'
  pattern = gets.chomp
  regexp =Regexp.new(pattern)
rescue RegexpError => e
  puts "invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join(',')}"
else
  puts "Nothin matched"
end

