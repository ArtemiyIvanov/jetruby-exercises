class CashMachine

    attr_reader :balance

    BALANCE_FILE_PATH = "balance.txt"
    START_BALANCE = 100.0

    START_MESSAGE = 
    <<-STRING
    \nEnter one of these commands:
        D - to deposit money
        W - to withdrow money
        B - to view balance
        Q - to quit\n
    STRING

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
\nYou entered not a number.\nPlease try again.
    STRING

    MESSAGE_NUMBER_LESS_THAN_0 = 
    <<-STRING
\nYou entered a number not greater then zero.\nPlease try again.
    STRING

    MESSAGE_CURRENT_BALANCE = "\nYour current balance:\n"

    MESSAGE_BALANCE_LESS_THAN_NUMBER = 
    <<-STRING
\nInsufficient funds in the account.\nPlease try again.
    STRING

    def initialize()
        if !File.exist?(BALANCE_FILE_PATH)
            File.open(BALANCE_FILE_PATH, "w") {|f| f.write(START_BALANCE)}
        end
        balance = File.read(BALANCE_FILE_PATH).to_f
        @balance = balance
    end

    def is_number?(string)
        true if Float(string) rescue false
    end

    def deposit(value)
        if !is_number?(value)
            return MESSAGE_NOT_A_NUMBER
        end
        if value.to_f <= 0
            return MESSAGE_NUMBER_LESS_THAN_0 
        end
        @balance += value.to_f
        return MESSAGE_CURRENT_BALANCE + @balance.to_s
    end

    def withdrow(value)
        if !is_number?(value)
            return MESSAGE_NOT_A_NUMBER
        end
        if value.to_f <= 0
            return MESSAGE_NUMBER_LESS_THAN_0 
        end
        if value.to_f > balance
            return MESSAGE_BALANCE_LESS_THAN_NUMBER 
        end
        @balance -= value.to_f
        return MESSAGE_CURRENT_BALANCE + @balance.to_s
    end
    def self.init()

        cash_machine = CashMachine.new()

        loop do
            puts START_MESSAGE
            command = gets.downcase.chomp
            break if command == 'q'
            case command
            when 'd'
                puts MESSAGE_FOR_DEPOSIT
                value = gets.downcase.chomp
                next if value == 'q'
                print cash_machine.deposit(value)
                next
            when 'w'
                puts MESSAGE_FOR_WITHDROW
                value = gets.downcase.chomp
                next if value == 'q'
                print cash_machine.withdrow(value)
                next
            when 'b'
                puts MESSAGE_CURRENT_BALANCE + cash_machine.balance.to_s
                next
            else 
                puts "\nYou entered incorrect command.\nPlease try again."
                next
            end
        end
        File.write(BALANCE_FILE_PATH, cash_machine.balance)
    end
    
end
    
CashMachine.init()