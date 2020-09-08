x = 0
y = 0

input_line = gets.to_i

input_line.times do
    s = gets.chomp.to_s.split(' ')
    if s[0] = 'SET' then
        if s[1] = '1'
            x = s[2].to_i
        else
            y = s[2].to_i
        end
        puts 1
    elsif s[0] = 'ADD' then
        y = x + s[1].to_i
    else
        y = x - s[1].to_i
    end
end
puts x, y