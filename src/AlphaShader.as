package  
{
	import flash.display.Shader;
	
	/**
	 * ...
	 * @author 
	 */
	public class AlphaShader extends Shader 
	{
		[Embed(source = "../lib/alphaShader.pbj", mimeType = "application/octet-stream")]
		private var shaderData:Class;
		
		public function AlphaShader() 
		{
			super(new shaderData());
		}
		
	}

}