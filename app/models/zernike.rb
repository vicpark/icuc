class Zernike < ActiveRecord::Base
  def self.parameters
    par = []
    (0..10).each do |i| 
        par << i
        #par << [i, "parameter #{i}"]
    end
    return par
  end
end 