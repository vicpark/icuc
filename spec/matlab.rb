require 'spec_helper'
require 'rails_helper'

describe Matlab do
    
    describe "controlle" do
        it 'calls similar with the right movie id' do
            expect(controller).to receive(:compute)
            get :compute
        end
    end
    
    describe "#mock_compute" do
        it "Calls mock of the compute" do
          post compute_path
          expect(Matlab).to receive(:mock_compute)
        end
    end
end
