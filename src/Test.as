package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author 
	 */
	public class Test extends Sprite 
	{
		
		public function Test() 
		{
			super();
			
			initilize();
		}
		
		private function initilize():void 
		{
			var bmp:BitmapData = new BitmapData(100, 100, true, 0xFFFF0000);
			
			var b:ByteArray = bmp.getPixels(bmp.rect);
			b.position = 0;
			
			var bmp2:BitmapData = bmp.clone();
			bmp2.setPixels(bmp.rect, b);
			
			addChild(new Bitmap(bmp2));
		}
		
	}

}