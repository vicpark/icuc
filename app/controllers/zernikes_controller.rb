class ZernikesController < ApplicationController
    
    def zernike_params
        params.require(:zernike).permit(:uploaded_file)
    end
    
    def index
    end 
    
    def new
        @zernike = Zernike.new
        @fields = Zernike.parameters
        flash[:notice] = "Zernike equation successfully computed!"
        byebug
    end
    
    
    def create
        @zernike = Zernike.create!(zernike_params)
        flash[:notice] = "Zernike equation successfully computed!"
        
        redirect_to get_image_path
    end 
    
    def show
    end
    
    #Upload action ensures that submitted file is uploaded if it meets the requirements
    def upload
       # connected to upload.html.haml form
       # looks for :zernike in params, existence means file is attached
       # significant help from "http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm"
        if params[:zernike]
            uploaded_file = params[:zernike][:attachment]
            file_name = uploaded_file.original_filename
            jsonified_file = uploaded_file.as_json
            # puts jsonified_file # UNCOMMENT MEE
            
            extract_data = coefficients_extractor(jsonified_file)
            # puts extract_data
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
        puts jsonified_file =~ important_lines
        
    end

end