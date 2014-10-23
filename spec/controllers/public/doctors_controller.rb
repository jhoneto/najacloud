# encoding: utf-8

require 'spec_helper'

describe Public::DoctorsController, type: :controller do
  before(:each) do
    stub_const("Doctor", Class.new do
      def self.all
        "all"
      end
    end)
  end

  describe 'Requests' do
    describe 'GET index_json' do
      it "redirects to the new order" do
        # allow(controller).to receive(:get_doctors).and_return("meujson")
        get :index_json
        expect(response.body).to eq("all")
      end
    end
  end

  describe '.get_doctors' do
    it "returns Doctor.all", executar: true do
      # allow(Doctor).to receive(:all).and_return("retorno fake")
      expect(controller.send(:get_doctors)).to eq("all")
    end
  end
end
