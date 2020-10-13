# 入力.txtの迷路を最短経路でSからGまで到達した道も入力のデータと合わせて出力し、
# 出力.txtを作成できるようにする

# 入力.txtのデータを呼び出し、input変数の中に1行を1つの配列として入れていく
# input = []

# File.open( "入力.txt", mode = "rt" ) {|f|
#   f.each_line{|line|
#       input << line.chomp.split('')
#   }
# }

# # txtのデータに座標を入れていく
# maze = []
# y = 0
# input.each do |maze_y|
#   x = 0
#   ary = []
#   maze_y.each do |maze_x|

#     node = [maze_x, x, y]
#     ary.push(node)
#     if maze_x == "S"
#       $start = node
#     elsif maze_x == "G"
#       $goal = node
#     end

#     x += 1
#   end
#   maze.push(ary)
#   y += 1
# end

# # スタートからゴールまでの距離
# x = ($goal[1] - $start[1]).abs
# y = ($goal[2] - $start[2]).abs
# all_cost = x + y



class Node
  attr_accessor :id, :edges, :cost, :done, :from
  def initialize(id, edges=[], cost=nil, done=false)
    @id, @edges, @cost, @done = id, edges, cost, done
  end
end

class Edge
  attr_reader :cost, :nid
  def initialize(cost, nid)
    @cost, @nid = cost, nid
  end
end

class Graph
  # attr_accessor :nodes
  def initialize(data)
    # @nodesには各データ毎のNodeオブジェクトが入っている
    @nodes =
      data.map do |id, edges|
        # *をつけることで配列を展開して複数の引数を渡せる
        edges.map! { |edge| Edge.new(*edge) }
        # edgesにはEdgeオブジェクトが入っている
        Node.new(id, edges)
      end
  end

  def route(sid, gid)
    dijkstra(sid)
    # node.idはdataの位置で○_○の文字列で記述されている
    # "S"、"G"はそのまま入っているのでbaseには"G"のNodeオブジェクトが入る
    # gid="G"
    base = @nodes.find { |node| node.id == gid }
    res = [base]
    while base = @nodes.find { |node| node.id == base.from }
      res << base
    end
    res
  end

  private
  def dijkstra(sid)
    # sid="S"
    @nodes.each do |node|
      # node.id("S"or"G"or"○_○")
      # "S"だったらnode.cost = 0　それ以外は = nilとなる
      # node.costは初期値がnil
      # Edge.costと関係はない
      node.cost = node.id == sid ? 0 : nil
      node.from = nil
    end
    # breakになるまでループする
    loop do
      done_node = nil
      @nodes.each do |node|
        # node.doneがtrueかnode.costがnilだったら処理を飛ばす
        # 初期のcostは"S"のcost以外は全てnil　つまり初期のdone_nodeには"S"のnodeが入る
        next if node.done or node.cost.nil?
        # 後置if done_nodeがnilの場合にdone_node = nodeとなる
        # node.cost < done_node.costは最短経路にする際に必要となる
        done_node = node if done_node.nil? or node.cost < done_node.cost
      end
      # done_nodeがfalseかnilならloopから抜ける
      break unless done_node
      done_node.done = true
      # 各dataの上下左右の空白の座標がedges
      done_node.edges.each do |edge|
        # toには@nodesの一致データが入る
        to = @nodes.find{ |node| node.id == edge.nid }
        # done_node.cost = 0("S"のコスト) + 1
        cost = done_node.cost + edge.cost
        # "S"or〇_〇が入る
        from = done_node.id
        # 1回目のループなら"S"付近のマスのcost(to.cost)がnilかcost(done_node.cost + 1)よりもto.costの方が大きい場合
        if to.cost.nil? || cost < to.cost
          to.cost = cost
          to.from = from
        end
      end
    end
  end
end

maze = []

File.open( "入力.txt", mode = "rt" ) {|f|
  f.each_line{|line|
      maze << line.chomp.split('')
  }
}

nodes = {}
maze.each.with_index do |line, y|
  line.each.with_index do |data, x|
    # "*"の場合は以下の処理を実行しない
    next if data == '*'
    # \wでアルファベット、数字、アンダーバー
    # $&はmatchした文字列が入る
    id = data.match(/\w/) ? $& : "#{y}_#{x}"
    # injectの初期値が[]でないと上下左右のデータに分けられなくなる
    edges =
      [[-1, 0], [1, 0], [0, -1], [0, 1]].inject([]) do |mem, (_y, _x)|
        # dataの位置から上下左右の位置に変更する
        _x += x; _y += y
        # 上下左右の位置の文字列で場合わけ
        case maze[_y][_x]
        # \wでアルファベット、数字、アンダーバー つまり"S"か"G"の場合のみ
        when /\w/ then mem << $&
        # \sは垂直ダブ以外の全ての空白文字　つまり" "の場合のみ
        when /\s/ then mem << "#{_y}_#{_x}"
        # "*"の時は全てelse
        else mem
        end
      end.map { |nid| [1, nid] }
      # あるdataの位置をキーにその上下左右の" "や"S"、"G"がある場合のみedgesの配列のデータが増える
    nodes[id] = edges
    puts edges
  end
end
g = Graph.new(nodes)


# file = File.open('出力.txt',"w")
# route = g.route('S', 'G')
# maze.each_with_index do |line, y|
#   line.each_with_index do |data, x|
#     file.print route.find { |pos| pos.id == "#{y}_#{x}" } ? '$' : data
#   end
#   file.print "\n"
# end

route = g.route('S', 'G')
# maze.each_with_index do |line, y|
#   line.each_with_index do |data, x|
#     # findで最短経路と一致するかを確認、した場合は数値を返す→ture、しない場合はnil→falseとなる。そして三項演算子の条件となり、$かそれ以外が出力
#     print route.find { |pos| pos.id == "#{y}_#{x}" } ? '$' : data
#   end
#   print "\n"
# end
