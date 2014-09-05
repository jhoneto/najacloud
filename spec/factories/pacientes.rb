FactoryGirl.define do
  factory :paciente do
    nome 'paciente'
    organizacao_id 1
  end
  
  factory :paciente_2, class: Paciente do
    nome 'paciente 2'
    organizacao_id 2
  end
end