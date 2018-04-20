# Algorithm works but needs some serious refactoring
class String
  def numeric?
    self =~ /\d/
  end
end

class RunLengthEncoding
  def self.encode input
    output = ''
    input.chars.chunk_while { |i, j| i == j }.to_a.each do |x|
      output << x.length.to_s if x.length > 1
      output << x[0] if x[0]
    end
    output
  end

  def self.decode input
    output = ''
    input.chars.chunk_while {|n| n.numeric?}.to_a.each do |x|
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
