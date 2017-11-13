module ApplicationHelper
    require 'open3'
    def self.compute(zernikes, parameters, options)
        arg = " "
	name = "computed" + (0...8).map { (65 + rand(26)).chr }.join
        arg += '\'' + name + '\''
        arg += " "
        zernikes.each do |z|
            arg += " " + z.to_s
        end
        # parameters
        parameters.each do |p|
            arg += " " + p.to_s
        end
        arg += " 0 0"
        # options
        (0...6).each do |o|
            arg += " " + 1.to_s
        end
        file = "result.txt"
        run = "java -classpath :'/usr/local/MATLAB/MATLAB_Runtime/v901/toolbox/javabuilder/jar/javabuilder.jar':./WaveReq.jar wave"
        path = "export LD_LIBRARY_PATH='/usr/local/MATLAB/MATLAB_Runtime/v901/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/opengl/lib/glnxa64'"
        make_log, s = Open3.capture2e(path + "\n" + run + arg + " > " + file)
        system("rm app/assets/images/computed*")
	system("mv "+ name + "* app/assets/images")        
        return read(file, name)
    end
    
    
    def self.read(file, name)
        files = []
        f = File.open(file, "r")
        f.each_line do |line|
	    if line =~ /^#{name}/
                files += [line[0,line.length-1] + ".jpg"]
	    end
        end
        return files
    end
end
