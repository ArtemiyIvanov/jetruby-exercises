def where(age, students)
    id = []
    students.each_with_index do |student, index|
        if student[:age] == age
            id.push(index)
        end
    end
    return id
end

STUDENTS_FILE_PATH = 'students.txt'
string = 
<<-STUDENTS
Tom Phelps 22
Edghar Thaub 21
Peter Parker 18
Bruce Benner 23
Curt Connors 17
Steven Strange 19
Steve Rogers 24
Bruce Wayne 25
Natasha Romanoff 21
Eddie Brock 20
STUDENTS
RESULT_FILE_PATH = 'result.txt'

File.write(STUDENTS_FILE_PATH, string)
students = []
File.foreach(STUDENTS_FILE_PATH) do |line|
    student = {}
    split_line = line.split
    student[:first_name] = split_line[0]
    student[:second_name] = split_line[1]
    student[:age] = split_line[2]
    students.push(student)
end

result = []
begin

    puts "Enter an age of student"
    age = gets.to_i
    break if age == -1
    id = where(age.to_s, students)
    for i in id
        result.push(students[i])
    end
end while students.length != result.length

result_file = File.open(RESULT_FILE_PATH, 'w')

result.each do |student|
    result_file.puts(student[:first_name] + ' ' + student[:second_name] + ' ' + student[:age])
end
result_file.close

puts File.read(RESULT_FILE_PATH)

