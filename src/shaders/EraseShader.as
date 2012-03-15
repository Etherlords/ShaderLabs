package shaders 
{
	import flash.display.Shader;
	
	/**
	 * ...
	 * @author 
	 */
	public class EraseShader extends Shader 
	{
		
		[Embed(source="../../lib/shaders/erase/EraseShader.pbj", mimeType="application/octet-stream")]
		private var shaderData:Class;
		
		
		public function EraseShader() 
		{
			super(new shaderData());
		}
		
	}

}