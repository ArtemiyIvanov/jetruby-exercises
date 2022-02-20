
def is_number?(string)
    true if Float(string) rescue false
end

BALANCE_FILE_PATH = "balance.txt"
START_BALANCE = 100.0

if !File.exist?(BALANCE_FILE_PATH)
    File.open(BALANCE_FILE_PATH, "w") {|f| f.write(START_BALANCE)}
end
balance = File.read(BALANCE_FILE_PATH).to_f

MESSAGE_FOR_DEPOSIT = 
<<-STRING
\nYou should enter a number greater then zero to make a deposit.
If you want to go back type Q.\n
STRING

MESSAGE_FOR_WITHDROW = 
<<-STRING
\nYou should enter a number greater then zero to withdrow a money.
If you want to go back type Q\n
STRING

MESSAGE_NOT_A_NUMBER = 
<<-STRING
\nYou entered not a number.
Please try again.\n
STRING

START_MESSAGE = 
<<-STRING
\nEnter one of these commands:
    D - to deposit money
    W - to withdrow money
    B - to view balance
    Q - to quit\n
STRING

MESSAGE_NUMBER_LESS_THAN_0 = 
<<-STRING
\nYou entered a number not
greater then zero.
Please try again.\n
STRING

MESSAGE_CURRENT_BALANCE = "\nYour current balance:\n"

MESSAGE_BALANCE_LESS_THAN_NUMBER = 
<<-STRING
\nInsufficient funds 
in the account.
Please try again.\n
STRING
begin 

    puts START_MESSAGE
    command = gets.downcase.chomp

    case command
    when 'd'
        begin
        puts MESSAGE_FOR_DEPOSIT
        number = gets.downcase.chomp
        break if number == 'q'

        if !is_number?(number)
            puts MESSAGE_NOT_A_NUMBER 
            next
        end
        
        if number.to_f <= 0
            puts MESSAGE_NUMBER_LESS_THAN_0 
            next
        end
        balance += number.to_f
        puts MESSAGE_CURRENT_BALANCE + balance.to_s
        

    end while command != 'q'

    when 'w'
        begin
            puts MESSAGE_FOR_WITHDROW
            number = gets.downcase.chomp
            break if number == 'q'
    
            if !is_number?(number)
                puts MESSAGE_NOT_A_NUMBER 
                next
            end
            
            if number.to_f <= 0
                puts MESSAGE_NUMBER_LESS_THAN_0 
                next
            end
            if number.to_f > balance
                puts MESSAGE_BALANCE_LESS_THAN_NUMBER 
                next
            end
            balance -= number.to_f
            puts MESSAGE_CURRENT_BALANCE + balance.to_s   
    
        end while command != 'q'
    when 'b'
        puts MESSAGE_CURRENT_BALANCEgit + balance.to_s
    else 
        puts "\nYou entered incorrect command.\nPlease try again."
        next
    end
end while command != 'q'
File.write(BALANCE_FILE_PATH, balance)