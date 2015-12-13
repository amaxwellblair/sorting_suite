$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'sort'

class QuickSort < Sort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_invalid?
      auxiliary_methods
    else
      quick_sort
    end
  end

  def quick_sort(array = input_array, sort = [])
    if array.length > 1
      partition(array, sort)
    else
      sort.push(array.first)
    end
    sort
  end

  def partition(array, sort = [])
    pivot = array[array.length/2]
    i = 0
    j = array.length - 1
    while i <= j
      if (array[i] >= pivot) && (array[j] <= pivot)
        swap = array[i]
        array[i] = array[j]
        array[j] = swap
        i += 1
        j -= 1
      elsif array[i] > pivot
        j -= 1
      elsif array[j] < pivot
        i += 1
      else
        i += 1
        j -= 1
      end
    end
    quick_sort(array[0..i-1], sort)
    quick_sort(array[i..-1], sort)
  end

end
