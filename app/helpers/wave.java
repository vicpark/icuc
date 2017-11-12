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
	 float zernikes[] = new float[65];
	 for (int i = 0; i < 65; i++)
		zernikes[i] = Float.parseFloat(args[i+1]); 
	 MWNumericArray coeffs = new MWNumericArray(zernikes, MWClassID.DOUBLE);
//	 float[] coeffs = new float[65];
//	 for (int i = 0; i < 65; i++)
//		coeffs[i] = Float.parseFloat(args[i+1]);
	 int pupilfit = Integer.parseInt(args[66]);
	 int pupilcalc = Integer.parseInt(args[67]);
	 int defocus = Integer.parseInt(args[68]);
	 float wavelength = Float.parseFloat(args[69]);
	 int pixels = Integer.parseInt(args[70]);
	 int pupilfieldsize = Integer.parseInt(args[71]);
	 int lettersize = Integer.parseInt(args[72]);
	 
	 int WF = Integer.parseInt(args[73]);
	 int PSF = Integer.parseInt(args[74]);
	 int MTF = Integer.parseInt(args[75]);
	 int PTF = Integer.parseInt(args[76]);
	 int MTFL = Integer.parseInt(args[77]);
	 int CONV = Integer.parseInt(args[78]);
	 result = wave.WaveReq(2, fileid, coeffs, pupilfit, pupilcalc, defocus, wavelength, pixels, pupilfieldsize, lettersize, WF, PSF, MTF, PTF, MTFL, CONV);
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
