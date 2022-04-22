require 'rspec'
require './ex_1.rb'

RSpec.describe "ex_1 methods" do
    it "#return a message for an adult" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Артемий', 'Иванов', '22')
        expect(greeting).to eq("Привет, Артемий Иванов. Самое время заняться делом!\n")
    end
    it "#return a message for a minor" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Артемий', 'Иванов', '17')
        expect(greeting).to eq("Привет, Артемий Иванов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано.\n")
    end
    it "#test foobar. If first number = 20" do
        expect(foobar(20, 10)).to eq(10)
    end
    it "#test foobar. If second number = 20" do
        expect(foobar(15, 20)).to eq(15)
    end
    it "#test foobar. If there is no number = 20" do
        expect(foobar(15, 2)).to eq(17)
    end
    it "#test foobar. If first and second numbers = 20" do
        expect(foobar(20, 20)).to eq(20)
    end
end