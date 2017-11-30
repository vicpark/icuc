class Zernike < ActiveRecord::Base
  ### Upload
  require 'open-uri'
  def self.image_types
    return {"Convolution for 20 sized letter" => "CONV", "MTF Full" => "MTF", "MTF line" => "MTFL", "PSF" => "PSF", "PTF"=> "PTF", "Wavefront"=>"WF"}
  end
  
  def self.options
    return ['Wavefront', 'PSF', 'MTF Full', "PTF", "MTF line", "Convolution for 20 sized letter"]
  end
  
  def self.getpupdiam(rfit)
    @pupil_diameter = rfit.to_i * 2
  end


  def self.getdefault
    # default values for diameter, defocus, wavelength, pixels, and image size
    # default value for pupil diameter is rfit*2 if we uploaded file, else I just put 0 --Victoria
    default_vals = [@pupil_diameter || 0, 0, 550, 256, 20, 20]
    return default_vals
  end 

  # stores to the database for the coefficients
  def self.setZernikes(zer)
    (1..65).each do |i|
      if zer[i] != "" #and zer[i].is_a? Numeric
        instance_variable_set('@z' + (i).to_s, zer[i].to_f)
      end
    end
  end
  
  #gets from database to show in the view
  def self.zernikes
    @zernikes = [0.0]
    (1..65).each do |i|
      z = instance_variable_get('@z' + (i).to_s)
      if not z.is_a? Numeric
        instance_variable_set('@z' + (i).to_s, 0.0)
        z = 0.0
      end
      @zernikes << z
    end
    return @zernikes
  end
  
  def self.random
    (1..65).each do |i| 
         instance_variable_set('@z' + (i).to_s, rand(-0.999...0.999))
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
    n = [
[0,	0,"Piston"],
[1, -1,	"Vertical prism"],
[1,	1,"Horizontal prism"], 
[2,	-2, "Astigmatism"],
[2,	0, "Defocus"],
[2,	2, "Astigmatism"],
[3,	-3, "Trefoil"],
[3,	-1, "Vertical coma"],
[3,	1, "Horizontal coma"],
[3,	3,	"Trefoil"],
[4,	-4, "Quadrafoil"],
[4,	-2, "Secondary astig."],
[4,	0,  "Spherical aberration"],
[4,	2, "Secondary astig."],
[4,	4, "Quadrafoil"],
[5,	-5, "Vertical Pentafoil"],[5,	-3, "Secondary Vertical Trefoil"],[5,	-1, "Secondary Vertical Coma"],[5,	1, "Secondary Horizontal Coma"],[5,	3, "Secondary Horizontal Trefoil"],[5,	5, "Horizontal Pentafoil"],
[6,	-6, ""],[6,	-4, ""],[6,	-2, ""],[6,	0, ""],[6,	2, ""],[6,	4, ""],[6,	6, ""],
[7,	-7, ""],[7,	-5, ""],[7,	-3, ""],[7,	-1, ""],[7,	1, ""],[7,	3, ""],[7,	5, ""],[7,	7, ""],
[8,	-8, ""],[8,	-6, ""],[8,	-4, ""],[8,	-2, ""],[8,	0, ""],[8,	2, ""],[8,	4, ""],[8,	6, ""],[8,	8, ""],
[9,	-9, ""],[9,	-7, ""],[9,	-5, ""],[9,	-3, ""],[9,	-1, ""],[9,	1, ""],[9,	3, ""],[9,	5, ""],[9,	7, ""],[9,	9, ""],
[10,	-10, ""],[10,	-8, ""],[10,	-6, ""],[10,	-4, ""],[10,	-2, ""],[10,	0, ""],[10,	2, ""],[10,	4, ""],[10,	6, ""],[10,	8, ""],[10,	10, ""]]
    return n
  end
  
end 