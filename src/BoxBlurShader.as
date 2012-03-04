package  
{
	import flash.display.Shader;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author 
	 */
	public class BoxBlurShader extends Shader 
	{
		[Embed(source = "../lib/simpleBoxBlur.pbj", mimeType = "application/octet-stream")]
		private var shaderData:Class;
		
		public function BoxBlurShader() 
		{
			
			super(new shaderData());
			
		}
		
	}

}