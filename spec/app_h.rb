require 'spec_helper'
require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
    describe "#mock_compute" do
        it "Calls mock of the compute" do
          ApplicationHelper.mock_compute
          expect(helper).to receive(:mock_compute)
        end
    end
end
