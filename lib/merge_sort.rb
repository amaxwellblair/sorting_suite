$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class MergeSort < Sort
  attr_accessor :input_array, :sort_array

  def sort(input_array)
    @input_array = input_array
    @sort_array = []
    if data_valid?
      auxiliary_methods
    else
      merge_sort
    end
  end

  def merge_sort(array = input_array)
    sort = []
    splitting_array = array
    half = splitting_array.length / 2
    if half > 1
      first_half = splitting_array[0..half-1]
      second_half = splitting_array[half..-1]
      first_half = merge_sort(first_half)
      second_half = merge_sort(second_half)
      i = 0
      while i < splitting_array.length
        # binding.pry
        if first_half.first == nil
          sort << second_half.shift
        elsif second_half.first == nil
          sort << first_half.shift
        elsif first_half.first > second_half.first
          sort << second_half.shift
        else
          sort << first_half.shift
        end
        i += 1
      end
    else
      #need to add in functionality for threes!
      if splitting_array.first < splitting_array.last
        sort << splitting_array.first << splitting_array.last
      else
        sort << splitting_array.last << splitting_array.first
      end
    end
    return sort
  end

end
#
# sorter = MergeSort.new
# sorter.sort([3,10,1,4])
