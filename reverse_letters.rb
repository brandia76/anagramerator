def reverse_letters(arr)
  size = arr.length
  new_arr = Array.new(size)
  
  arr.each_with_index do |letter, index|
    new_arr[size-index-1] = letter
  end
  return new_arr
end
