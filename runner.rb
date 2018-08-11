require 'tty-progressbar'
require_relative './cracker.rb'

bar = TTY::ProgressBar.new("RandomLock - BruteForce [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(BruteForceStrategy.new, RandomLockStrategy)
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("RandomLock - StartMiddle [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(StartMiddleStrategy.new, RandomLockStrategy)
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("RandomLock - StartDisplay [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(StartDisplayStrategy.new, RandomLockStrategy)
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("LazyLock - BruteForce [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(BruteForceStrategy.new, LazyLockStrategy)
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("LazyLock - StartMiddle [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(StartMiddleStrategy.new, LazyLockStrategy)
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("LazyLock - StartDisplay [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(StartDisplayStrategy.new, LazyLockStrategy)
  cr.run
  bar.advance(1)
end
