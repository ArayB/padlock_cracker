# frozen_string_literal: true

class BruteForceStrategy
  def run(padlock)
    guess = [nil,nil,nil,nil]
    unlocked = false
    guesses = 0

    (0..9999).each do |n|
      guesses += 1
      # convert the integer to a 4 digit array
      guess = ([0,0,0,0] + n.digits.reverse).last(4)
      unlocked = padlock.unlock(guess)
      break if unlocked
    end

    { code: guess,  guesses: guesses }
  end
end
