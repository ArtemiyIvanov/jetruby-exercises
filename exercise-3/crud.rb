FILE_PATH = 'main.txt'
BUFFER = 'buffer.txt'

def index
    File.foreach(FILE_PATH) {|line| puts line}
end

def where(word)
    File.foreach(FILE_PATH).with_index do |line, index|
        if line.include?(word)
            @line_id = index 
            break
        end
    end
    @line_id
end

def update(id, word)
    file = File.open(BUFFER, 'w')
    File.foreach(FILE_PATH).with_index do |line, index|
        file.puts(index == id ? word : line)
    end
    file.close

    File.write(FILE_PATH, File.read(BUFFER))

    File.delete(BUFFER) if (File.exist?(BUFFER))
end

def delete(id)
    file = File.open(BUFFER, 'w')
    File.foreach(FILE_PATH).with_index do |line, index|
        index == id ? next : file.puts(line)
    end
    file.close

    File.write(FILE_PATH, File.read(BUFFER))

    File.delete(BUFFER) if (File.exist?(BUFFER))
end

def find(id)
    File.foreach(FILE_PATH).with_index do |line, index|
        if index == id
            @line = line 
            break
        end
    end
    puts @line
end
