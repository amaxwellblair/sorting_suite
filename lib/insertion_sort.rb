require 'pry'

class InsertionSort
  attr_accessor :input_array

  def sort(input_array)
    @input_array = input_array
    if data_valid?
      auxiliary_methods
    else
      #insert sorting code here
    end
  end

  def not_sorted?(array = input_array)
    array.each.with_index do |unit, i|
      if !array[i+1].nil?
         return true if unit > array[i+1]
      end
    end
    return false
  end

  def data_valid?(array = input_array)
    if nothing?(array)
      true
    elsif single_element?(array)
      true
    elsif just_nil?
      true
    else
      false
    end
  end

  def auxiliary_methods(array = input_array)
    if nothing?(array)
      []
    elsif single_element?(array)
      array
    elsif just_nil?
      nil
    end
  end

  def nothing?(array = input_array)
    array.length == 0
  end

  def single_element?(array = input_array)
    array.length == 1 && array.first != nil
  end

  def just_nil?(array = input_array)
    array.any?{|unit| unit == nil}
  end

end
