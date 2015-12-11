$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class MergeSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_valid?
      auxiliary_methods
    else
      merge_sort
    end
  end

  def merge_sort
    splitting_array


end
