def greeting
    #puts "Enter a first name:"
    first_name = gets.chomp 
    #puts "Enter a second name:"
    second_name = gets.chomp
    #puts "Enter an age:"
    age = gets.to_i
    greeting_part = "Привет, #{first_name} #{second_name}. "
    age >= 18? greeting_part + "Самое время заняться делом!\n":
    greeting_part + "Тебе меньше 18 лет, но начать учиться программировать никогда не рано.\n"
end


def foobar(first_num, second_num)
    first_num == 20? second_num : (second_num == 20? first_num : first_num + second_num)
end

puts foobar(1,20.1)