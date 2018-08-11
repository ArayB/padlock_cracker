class Padlock
  DEFAULT_DIGITS = 4
  def initialize(digits = nil)
    @digits = digits || DEFAULT_DIGITS
    @lock_code = set_lock_code
    lock
  end

  def read
    @display_code
  end

  def unlock(unlock_code)
    @display_code = unlock_code
    correct = unlock_code == @lock_code
    @locked = !correct
    correct
  end

  def lock(strategy = RandomLockStrategy)
    @display_code = strategy.random_code(@lock_code)
    @locked = true
  end

  private

  def set_lock_code
    random_code
  end

  def random_code
    Array.new(@digits) { rand(10) }
  end

  class RandomLockStrategy
    def self.random_code(lock_code)
      Array.new(lock_code.length) { rand(10) }
    end
  end
end
