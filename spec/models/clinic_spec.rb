require 'spec_helper'

describe Clinic do
  specify "#doctors_names" do
    clinic = Clinic.new
    clinic.doctors = [Doctor.new(name: 'Doutor 1'), Doctor.new(name: 'Doutor 2'), Doctor.new(name: 'Doutor 3')]
    expect(clinic.doctors_names).to eq(['Doutor 1', 'Doutor 2', 'Doutor 3'])
  end
end
