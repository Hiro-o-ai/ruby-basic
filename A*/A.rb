# 入力.txtの迷路を最短経路でSからGまで到達した道も入力のデータと合わせて出力し、
# 出力.txtを作成できるようにする

# 入力.txtのデータを呼び出し、input変数の中に1行を1つの配列として入れていく
maze = []

File.open( "入力.txt", mode = "rt" ) {|f|
  f.each_line{|line|
      maze << line.chomp.split('')
  }
}

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
  def initialize(data)
    @nodes =
      data.map do |id, edges|
        edges.map! { |edge| Edge.new(*edge) }
        Node.new(id, edges)
      end
  end

  def cost(nid, sid)
    dijkstra(sid)
    @nodes.find { |node| node.id == nid }.cost
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

  def print_route(sid, gid)
    res = route(sid, gid)
    puts res.reverse.map { |node| "#{node.id}(#{node.cost})" }.join(" -> ")
  end

  private
  def dijkstra(sid)
    @nodes.each do |node|
      node.cost = node.id == sid ? 0 : nil
      node.done = false
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


nodes = {}
maze.each.with_index do |line, y|
  line.each.with_index do |data, x|
    next if data == '*'
    id = data.match(/\w/) ? $& : "#{y}_#{x}"
    edges =
      [[-1, 0], [1, 0], [0, -1], [0, 1]].inject([]) do |mem, (_y, _x)|
        _x += x; _y += y
        case maze[_y][_x]
        when /\w/ then mem << $&
        when /\s/ then mem << "#{_y}_#{_x}"
        else mem
        end
      end.map { |nid| [1, nid] }
    nodes[id] = edges
  end
end
g = Graph.new(nodes)

route = g.route('S', 'G')
maze.each_with_index do |line, y|
  line.each_with_index do |data, x|
    print route.find { |pos| pos.id == "#{y}_#{x}" } ? '$' : data
  end
  print "\n"
end