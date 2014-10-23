# encoding: utf-8

require 'spec_helper'

describe "As a public User", type: :request do
  describe "I can list the doctors" do
    specify "I should see a message when there is no doctor" do
      visit public_doctors_path
      save_and_open_page
      expect(page).to have_content("Não existem médicos cadastrados.")
    end

    specify "I should see the doctors list" do
      FactoryGirl.create(:doctor, name: 'bruno')
      FactoryGirl.create(:doctor, name: 'leandro')
      FactoryGirl.create(:doctor, name: 'vinicius')
      visit public_doctors_path
      expect(page).to have_content("bruno")
      expect(page).to have_content("vinicius")
      expect(page).to have_content("leandro")
    end
  end

  specify "I can add new doctors", f:true, js: true do
    FactoryGirl.create(:clinic, name:  'Clinica Legal')
    expect(Doctor.count).to be(0)
    visit public_doctors_path
    click_link "Adicionar"
    fill_in 'doctor_name',                   with: 'Clodoaldo'
    select "1", from: 'doctor_birthdate_3i'
    select "Agosto", from: 'doctor_birthdate_2i'
    select "2009", from: 'doctor_birthdate_1i'
    page.find('.cpy-show-phone').click
    sleep 1


    fill_in 'doctor_phone',                    with: '123123123'

    select 'Clinica Legal',    from: 'doctor_clinic_id'
    click_button "Salvar"
    expect(Doctor.count).to be(1)
  end
end
