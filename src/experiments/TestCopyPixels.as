package experiments 
{
	import com.sociodox.theminer.TheMiner;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.BlendMode;
	import flash.display.ShaderJob;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import shaders.CopyPixelShader;
	
	/**
	 * ...
	 * @author ...
	 */

	
	public class TestCopyPixels extends Sprite 
	{
			[Embed(source = "../../lib/Lighthouse.jpg")]
	private var bg:Class;
		private var bmp1:BitmapData;
		private var copyPixels:CopyPixelShader;
		private var bmp2:BitmapData;
		private var bmp3:BitmapData;
		private var shader:ShaderJob;
		
		public function TestCopyPixels() 
		{
			super();
			var t:Timer = new Timer(100, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, initilize);
			t.start();
			
			addChild(new bg());
		}
		
		private function initilize(e:TimerEvent):void 
		{
			copyPixels = new CopyPixelShader();
			//copyPixels.rect = new Rectangle(0, 0, 50, 50);
			

			//return;
			
			
			
			
			bmp1 = new BitmapData(500, 500, true, 0x0);
			bmp2 = new BitmapData(500, 500, true, 0x33000000);
			bmp3 = new BitmapData(500, 500, true, 0x0);
			
			bmp2.perlinNoise(500, 500, 20, 1, true, true, BitmapDataChannel.ALPHA | BitmapDataChannel.RED);
			
			bmp1.fillRect(new Rectangle(100, 10, 50, 50), 0xFF000000);
			
			
			var bitmap:Bitmap = new Bitmap(bmp1);
			var bitmap2:Bitmap = new Bitmap(bmp2);
			var bitmap3:Bitmap = new Bitmap(bmp3);
			
			addChild(bitmap);
			addChild(bitmap2);
			addChild(bitmap3);
			
			bitmap2.x = 500;
			bitmap3.x = 500;
			bitmap3.y = 500;
			
			r = new Rectangle(0, 0, 150, 150);
			copyPixels.rect = r;
			copyPixels.copyTo = bmp1;
			copyPixels.copyFrom = bmp2;

			
			addChild(new TheMiner(true));
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, mC);
			
			
		
				
			trace('shader time: ' + shaderTime);
			trace('copyPixels time: ' + copyTimer);
		}
		
		private function mC(e:*):void 
		{
				
			for (var i:int = 0; i < 100; i++)
				startJob();
		}
		
		private var shaderTime:Number = 0;
		private var copyTimer:Number = 0;
		private var r:Rectangle;
		
		private function startJob(e:* = null):void 
		{
			var t:Number = getTimer();
			
			shader = new ShaderJob(copyPixels, bmp1, 1, 1);
			shader.start(true);
			shaderTime += getTimer() - t;
			
			t = getTimer();
			
			bmp3.copyPixels(bmp2, r, new Point);
			copyTimer += getTimer() - t;
		}
		
	}

}