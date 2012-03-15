package experiments
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.ShaderJob;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import shaders.EraseShader;
	
	/**
	 * ...
	 * @author 
	 */
	public class Test extends Sprite 
	{
		
		[Embed(source="../../lib/ball.png")]
		private var ballSource:Class;
		
		private var bitmapView2:Bitmap;
		private var bmp1:BitmapData;
		private var bmp2:BitmapData;
		
		public function Test():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var ball:BitmapData = new ballSource().bitmapData;
			
			bmp1 = ball.clone()//= new BitmapData(ball.width, ball.height, true, 0xFFFF0000);
			//var buff:BitmapData = new BitmapData(ball.width, ball.height, true, 0xFFFF0000);
			bmp2 = ball.clone();
			bmp3 = ball.clone();
			
			//bmp1.copyChannel(bmp2, bmp2.rect, new Point, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
			
			//bmp1.threshold(bmp1, bmp1.rect, new Point, "==", 0xff000000, 0x0, 0xFFFF0000, true);

			
			//bmp1.copyChannel(buff, buff.rect, new Point, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
			//bmp1.copyChannel(bmp1, bmp1.rect, new Point, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
			
			var bitmapView:Bitmap = new Bitmap(bmp1);
			var bitmapView3:Bitmap = new Bitmap(bmp3);
			bitmapView2 = new Bitmap(bmp2);
			addChild(bitmapView2);
			addChild(bitmapView);
			addChild(bitmapView3);
			
			bitmapView3.x = 200;
			bitmapView3.y = 200;
			
			shader = new EraseShader();
			
			
			stage.addEventListener(MouseEvent.CLICK, enterFrame);
			stage.addEventListener(Event.ENTER_FRAME, track);
			
		}
		
		private function track(e:Event):void 
		{
			bitmapView2.x = mouseX;
			bitmapView2.y = mouseY;
			enterFrame();
		}
		
		private var alphaPattern:BitmapData = new BitmapData(200, 200, true, 0x0);
		private var shader:EraseShader;
		private var bmp3:BitmapData;
		
		private function enterFrame(e:* = null):void
		{
			bitmapView2.x = mouseX;
			bitmapView2.y = mouseY;
			
			var isCollide:Boolean = bmp1.hitTest(new Point(0, 0), 0x0, bmp2, new Point(mouseX, mouseY));
			
			if (isCollide)
			{
				shader.data.copyFrom.input = bmp1;
				shader.data.copyTo.input = bmp2;
				shader.data.point.value = [mouseX, mouseY];
				shader.data.alphaFactor.value = [0.5];
				var job:ShaderJob = new ShaderJob(shader, bmp3);
				job.start(false);
				//bmp2.copyChannel(bmp1, new Rectangle(0, 0, bmp1.width - mouseX, bmp1.height - mouseY), new Point, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
				
				//bmp2.merge(bmp1, new Rectangle(0, 0, bmp1.width - mouseX, bmp1.height - mouseY), new Point, 0,0,0, 100);
			}
			//else
				//bmp2 = bmp1.clone();
		}
		
	}
	
}