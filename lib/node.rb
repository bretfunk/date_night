class Node
  attr_accessor :rating, :title, :left, :right

  def initialize(rating, title, left=nil, right=nil)
    @rating = rating
    @title  = title
    @left   = left
    @right  = right
  end

  def insert(add_rating, add_title)
    if add_rating < rating
      if left == nil
        @left = Node.new(add_rating, add_title)
      else
        left.insert(add_rating, add_title)
      end
    elsif add_rating > rating
      if right == nil
        @right = Node.new(add_rating, add_title)
      else
        right.insert(add_rating, add_title)
      end
    end
  end

  def include?(num)
    if num > rating && !right.nil?
      @right.include?(num)
    elsif num > rating && right.nil?
      false
    elsif num < rating && !left.nil?
      @left.include?(num)
    elsif num < rating && left.nil?
      false
    elsif num == rating
      true
    end
  end

  def depth_of(num, depth=0)
    if num > rating && !right.nil?
      @right.depth_of(num, depth += 1)
    elsif num > rating && right.nil?
      nil
    elsif num < rating && !left.nil?
      @left.depth_of(num, depth += 1)
    elsif num < rating && left.nil?
      nil
    elsif num == rating
      depth
    end
  end

  def max(num=0)
    if num < rating && !right.nil?
      @right.max(num)
    elsif num < rating && right.nil?
      rating
    end
  end

  def min(num=101)
    if num > rating && !left.nil?
      @left.min(num)
    elsif num > rating && left.nil?
      rating
    end
  end

  def loadz(file)
    loaded = 0
    import_file = File.open(file, 'r')
      import_file.each do |line|
        insert(line.split(", ")[0].to_i, line.split(", ")[1].to_s.chomp)
        loaded += 1
    end
    puts loaded
  end
end
