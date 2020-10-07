# 入力.txtの迷路を最短経路でSからGまで到達した道も入力のデータと合わせて出力し、
# 出力.txtを作成できるようにする

# 入力.txtのデータを呼び出し、input変数の中に1行を1つの配列として入れていく
maze = []

File.open( "入力.txt", mode = "rt" ) {|f|
  f.each_line{|line|
      maze << line.chomp.split('')
  }
}

