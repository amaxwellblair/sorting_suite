$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class InsertionSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_invalid?
      auxiliary_methods
    else
      insert_sort
    end
  end

  def insert_sort(array = input_array)
    complete_array = [array.shift]
    array.each do |unsorted|
      index = nil
      complete_array.each.with_index do |sorted, i|
        unsorted <= sorted ? index = i : nil
        break if index != nil
      end
      index = complete_array.length if index.nil?
      complete_array.insert(index, unsorted)
    end
    complete_array
  end

end
