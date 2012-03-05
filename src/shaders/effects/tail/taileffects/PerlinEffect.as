package  shaders.effects.tail.taileffects
{
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 
	 */
	public class PerlinEffect extends EffectCreationStrategy 
	{
		private var chaos:BitmapData;
		public var dataChannel:Number = 21;
		public var fractal:Boolean = false;
		
		public function PerlinEffect() 
		{
			super();
			
		}
			
		override protected function initilize():void 
		{
			super.initilize();
			
			chaos = new BitmapData(150, 150, true, 0x00000000);
		}
		
		override public function render():void 
		{
			super.render();
			
			
		}
		
		override public function make():void 
		{
			super.make();
			

			output.lock();
			
			chaos.perlinNoise(50, 50, 20, Math.random() * 100, true, fractal,  dataChannel | BitmapDataChannel.ALPHA - 2 , false)
			
			var p:Point = new Point();
			var r:Rectangle = new Rectangle();
			
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					p.x = i * 150;
					p.y = j * 150;
					
					output.copyPixels(chaos, output.rect, p, chaos, new Point);
					//output.merge(chaos, chaos.rect, p, 50, 1, 1, 10);
				}
			}
			
			output.unlock();
			
		}
		
	}

}