class Zernike < ActiveRecord::Base
  ### Upload
  require 'open-uri'
  
  def self.parameters
    par = []
    (0..10).each do |i| 
        par << i
        #par << [i, "parameter #{i}"]
    end
    return par
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