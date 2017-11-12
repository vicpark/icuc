module ApplicationHelper
    def self.compute(zernikes, parameters, options)
        arg = " "
        arg += (0...8).map { (65 + rand(26)).chr }.join
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
        set_env()
        file = "result.txt"
        run = "java -classpath app/matlab:'/usr/local/MATLAB/MATLAB_Runtime/v901/toolbox/javabuilder/jar/javabuilder.jar':./WaveReq.jar wave"
        system(run + arg + "> " + file)
        
        return run + arg + "> " + file #read(file)
    end
    
    
    def self.set_env()
        path = "export LD_LIBRARY_PATH='/usr/local/MATLAB/MATLAB_Runtime/v901/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v901/sys/opengl/lib/glnxa64'"
        system(path) 
    end
    
    def self.read(file)
        res = ""
        f = File.open(file, "r")
        f.each_line do |line|
            res += line
        end
        return res
    end
end
