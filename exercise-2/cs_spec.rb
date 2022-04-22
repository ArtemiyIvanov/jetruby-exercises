require 'rspec'
require './cs.rb'

RSpec.describe "last_2_chars method" do
    it "#return reverse word" do
        expect(last_2_chars("hello")).to eq("olleh")
    end
    it "#return 2 to the power of the word length" do 
        expect(last_2_chars("GOCS")).to eq(16)
    end
end