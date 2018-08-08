# frozen_string_literal: true

class StartMiddleStrategy
  def initialize
    @guess = [nil,nil,nil,nil]
    @unlocked = false
    @guesses = 0
  end

  def run(padlock)
    @padlock = padlock
    up_groups = []
    [5000, 6000, 7000, 8000, 9000].each do |n|
      up_groups << (n..n+999).to_a
    end

    down_groups = []
    [4000, 3000, 2000, 1000, 0].each do |n|
      down_groups << (n..n+999).to_a.reverse
    end

    codes = up_groups.zip(down_groups).flatten
    check_range(codes)
    result_hash
  end

  private

  def check_range(range)
    range.each do |n|
      @guesses += 1
      # convert the integer to a 4 digit array
      @guess = ([0,0,0,0] + n.digits.reverse).last(4)
      @unlocked = @padlock.unlock(@guess)
      break if @unlocked
    end
  end

  def up_range(offset)
    (offset..offset+999)
  end

  def down_range(offset)
    (offset-1000..offset+-1)
  end

  def result_hash
    { code: @guess,  guesses: @guesses }
  end
end
