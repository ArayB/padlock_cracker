class Padlock
  def initialize(lock_strategy = RandomLockStrategy, lock_code = nil)
    @lock_strategy = lock_strategy
    @lock_code = lock_code || set_lock_code
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

  def lock
    @display_code = @lock_strategy.display_code(@lock_code)
    @locked = true
  end

  private

  def set_lock_code
    random_code
  end

  def random_code
    Array.new(4) { rand(10) }
  end
end
