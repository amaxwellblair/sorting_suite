$LOAD_PATH.unshift("../lib/")

require 'insertion_sort'
require 'minitest'

class InsertionSortTest < Minitest::Test
attr_accessor :sorter

  def setup
    @sorter = InsertionSort.new
  end

  def test_sort_class
    assert_equal InsertionSort, sorter.class
  end

  def test_sort_empty
    assert_equal [], sorter.sort([])
  end

  def test_sort_nil
    assert_equal nil, sorter.sort([nil])
  end

  def test_sort_one
    assert_equal [3], sorter.sort([3])
  end

  def test_sort_two
    assert_equal [2,3], sorter.sort([3,2])
  end

  def test_sort_three
    assert_equal [1,3,10], sorter.sort([3,10,1])
  end

  def test_sort_alot
    assert_equal [1,2,3,4,5,6,7,8,9,10], sorter.sort([10,8,1,2,3,5,7,6,9,4])
  end

  def test_sort_alpha_three
    assert_equal %w(a b c d e), sorter.sort(%w(b a c e d))
  end

  def test_not_sort_true
    assert sorter.not_sorted?([10,8,1,2,3,5,7,6,9,4])
  end

  def test_not_sort_false
    refute sorter.not_sorted?([1,2,3,4,5,6])
  end

  def test_reverse
    x = (1..10).to_a.reverse
    assert_equal (1..10).to_a, sorter.sort(x)
  end

end
