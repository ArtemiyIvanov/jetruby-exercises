require 'rspec'
require './pokemons.rb'

RSpec.describe "ask_about_pokemons" do
    it "#return a pokemon list" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(2,'Pikachu','Yellow', 'Charizard','Orange')

        expect(ask_about_pokemons).to eq([{name: 'Pikachu', color: 'Yellow'}, {name: 'Charizard', color: 'Orange'}])
    end
    it "#return an empty pokemon list" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(0)

        expect(ask_about_pokemons).to eq([])
    end
    
   
end