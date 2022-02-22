def greeting
    puts "Enter a first name:"
    first_name = gets.chomp 
    puts "Enter a second name:"
    second_name = gets.chomp
    puts "Enter an age:"
    age = gets.to_i
    greeting_part = "Привет, #{first_name} #{second_name}. "
    if age >= 18
        greeting_part + "Самое время заняться делом!\n"
    else
        greeting_part + "Тебе меньше 18 лет, но начать учиться программировать никогда не рано.\n"
    end
end


def foobar(first_num, second_num)
    if first_num == 20
        second_num     
    elsif second_num == 20
        first_num
    else 
        first_num + second_num
    end
end