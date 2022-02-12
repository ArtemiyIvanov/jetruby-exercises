def last_2_char(word)
    word[-2..-1] == "CS"? 2**(word.length) : word.reverse
end