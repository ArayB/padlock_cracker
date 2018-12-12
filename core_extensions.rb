class Integer
  def to_lock_code
    ([0,0,0,0] + self.digits.reverse).last(4)
  end
end
