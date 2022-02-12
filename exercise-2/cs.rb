def last_2_chars(word)
    word = word.chomp
    word[-2..-1] == "CS"? 2**(word.length) : word.reverse
end

puts "Type a word"

word = gets.chomp

puts last_2_chars(word)