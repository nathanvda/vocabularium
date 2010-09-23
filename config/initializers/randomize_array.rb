class Array
  def randomize
    self.dup.sort_by { rand }
  end

  def randomize!
    self.replace self.randomize
  end

  def random
    self.randomize.first
  end

end