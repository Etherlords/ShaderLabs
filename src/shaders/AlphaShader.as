package shaders
{
	import flash.display.Shader;
	
	/**
	 * ...
	 * @author 
	 */
	public class AlphaShader extends Shader 
	{
		[Embed(source="../../lib/shaders/alpha/alphaShader.pbj", mimeType="application/octet-stream")]
		private var shaderData:Class;
		
		
		public function AlphaShader() 
		{
			super(new shaderData());
		}
		
		/**
		 * should be Vector.<Number> BitmapData or ByteArray
		 */
		public function set shaderSource(value:*):void 
		{
			data.src.input = value
		}
		
		public function set width(value:Number):void 
		{
			data.src.width = value;
		}
		
		public function set height(value:Number):void 
		{
			data.src.height = value;
		}
		
		public function get alphaFactor():Number 
		{
			return data.alphaFactor.value[0];
		}
		
		/**
		 * Float in rage -1.0 to +1.0
		 */
		public function set alphaFactor(value:Number):void 
		{
			data.alphaFactor.value = [value];
		}
		
	}

}