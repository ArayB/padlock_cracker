class RandomLockStrategy
  def self.display_code(lock_code)
    Array.new(lock_code.length) { rand(10) }
  end
end
