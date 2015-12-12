$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class BubbleSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_invalid?
      auxiliary_methods
    else
      bubble_sort
    end
  end

  def bubble_sort(array = input_array)
    while not_sorted?(array)
      array.length.times do |i|
        left, right = array[i], array[i+1]
        if swap?(left, right)
          array[i], array[i+1] = right, left
        end
      end
    end
    return array
  end

  def swap?(left, right)
    if !left.nil? && !right.nil?
      left > right
    else
      false
    end
  end
end
