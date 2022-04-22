require 'rspec'
require './students.rb'
RSpec.describe "students script" do
    let(:students_list) do
        <<-STUDENTS
Tom Phelps 22
Edghar Thaub 21
Peter Parker 18
Bruce Benner 23
Curt Connors 17
Steven Strange 19
Steve Rogers 24
Bruce Wayne 25
Natasha Romanoff 21
Eddie Brock 20
STUDENTS
    end
    let(:result_list) do
        <<-STUDENTS
Tom Phelps 22
Edghar Thaub 21
Natasha Romanoff 21
Peter Parker 18
Bruce Benner 23
Curt Connors 17
Steven Strange 19
Steve Rogers 24
Bruce Wayne 25
Eddie Brock 20
STUDENTS
    end
    it "return students with age = 21 and age = 24" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(-2,-3,29,21,21, 24,-1)
        expect(main).to eq("Edghar Thaub 21\nNatasha Romanoff 21\nSteve Rogers 24\n")
    end
    it "return an empty string" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(-2,-3,29,30,-1)
        expect(main).to eq("")
    end
    it "return all students" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(22,21,18,23,17,19,24,25,20,-1)
        expect(main).to eq(result_list)
    end
end
