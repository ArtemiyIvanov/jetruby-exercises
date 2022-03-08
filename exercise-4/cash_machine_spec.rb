require 'rspec'
require './cash_machine.rb'

RSpec.describe CashMachine do
    subject { CashMachine.new() }
    describe "#deposit" do
        let(:value) { 10.0 } 
        it "increases account balance" do
            balance = subject.balance
            expect(subject.deposit(value)).to eq("\nYour current balance:\n" + (balance + value).to_s)
        end
        context "when an user tries to enter not a number" do
        let(:value) { "qqrw" } 
        let(:massage) do 
            "\nYou entered not a number.\nPlease try again.\n"    
        end
        it "returns a message that the user entered not a number" do
            balance = subject.balance
            expect(subject.deposit(value)).to eq(massage)
        end
    end
    context "when an user tries to enter number not greater then zero" do
        let(:value) { -1.0 } 
        let(:massage) do 
            "\nYou entered a number not greater then zero.\nPlease try again.\n"    
        end
        it "returns a message that the user entered number not greater then zero" do
            balance = subject.balance
            expect(subject.deposit(value)).to eq(massage)
        end
    end
    end

    describe "#withdrow" do
        let(:value) { 10.0 } 
        it "decrease account balance" do
            balance = subject.balance
            expect(subject.withdrow(value)).to eq("\nYour current balance:\n" + (balance - value).to_s)
        end
        context "when an user tries to enter not a number" do
        let(:value) { "qqrw" } 
        let(:massage) do 
            "\nYou entered not a number.\nPlease try again.\n"    
        end
        it "returns a message that the user entered not a number" do
            balance = subject.balance
            expect(subject.withdrow(value)).to eq(massage)
        end
    end
    context "when an user tries to enter number not greater then zero" do
        let(:value) { -1.0 } 
        let(:massage) do 
            "\nYou entered a number not greater then zero.\nPlease try again.\n"    
        end
        it "returns a message that the user entered number not greater then zero" do
            balance = subject.balance
            expect(subject.withdrow(value)).to eq(massage)
        end
    end
    context "when an user tries to enter number greater then account balance" do
        let(:value) { 1 } 
        let(:massage) do 
            "\nInsufficient funds in the account.\nPlease try again.\n"    
        end
        it "returns a message that the user entered number not greater then zero" do
            balance = subject.balance
            expect(subject.withdrow(value + balance)).to eq(massage)
        end
    end
    end
end
