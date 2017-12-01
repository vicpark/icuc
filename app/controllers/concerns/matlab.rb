class Matlab < ZernikesController
    def self.compute(zernikes, parameters, options)
        while parameters.length < 7
            parameters << 0
        end
        if zernikes.length != 65 or parameters.length != 7 or options.length != 6
            system("result.txt << 'internal error, wrong number of parameters given'")
            return nil
        end
        arg = " "
        zernikes.each do |z|
            arg += " " + z.to_s
        end
        # parameters
        parameters.each do |p|
            arg += " " + p.to_s
        end
        # options
        options.each do |o|
            arg += " " + o.to_s
        end
        resulting_images = run_matlab(arg)
        return resulting_images
    end
    
    def self.run_matlab(arguments)
        name = "computed" + (0...8).map { (65 + rand(26)).chr }.join
        arguments = ' \'' + name + '\' ' + arguments
        result_file = "result.txt"
        run_command = "java -classpath :'/usr/local/MATLAB/MATLAB_Runtime/v901/toolbox/javabuilder/jar/javabuilder.jar':./WaveReq.jar wave"
        path = "export LD_LIBRARY_PATH='/usr/local/MATLAB/MATLAB_Runtime/v901/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/opengl/lib/glnxa64'"
        make_log, s = Open3.capture2e(path + "\n" + run_command + arguments + " > " + result_file)
        system("rm app/assets/images/computed*")
	    system("mv "+ name + "* app/assets/images")  
	    return read_result_file(result_file, name)
    end
    
    # returns list of files created.
    def self.read_result_file(file, name)
        files = []
        f = File.open(file, "r")
        f.each_line do |line|
	        if line =~ /^#{name}/
                files += [line[0,line.length-1] + ".jpg"]
	        end
        end
        return files
    end
    
    # def self.mock_compute
    #     system("ls app/assets/images/computed* > app/assets/list.txt")
    #     files = []
    #     f = File.open("app/assets/list.txt", "r")
    #     f.each_line do |line|
    #         line =~ /(compute.*jpg)/
    #         if $1 != nil
    #             files << $1
    #         end
    #     end
    #     return files
    # end
end
