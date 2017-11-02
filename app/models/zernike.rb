class Zernike < ActiveRecord::Base
  ### Upload
  require 'open-uri'
  
  def self.getparams
    # default values for diameter, defocus, wavelength, pixels, and image size
    default_vals = [3, 0, 550, 256, 20]
    return default_vals
  end 

  # stores to the database for the coefficients
  def self.setZernikes(zer)
    (0..65).each do |i|
      if zer[i] != "" #and zer[i].is_a? Numeric
        instance_variable_set('@z' + i.to_s, zer[i].to_f)
      end
    end
  end
  
  #gets from database to show in the view
  def self.zernikes
    @zernikes = []
    (0..65).each do |i|
      z = instance_variable_get('@z' + i.to_s)
      if not z.is_a? Numeric
        instance_variable_set('@z' + i.to_s, 0.0)
        z = 0.0
      end
      @zernikes << z
    end
    return @zernikes
  end
  
  def self.random
    (0..65).each do |i| 
         instance_variable_set('@z' + i.to_s, rand(0.0...0.99))
    end
  end
  
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :file_name, presence: true # Make sure the file's name is present.

  ### Upload
  #has_attached_file :file, styles: { }, default_url: "/images/:style/missing.png" 
  #validates_attachment :file, presence: true 
  ### "Using a before_save callback, then find the path, open the file and call File::read on the opened file."
  #before_save :contents_of_file_into_body
  #private
  #def contents_of_file_into_body
    #path = document.queued_for_write[:original].path
    #content = File.open(path).read
    #file = open(Zernike.file.url)
  #end

  
  def self.zNicknames
    n = ["Piston", "First order (prism)", "Vertical prism",
          "Horizontal prism", "second order (defocus and astigmatism)",
          "Astigmatism",
                "Defocus",
                "Astigmatism",
                "Third order (coma-like terms)",
                "Trefoil",
                "Vertical coma",
                "Horizontal coma",
                "Trefoil",
                "Fourth order",
                "Quadrafoil",
                "Secondary astig.",
                "Spherical aberration",
                "Secondary astig.",
                "Quadrafoil"]
    return n
  end
  
end 