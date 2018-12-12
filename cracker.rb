# frozen_string_literal: true

require 'csv'

require_relative './padlock.rb'
require_relative './crack_strategies/brute_force_strategy.rb'
require_relative './crack_strategies/start_middle_strategy.rb'
require_relative './crack_strategies/start_display_strategy.rb'
require_relative './crack_strategies/start_opposite_display_strategy.rb'
require_relative './lock_strategies/random_lock_strategy.rb'
require_relative './lock_strategies/lazy_lock_strategy.rb'
require_relative './core_extensions.rb'

class Cracker
  def initialize(crack_strategy = BruteForceStrategy.new,
                 lock_strategy = RandomLockStrategy,
                 integer_lock_code = nil)
    @strategy = crack_strategy
    @lock_strategy = lock_strategy
    lock_code = if integer_lock_code
                  integer_lock_code.to_lock_code
                else
                  nil
                end

    @padlock = Padlock.new(lock_strategy, lock_code)
    @initial_code = @padlock.read
    @digits = @initial_code.length
  end

  def run
    result = @strategy.run(@padlock)
    create_csv
    write_csv(result)
  end

  private

  def create_csv
    return if File.exist?(csv_path)
    CSV.open(csv_path,
             'wb',
             write_headers: true,
             headers: ['code','guesses']
            ) do |csv|
            end
  end

  def csv_path
    "./results/#{@lock_strategy}_#{@strategy.class}.csv"
  end

  def write_csv(result)
    header = ['code','guesses']
    CSV.open(csv_path, 'a') do |csv|
      row = CSV::Row.new(header,[])
      row['code'] = result[:code].join.to_i
      row['guesses'] = result[:guesses]
      csv << row
    end
  end
end
