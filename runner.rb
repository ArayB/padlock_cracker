require 'tty-progressbar'
require_relative './cracker.rb'

# bar = TTY::ProgressBar.new("RandomLock - BruteForce [:bar]", total: 10000)
# (0..9999).each do |n|
#   cr = Cracker.new(BruteForceStrategy.new, RandomLockStrategy, n)
#   cr.run
#   bar.advance(1)
# end

# bar = TTY::ProgressBar.new("RandomLock - StartMiddle [:bar]", total: 10000)
# (0..9999).each do |n|
#   cr = Cracker.new(StartMiddleStrategy.new, RandomLockStrategy, n)
#   cr.run
#   bar.advance(1)
# end

# bar = TTY::ProgressBar.new("RandomLock - StartDisplay [:bar]", total: 10000)
# (0..9999).each do |n|
#   cr = Cracker.new(StartDisplayStrategy.new, RandomLockStrategy, n)
#   cr.run
#   bar.advance(1)
# end

# bar = TTY::ProgressBar.new("LazyLock - BruteForce [:bar]", total: 10000)
# (0..9999).each do |n|
  # cr = Cracker.new(BruteForceStrategy.new, LazyLockStrategy, n)
  # cr.run
  # bar.advance(1)
# end

# bar = TTY::ProgressBar.new("LazyLock - StartMiddle [:bar]", total: 10000)
# (0..9999).each do |n|
  # cr = Cracker.new(StartMiddleStrategy.new, LazyLockStrategy, n)
  # cr.run
  # bar.advance(1)
# end

# bar = TTY::ProgressBar.new("LazyLock - StartDisplay [:bar]", total: 10000)
# (0..9999).each do |n|
#   cr = Cracker.new(StartDisplayStrategy.new, LazyLockStrategy, n)
#   cr.run
#   bar.advance(1)
# end

bar = TTY::ProgressBar.new("LazyLock - StartOppositeDisplay [:bar]", total: 10000)
(0..9999).each do |n|
  cr = Cracker.new(StartOppositeDisplayStrategy.new, LazyLockStrategy, n)
  cr.run
  bar.advance(1)
end
