class LazyLockStrategy
  def self.display_code(lock_code)
    # decide whether to go up or down
    direction = [1, -1].sample
    digits = (0..9).to_a

    # rotate each dial by <= 4 spots in direction
    lazy_code = lock_code.map do |n|
      digits.rotate(direction * (1 + rand(4)))[n]
    end
    lazy_code
  end
end
