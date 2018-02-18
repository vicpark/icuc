import com.mathworks.toolbox.javabuilder.*;
import WaveReq.*;

class wave
{
   public static void main(String[] args)
   {
      Object[] result = null;
      wavreq wave = null;
      if (args.length != (65 + 14))
      {
        System.out.println("Error: you provided " + args.length + " arguments, must be 1+65+13");
        return;
      }
  
      try
      {
        wave = new wavreq();
        String fileid = args[0];
        // ZERNIKE COEFFICIENTS
        float zernikes[] = new float[65];
        for (int i = 0; i < 65; i++)
            zernikes[i] = Float.parseFloat(args[i+1]); 
        MWNumericArray coeffs = new MWNumericArray(zernikes, MWClassID.DOUBLE);
        
        // other parameters
        float pupilfit = Float.parseFloat(args[66]);
        float pupilcalc = Float.parseFloat(args[67]);
        float defocus = Float.parseFloat(args[68]);
        float wavelength = Float.parseFloat(args[69]);
        float pixels = Float.parseFloat(args[70]);
        float pupilfieldsize = Float.parseFloat(args[71]);
        float lettersize = Float.parseFloat(args[72]); 
        
        // testing defocus range
        float defocusRange[] = new float[3];
        defocusRange[0] = Float.parseFloat("1");
        defocusRange[1] = Float.parseFloat("2");
        defocusRange[2] = 5.0;
        MWNumericArray defocusRanges = new MWNumericArray(defocusRange, MWClassID.DOUBLE);
        
        // choice of graphs
        int WF = Integer.parseInt(args[73]);
        int PSF = Integer.parseInt(args[74]);
        int MTF = Integer.parseInt(args[75]);
        int PTF = Integer.parseInt(args[76]);
        int MTFL = Integer.parseInt(args[77]);
        int CONV = Integer.parseInt(args[78]);
        
        // result fits
        result = wave.WaveReq(2, fileid, coeffs, pupilfit, pupilcalc, defocusRanges, wavelength, pixels, pupilfieldsize, lettersize, WF, PSF, MTF, PTF, MTFL, CONV);
        System.out.println(result);
      }
      catch (Exception e)
      {
        System.out.println("Exception: " + e.toString());
      }
      finally
      {
         MWArray.disposeArray(result);
         wave.dispose();
      }
   }
}
