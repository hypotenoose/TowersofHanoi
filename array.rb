class Array
  def my_uniq
    new_array = []
    self.each do |el|
      new_array << el unless new_array.include?(el)
    end
    new_array
  end

  def two_sum
    new_array = []
    self.each_with_index do |el, i|
      (0...self.length).each do |j|
        next if i == j
        new_array << [i, j] unless new_array.include?([j, i])
      end
    end
    new_array.select { |i| self[i[0]] + self[i[1]] == 0}
  end

  def my_transpose
    if self.any? { |el| el.class == Fixnum}
      raise ArgumentError.new "This is the worst error everrrr"
    end

    new_arr = Array.new(self.length) {Array.new(self.length)}
    self.length.times do |i|
      self.length.times do |j|
        new_arr[i][j] = self[j][i]
      end
    end
    new_arr
  end

  def stock_picker
    if self.length < 2
      raise ArgumentError.new "You need two days to make a profit!"
    end
    winner = [0,1]
    big_win = self[1] - self[0]
    self.each_with_index do |el, i|
      (i+1...self.length).each do |j|
        if self[j] - self[i] >= big_win
            winner = [i, j]
            big_win = self[j] - self[i]
        end
      end
    end
    winner
  end
end
