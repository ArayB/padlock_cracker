require_relative './padlock.rb'
require_relative './brute_force_strategy.rb'
require_relative './start_middle_strategy.rb'

class Cracker
  def initialize(crack_strategy = BruteForceStrategy.new)
    @strategy = crack_strategy
    @padlock = Padlock.new
    @initial_code = @padlock.read
    @digits = @initial_code.length
  end

  def run
    result = @strategy.run(@padlock)
    puts '*'*40
    puts '*'*40
    puts "Unlock code is: #{result[:code]}"
    puts "Took #{result[:guesses]} guesses"
    puts '*'*40
    puts '*'*40
  end
end
