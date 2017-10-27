class ZernikesController < ApplicationController
    
    def zernike_params
        params.require(:zernike).permit(:file)
    end
    
    def index
    end 
    
    def new
        @fields = Zernike.parameters
        flash[:notice] = "Zernike equation successfully computed!"
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

end