require 'rspec'
require './cs.rb'

RSpec.describe "last_2_char method" do
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