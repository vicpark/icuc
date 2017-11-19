class ZernikesController < ApplicationController
    include ApplicationHelper  
    def zernike_params
    #    params.require(:zernike).permit(:uploaded_file)
    end
    
    def main
        @zernikes = Zernike.zernikes
        @params = Zernike.getparams
        @options = Zernike.options
    end 
    
    def manual
        @zernikes = Zernike.zernikes
        @nicknames = Zernike.zNicknames
    end
    
    def set_all_zero
        zer = []
        (0..65).each do |i|
            zer << params[0.to_s]
        end
        Zernike.setZernikes(zer)
        @zernikes = Zernike.zernikes
        redirect_to enter_manually_path
    end
    
    def update
        zer = []
        (0..65).each do |i|
            zer << params[i.to_s]
        end
        #sets in database
        Zernike.setZernikes(zer)
        #get it from the database
        @zernikes = Zernike.zernikes
        redirect_to root_path
    end
    
    def random
        Zernike.random
        @zernikes = Zernike.zernikes
        redirect_to root_path 
    end
    
    def compute
	    zernikes = Zernike.zernikes[1,65]
        parameters = []
        (0..4).each do |i|
            parameters << params[i.to_s]
        end 
        
        options = []
        Zernike.options.each do |opt|
            if params[:options] != nil and params[:options][opt] == "1"
                options << 1
            else
                options << 0
            end
        end 
        
        #flash[:notice] = zernikes.to_s + parameters.to_s + options.to_s
        # to run matlab code. 
        @files = ApplicationHelper.compute(zernikes, parameters, options)
        
        #flash[:notice] =  zernikes.length.to_s + " " +parameters.length.to_s + " " + options.length.to_s 
        #system("ls app/assets/images/computed* > app/assets/list.txt")
        #iles = []
        #f = File.open("app/assets/list.txt", "r")
        
        #f.each_line do |line|
        #    line =~ /(compute.*jpg)/
        #    if $1 != nil
        #        files << $1
        #    end
        #end
        #@files = files
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
            extract_data = coefficients_extractor(jsonified_file) # puts coefficients in a hash, params[:coefficients]
            @zernike_coefficients = params[:coefficients]
            #p @zernike_coefficients.length
            if @zernike_coefficients.nil? or @zernike_coefficients.empty? or @zernike_coefficients.length != 66
                flash[:notice] = "Unable to upload file"
            else
                flash[:notice] = "File successfully uploaded!"
                coef = []
                @zernike_coefficients.each do |c|
                    coef << c[1].to_f
                end
                Zernike.setZernikes(coef)
            end
            redirect_to root_path 
        end
    end
    
    ###
    # app/controllers/documents_controller.rb
    def document_params
        params.require(:document).permit(:file)
    end
    
    private
    def coefficients_extractor(jsonified_file)
        important_lines = /^[^#].*/i  # extracts lines that matter, the ones with numbers
        no_space = /(.+)\s+(.+)\s+(.+)/ # separates the numbers
        coefficients = Hash.new(0)
        for key in jsonified_file
            line = important_lines.match(key)
            if line.nil?
                next
            else
                everything = no_space.match(line[0])
                if not everything.nil?
                    subscript = everything[1]
                    superscript = everything[2]
                    coefficient = everything[3]
                    # puts no_space.match(line[0])[1]
                    coefficients["Z#{subscript}_#{superscript}"] = coefficient
                end
            end
        end
        params[:coefficients] = coefficients
            # format printed loosely is : subscript superscript actual_coefficient
            
        # end
        
    end

end
