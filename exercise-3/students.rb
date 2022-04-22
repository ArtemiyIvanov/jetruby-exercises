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
RESULT_FILE_PATH = 'result.txt'
def main
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

        puts "Enter an age of student\n input -1 to stop\n"
        age = gets
        age = age.to_i
        break if age == -1
        id = where(age.to_s, students)
        if id.empty? 
            puts "There're no students with that age :(\n Try again\n"
        else 
            puts "Added successfuly\n" 
        end
        for i in id
            result.include?(students[i]) ? next : result.push(students[i])
        end
    end while students.length != result.length

    puts "file contains all students" if students.length != result.length

    result_file = File.open(RESULT_FILE_PATH, 'w')

    result.each do |student|
        result_file.puts(student[:first_name] + ' ' + student[:second_name] + ' ' + student[:age])
    end
    result_file.close

    return File.read(RESULT_FILE_PATH)
end
puts main