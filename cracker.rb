# frozen_string_literal: true

require 'csv'

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
    "./results/#{@strategy.class}.csv"
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
