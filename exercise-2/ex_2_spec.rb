require 'rspec'
require './ex_2.rb'

RSpec.describe "ex_2 methods" do
    it "#return reverse word" do
        expect(last_2_char("hello")).to eq("olleh")
    end
    it "#return 2 to the power of the word length" do 
        expect(last_2_char("GOCS")).to eq(16)
    end
    it "#return 2 to the power of the word length" do 
        expect(last_2_char("GOCS")).to eq(16)
    end
end