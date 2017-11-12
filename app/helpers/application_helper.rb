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
        run = "java -classpath .:'/usr/local/MATLAB/MATLAB_Runtime/v901/toolbox/javabuilder/jar/javabuilder.jar':./WaveReq.jar wave "
        system(run + arg + "> result.txt")
        return 
    end
end
