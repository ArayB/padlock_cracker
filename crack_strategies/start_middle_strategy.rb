# frozen_string_literal: true

class StartMiddleStrategy
  def initialize
    @guess = [nil,nil,nil,nil]
    @unlocked = false
    @guesses = 0
  end

  def run(padlock)
    @padlock = padlock

    check_order = create_check_order(5000)
    check_range(check_order)
    result_hash
  end

  private

  def create_check_order(start_point)
    up = (start_point..9999).to_a
    down = (0..(start_point-1)).to_a.reverse

    longest = up.length > down.length ? up : down
    shortest = longest == up ? down : up

    longest.zip(shortest).flatten.compact
  end

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
