require 'tty-progressbar'
require_relative './cracker.rb'

# Run brute force strategy multiple times
bar = TTY::ProgressBar.new("BruteForceStrategy [:bar]", total: 1000)
1000.times do
  cr = Cracker.new
  cr.run
  bar.advance(1)
end

bar = TTY::ProgressBar.new("StartMiddleStrategy [:bar]", total: 1000)
1000.times do
  cr = Cracker.new(StartMiddleStrategy.new)
  cr.run
  bar.advance(1)
end
