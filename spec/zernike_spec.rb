require "rails_helper"

RSpec.describe Zernike, :type => :model do
  subject {
  described_class.new(z1: 0, z2: 2, z3: 4)
  }
  
  it "initializes as nil" do
      zernike = Zernike.new
      expect(zernike.file_file_name).to equal(nil)
  end
  
  it "(example) has z1 equal to 0" do
      expect(subject.z1).to eq 0
  end
  
  it "(example) has z2 equal to 2 " do
      expect(subject.z2).to eq 2
  end

end
