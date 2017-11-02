class ZernikesController < ApplicationController
    
    def zernike_params
    #    params.require(:zernike).permit(:uploaded_file)
    end
    
    def main
        @zernikes = Zernike.zernikes
    end 
    
    def manual
        @zernikes = Zernike.zernikes
        @nicknames = Zernike.zNicknames
    end
    
    def update
        zer = []
        (0..65).each do |i|
            zer << params[i.to_s]
        end
        Zernike.setZernikes(zer)
        @zernikes = Zernike.zernikes
        redirect_to root_path
    end
    
    def random
        Zernike.random
        @zernikes = Zernike.zernikes
        redirect_to root_path 
    end
    
    def create
        @zernike = Zernike.create!(zernike_params)
        flash[:notice] = "Zernike equation successfully computed!"
        redirect_to get_image_path
    end 
    
    def compute
    end
    
    #Upload action ensures that submitted file is uploaded if it meets the requirements
    def upload
       # connected to upload.html.haml form
       # looks for :zernike in params, existence means file is attached
       # significant help from "http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm"
        if params[:zernike]
            uploaded_file = params[:zernike][:attachment]
            file_name = uploaded_file.original_filename
            jsonified_file = uploaded_file.as_json["tempfile"]
            extract_data = coefficients_extractor(jsonified_file)
            @file = extract_data
            
            if  @file.nil? or @file.empty?
                flash[:warning] = "Unable to upload file"
                # made it a "warning" instead of "notice" so we can change the colors/text
            else
                flash[:notice] = "File successfully uploaded!"
            end
            
            redirect_to zernikes_path
        end
      
        # if not @file.nil?
        #     byebug
        # end
        # self.content = [TEXT INSIDE test.txt]
    #     @file = params[:file]
    #     byebug
    #     @zernike = Zernike.
    #     if @zernike.save
    #         flash[:notice] = "File successfully uploaded!"
    #         redirect_to 
    #     else 
    #         flash[:notice] = "Unable to upload file"
            
        # byebug
        # @file = params[:file]
        # if @file.nil? or @file.empty?   
        #     flash[:notice] = "File is empty!"
        # else 
        #     flash[:notice] = "File successfully uploaded!"
        # end
    
    end
    
    ###
    # app/controllers/documents_controller.rb
    def document_params
        params.require(:document).permit(:file)
    end
    
    private
    def coefficients_extractor(jsonified_file)
        important_lines = /^[^#].*/i
        for key in jsonified_file
            # assign variable "Z#{key[0]}_#{key[1]}" value key[3]
            puts important_lines.match(key)
            
            # format printed loosely is : subscript superscript actual_coefficient
            
        end
        
    end

end