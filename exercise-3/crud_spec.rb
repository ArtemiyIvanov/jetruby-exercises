require 'rspec'
require './crud.rb'

RSpec.describe "crud methods" do
    let(:string) do
        "Hello\nGoodbye\nAgain\n"
    end
    let(:string1) do
        "Hello\nKick\nAgain\n"
    end
    let(:string2) do
        "Hello\nAgain\n"
    end
    let(:string3) do
        "Hello\n"
    end
    before {File.write(FILE_PATH, string)}

    it "#index" do
        expect {index}.to output(string).to_stdout
    end

    it "#where" do
        expect(where('Goodbye')).to eq(1)
    end
    it "#update" do
        update(1,'Kick')
        expect {index}.to output(string1).to_stdout
    end
    it "#delete" do
        delete(1)
        expect {index}.to output(string2).to_stdout
    end
    it "#find" do
        expect {find(0)}.to output(string3).to_stdout
    end
end