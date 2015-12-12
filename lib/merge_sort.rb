$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class MergeSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_invalid?
      auxiliary_methods
    else
      merge_sort
    end
  end

  def merge_sort(array = input_array)
    half = array.length / 2
    if array.length > 2
      first_half = merge_sort(array[0..half-1])
      second_half = merge_sort(array[half..-1])
      sort_halves(first_half, second_half)
    else
      sort_small_array(array).map{|unit| unit}
    end
  end

  def sort_halves(first_half, second_half)
    input_array.map do |it|
      if first_half.first == nil
        second_half.shift
      elsif second_half.first == nil
        first_half.shift
      elsif first_half.first > second_half.first
        second_half.shift
      else
        first_half.shift
      end
    end
  end

  def sort_small_array(array, sort = [])
    if array.length == 1
      sort << array.first
    elsif array.first < array.last
      sort << array.first << array.last
    else
      sort << array.last << array.first
    end
  end

end




#
# sorter = MergeSort.new
# sorter.sort([3,10,1,4])
