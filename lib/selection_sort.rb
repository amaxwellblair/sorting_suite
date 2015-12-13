$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class SelectionSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_invalid?
      auxiliary_methods
    else
      selection_sort
    end
  end

  def selection_sort(array = input_array, sorted = [])
    input_array.length.times do
      sorted << array.delete_at(min_index(array))
    end
    sorted
  end

  def min_index(array, index = 0)
    min = array.first
    array.each.with_index do |unit, i|
      if min > unit
        min = unit
        index = i
      end
    end
    return index
  end

end
