class ZernikesController < ApplicationController
    
    def zernike_params
        #params.require(:zernike).permit(:z1, :z2, :z3, :z4, :z5, :z6, :z7, :z65)
    end
    
    def index
    end 
    
    def new
        @fields = Zernike.parameters
    end
    
    
    def create
        @zernike = Zernike.create!(zernike_params)
        flash[:notice] = "Zernike equation successfully computed!"
        redirect_to get_image_path
    end 
    
    def show
    end
    
    # def upload
       
    # end

end