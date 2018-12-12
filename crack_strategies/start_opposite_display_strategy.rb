# frozen_string_literal: true

# Starts with the code displayed by the lock and then tests alternate up and down values
class StartOppositeDisplayStrategy
  def initialize
    @guess = [nil,nil,nil,nil]
    @unlocked = false
    @guesses = 0
  end

  def run(padlock)
    @padlock = padlock
    opposite_code = opposite(padlock.read)
    check_order = create_check_order(opposite_code.join.to_i)
    check_range(check_order)
    result_hash
  end

  private

  def opposite(code)
    dial_map = { '0' => '5', '1' => '6', '2' => '7', '3' => '8', '4' => '9',
                 '5' => '0', '6' => '1', '7' => '2', '8' => '3', '9' => '4'  }
    code.map { |x| dial_map[x.to_s] }
  end

  def create_check_order(start_point)
    all_codes = (0..9999).to_a

    rotated = all_codes.rotate(start_point)
    up = rotated[0..5000]
    down = rotated[5001..10000].reverse
    up.zip(down).flatten.compact
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
