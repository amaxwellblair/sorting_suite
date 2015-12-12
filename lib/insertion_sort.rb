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
      sorting_array = input_array
      complete_array = [sorting_array.shift]
      sorting_array.each do |unsort|
        inserted = false
        i = 0
        while inserted == false
          if unsort <= complete_array[i]
            complete_array.insert(i, unsort)
            inserted = true
          elsif complete_array[i+1].nil?
            complete_array.insert(i+1, unsort)
            inserted = true
          end
          i += 1
        end
      end
      return complete_array
    end
  end
end
