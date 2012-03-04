package shaders 
{
	import flash.display.Shader;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CopyPixelShader extends Shader 
	{
		[Embed(source="../../lib/shaders/copyPixel/CopyPixelShader.pbj", mimeType="application/octet-stream")]
		private var shaderData:Class;
		private var p:Point = new Point();
		
		public function CopyPixelShader() 
		{
			super(new shaderData());
		}
		
		/**
		 * should be Vector.<Number> BitmapData or ByteArray
		 */
		public function set copyFrom(value:*):void 
		{
			data.copyFrom.input = value;
		}
		
		/**
		 * should be Vector.<Number> BitmapData or ByteArray
		 */
		public function set copyTo(value:*):void 
		{
			data.copyTo.input = value;
		}
		
		public function set rect(rect:Rectangle):void 
		{
			data.rect.value = [rect.x, rect.y, rect.width, rect.height];
		}
		
		public function get point():Point
		{
			return p;
		}
		
		public function set point(p:Point):void 
		{
			this.p = p;
			data.point.value = [p.x, p.y];
		}
		
	}

}