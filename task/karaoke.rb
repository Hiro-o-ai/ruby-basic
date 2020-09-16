# カラオケマシン
# scale1 = ['A', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
# scale2 = ['ド', 'レ', 'ミ', 'ミ#', 'ファ', 'ファ#', 'ソ', 'ラ', 'F#', 'G', 'G#']

class KaraokeMachine
  attr_accessor :melody

  def initialize(melody)
    @melody = melody.split('')
  end

  def transpose(count)
    scale = ['A', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
    @melody.map do |melody|
      unless melody == ' ' && count <= scale.length
        scale[scale.index(melody) + count]
      end
    end
    puts @melody.join('')
  end
end


