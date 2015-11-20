module Word
 def self.find_anagrams(str)
    
    # create a list and add the initial word to it
    list = [str]

    # take the last two letter of each word, reverse them, and add them back to the array
    list.each do |word|
      temp_ary = word.scan(/./)
      new_array = temp_ary.pop(2)
      new_array << reverse_letters(temp_ary) 

      add_to_list(new_array ,list)
      add_to_list(new_array.rotate!,list)
      add_to_list(reverse_letters(new_array),list)
    end
   
    return list
  end

  #turn each word array into a word and add it to thing word list
  def self.add_to_list(ary,list)
    str = ary.join('')
    unless list.include? (str)
      list << str
    end
    list
  end

  def self.reverse_letters(arr)
    size = arr.length
    new_arr = Array.new(size)
    
    arr.each_with_index do |letter, index|
      new_arr[size-index-1] = letter
    end
    return new_arr
  end
end
