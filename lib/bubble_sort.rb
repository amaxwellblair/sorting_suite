$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class BubbleSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_valid?
      auxiliary_methods
    else
      sorting_array = input_array
      while not_sorted?(sorting_array)
        sorting_array.each.with_index do |unit, i|
          left, right = sorting_array[i], sorting_array[i+1]
          if swap?(left, right)
            sorting_array[i], sorting_array[i+1] = right, left
          end
        end
      end
      return sorting_array
    end
  end

  def swap?(left, right)
    if !left.nil? && !right.nil?
      left > right
    else
      false
    end
  end
end
