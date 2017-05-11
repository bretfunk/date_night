require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_new_node_has_a_rating
    test = Node.new(50, "IT")
    result = test.rating
    assert_equal(50, result)
  end

  def test_new_node_has_a_title
    test = Node.new(100, "Star Wars")
    result = test.title
    assert_equal("Star Wars", result)
  end

  def test_new_node_has_a_left_node
    test = Node.new(25, "JFK")
    result = test.left
    assert_equal(nil, result)
  end

  def test_new_node_has_a_right_node
    test = Node.new(25, "JFK")
    result = test.right
    assert_equal(nil, result)
  end

  def test_insert_new_node_right
    test = Node.new(25, "JAWS")
    test2 = test.insert(30, "SALT")
    result = test.right.nil?
    assert_equal(false, result)
  end

  def test_insert_new_node_left
    test = Node.new(25, "JAWS")
    test2 = test.insert(15, "24")
    result = test.left.nil?
    assert_equal(false, result)
  end

  def test_insert_new_node_right_left
    test = Node.new(25, "JAWS")
    test2 = test.insert(30, "SALT")
    test3 = test.insert(29, "42")
    result = test.right.left.nil?
    assert_equal(false, result)
  end

  def test_insert_new_node_left_right
    test = Node.new(25, "JAWS")
    test2 = test.insert(15, "Empire Records")
    test3 = test.insert(16, "Fargo")
    result = test.left.right.nil?
    assert_equal(false, result)
  end

  def test_insert_new_node_left_left
    test = Node.new(25, "JAWS")
    test2 = test.insert(24, "SALT")
    test3 = test.insert(23, "Space Jam")
    result = test.left.left.nil?
    assert_equal(false, result)
  end

  def test_insert_new_node_right_right
    test = Node.new(25, "JAWS")
    test2 = test.insert(26, "Casino")
    test3 = test.insert(27, "Batman")
    result = test.right.right.nil?
    assert_equal(false, result)
  end

  def include_head_node
    test = Node.new(25, "JAWS")
    result = test.include?(25)
    assert_equal(true, result)
  end

  def include_other_node
    test = Node.new(25, "JAWS")
    test2 = test.insert(30, "SALT")
    result = test.include?(30)
    assert_equal(true, result)
  end

  def include_other_other_node
    test = Node.new(25, "JAWS")
    test2 = test.insert(20, "UP")
    result = test.include?(20)
    assert_equal(true, result)
  end

  def include_node_that_isnt_there
    test = Node.new(25, "JAWS")
    result = test.include?(26)
    assert_equal(false, result)
  end

  def include_other_node_that_isnt_there
    test = Node.new(25, "JAWS")
    result = test.include?(10000)
    assert_equal(false, result)
  end

  def test_depth_of_head_node
    test= Node.new(25, "JAWS")
    result = test.depth_of(25)
    assert_equal(0, result)
  end

  def test_depth_of_child_node
    test = Node.new(25, "JAWS")
    test2 = test.insert(99, "Star Wars")
    result = test.depth_of(99)
    assert_equal(1, result)
  end

  def test_depth_of_child_child_node
    test = Node.new(25, "JAWS")
    test2 = test.insert(26, "Star Wars")
    test3 = test.insert(27, "Contact")
    result = test.depth_of(27)
    assert_equal(2, result)
  end

  def test_depth_of_child_child_child_node
    test = Node.new(25, "JAWS")
    test2 = test.insert(26, "Star Wars")
    test3 = test.insert(27, "Contact")
    test4 = test.insert(28, "Paycheck")
    result = test.depth_of(28)
    assert_equal(3, result)
  end

  def test_depth_of_node_that_isnt_there
    test = Node.new(25, "JAWS")
    result = test.depth_of(30)
    assert_equal(nil, result)
  end

  def test_max
    test = Node.new(25, "JAWS")
    test2 = test.insert(50, "WALL-E")
    test3 = test.insert(51, "Trumbo")
    result = test.max
    assert_equal(51, result)
  end

  def test_max_again
    test = Node.new(25, "JAWS")
    test2 = test.insert(10, "Forrest Gump")
    test3 = test.insert(1, "Dumbo")
    result = test.max
    assert_equal(25, result)
  end

  def test_max_extreme
    test = Node.new(25, "JAWS")
    test2 = test.insert(100, "Braveheart")
    test3 = test.insert(10000000, "Apollo 13")
    result = test.max
    assert_equal(10000000, result)
  end

  def test_min
    test = Node.new(25, "JAWS")
    test2 = test.insert(100, "Braveheart")
    test3 = test.insert(10000000, "Apollo 13")
    result = test.min
    assert_equal(25, result)
  end

  def test_min_again
    test = Node.new(25, "JAWS")
    test2 = test.insert(10, "Beetlejuice")
    test3 = test.insert(5, "TMNT")
    result = test.min
    assert_equal(5, result)
  end

  def test_min_extreme
    test = Node.new(25, "JAWS")
    test2 = test.insert(2, "Aladin")
    test3 = test.insert(0.000000001, "Stewart Little")
    result = test.min
    assert_equal(0.000000001, result)
  end
end
