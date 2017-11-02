class Zernike < ActiveRecord::Base
  ### Upload
  require 'open-uri'
  
  def self.new_zernike
    (0..65).each do |i| 
         instance_variable_set('@z' + i.to_s, 0.0)
    end
  end
  
  
  def self.setZernikes(zer)
    (0..65).each do |i|
      if zer[i] != "" and zer[i].is_a? Numeric
        instance_variable_set('@z' + i.to_s, zer[i])
      end
    end
  end
  
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

  
  
  
end 