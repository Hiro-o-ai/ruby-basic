def hello(names)
  names.each do |name|
    puts "hello, #{name.upcase}"
  end
end
rubies = ['mri', 'jruby', 'rubinius']
hello(rubies)