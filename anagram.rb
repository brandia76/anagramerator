
 require_relative 'reverse_letters'
 
 def find_anagram(str)
  
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
def add_to_list(ary,list)
  str = ary.join('')
  unless list.include? (str)
    list << str
  end
  list
end

test_string = "abcd"
big_list = find_anagram(test_string).sort
total = (1..test_string.length).reduce(:*) || 1
puts "words in list #{big_list.count}, total should be #{total}"

