require 'rails_helper'

describe ZernikesController, :type => :controller do
   describe 'calls controller' do
        
        it 'call right controller fn' do
            ZernikesController = double()
            expect(ZernikesController).to receive(:compute)
            post :compute
        end
    end
end