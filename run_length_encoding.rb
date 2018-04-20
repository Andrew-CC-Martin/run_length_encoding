class RunLengthEncoding
  def self.encode input
    output = ''
    ary = input.chars.chunk_while { |i, j| i == j }.to_a
    for x in ary
      output << x.length.to_s if x.length > 1
      output << x[0] if x[0]
    end
    output
  end

  def self.decode input
    output = ''
    ary = input.chars.chunk_while { |n| n =~ /\d/ }.to_a
    for x in ary
      if x.length > 1
        output << x.last * x[0...-1].join.to_i
      else
        output << x.first
      end
    end
    output
  end
end

module BookKeeping
  VERSION = 3
end
