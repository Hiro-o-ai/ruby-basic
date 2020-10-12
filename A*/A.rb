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
        Node.new(id, edges)
      end
  end

  def route(sid, gid)
    dijkstra(sid)
    base = @nodes.find { |node| node.id == gid }
    res = [base]
    while base = @nodes.find { |node| node.id == base.from }
      res << base
    end
    res
  end

  private
  def dijkstra(sid)
    @nodes.each do |node|
      node.cost = node.id == sid ? 0 : nil
      node.from = nil
    end
    loop do
      done_node = nil
      @nodes.each do |node|
        next if node.done or node.cost.nil?
        done_node = node if done_node.nil? or node.cost < done_node.cost
      end
      break unless done_node

      done_node.done = true
      done_node.edges.each do |edge|
        to = @nodes.find{ |node| node.id == edge.nid }
        cost = done_node.cost + edge.cost
        from = done_node.id
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
    edges =
      [[-1, 0], [1, 0], [0, -1], [0, 1]].inject([]) do |mem, (_y, _x)|
        # dataの位置から上下左右の位置に変更する
        _x += x; _y += y
        # 上下左右の位置の文字列で場合わけ
        case maze[_y][_x]
        when /\w/ then mem << $&
        # \sは垂直ダブ以外の全ての空白文字
        when /\s/ then mem << "#{_y}_#{_x}"
        # "*"の時は全てこれ
        else mem
        end
      end.map { |nid| [1, nid] }
      # あるdataの位置をキーにその上下左右の" "や"S"、"G"がある場合のみedgesの配列のデータが増える
    nodes[id] = edges
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

# route = g.route('S', 'G')
# maze.each_with_index do |line, y|
#   line.each_with_index do |data, x|
#     # findで最短経路と一致するかを確認、した場合は数値を返す→ture、しない場合はnil→falseとなる。そして三項演算子の条件となり、$かそれ以外が出力
#     print route.find { |pos| pos.id == "#{y}_#{x}" } ? '$' : data
#   end
#   print "\n"
# end
