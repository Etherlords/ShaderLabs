package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shader;
	import flash.display.ShaderJob;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author 
	 */
	public class TailRenderer 
	{
		private var tailSource:BitmapData;
		
		private var tailSourceInstance:Bitmap;
		private var maskInstance:Bitmap
		private var tailInstance:Sprite;
		private var instance:DisplayObjectContainer;
		
		private var eraseShader:Shader;
		private var shaderJob:ShaderJob;
		
		private var patter:BitmapData = new TailPattern1();
		
		public function TailRenderer(tailSource:BitmapData, instance:DisplayObjectContainer) 
		{
			this.instance = instance;
			this.tailSource = tailSource;
			
			initilize();
		}
		
		private function initilize():void 
		{
			tailInstance = new TailPattern();
			
			tailInstance.visible = false;
			tailSourceInstance = new Bitmap(tailSource);
			maskInstance = new Bitmap(new BitmapData(tailSource.width, tailSource.height, true, 0x0));
			
			instance.addChild(tailSourceInstance);
			instance.addChild(maskInstance);
			instance.addChild(tailInstance);
		
			initMask();
			
			eraseShader = new AlphaShader();
			eraseShader.data.src.input = maskInstance.bitmapData;
			eraseShader.data.alphaFactor.value = [0.1];
		
			
		
			shaderJob = new ShaderJob(eraseShader, maskInstance.bitmapData);
			
			var t:Timer = new Timer(30, 0);
			t.addEventListener(TimerEvent.TIMER, render);
			t.start();
			
			
		}
		
		private function render(e:TimerEvent):void 
		{
			var p:Point;
			
			
			//blurshader.data.src.width = maskInstance.bitmapData.width;
			//blurshader.data.src.height = maskInstance.bitmapData.height;
			//blurshader.data.src.input = maskInstance.bitmapData;
				
			
			maskInstance.bitmapData.lock();
			
			var m:Matrix;
			var lastPoint:Point = new Point(tailInstance.x, tailInstance.y);
			var newPoint:Point = new Point(instance.mouseX, instance.mouseY);
			
			var distance:Number = Point.distance(lastPoint, newPoint);
			
			
			var numberOfSteps:int = 1 + distance / 1;
			
			var deltax:Number = (newPoint.x - lastPoint.x) / numberOfSteps;
			var deltay:Number = (newPoint.y - lastPoint.y) / numberOfSteps;
			
			var transform:ColorTransform = new ColorTransform();
			
			//transform.alphaOffset = -255;
			transform.alphaMultiplier = 0.1;
			var alphaStep:Number = 1 / numberOfSteps;
			
			//eraseShader.data.alphaFactor.value = [0.01];
			var bmp:BitmapData;
			var rec:Rectangle = new Rectangle();
			var b:ByteArray;
			
			//eraseShader.data.alphaFactor.value = [1 / (numberOfSteps - 1)];
			
			for (var i:int = 0; i < numberOfSteps; i++)
			{
				tailInstance.x += deltax;
				tailInstance.y += deltay;
				
				m = new Matrix();
				m.tx = tailInstance.x;
				m.ty = tailInstance.y;
				
				p = new Point(m.tx, m.ty);
				
				rec.x = p.x;
				rec.y = p.y;
				rec.width = tailInstance.width;
				rec.height = tailInstance.height;
				
				transform.alphaMultiplier += alphaStep;
				
				//maskInstance.bitmapData.draw(tailInstance, m);
				maskInstance.bitmapData.copyPixels(patter, patter.rect, p, patter, new Point, true);
					
				//b = maskInstance.bitmapData.getPixels(rec);
				//b.position = 0;
				
				//bmp = new BitmapData(rec.width, rec.height, true);
				//bmp.setPixels(bmp.rect, b);
				
				
				
				//eraseShader.data.src.input = maskInstance.bitmapData;
				
				
				
				//b = bmp.getPixels(bmp.rect);
				//b.position = 0;
				
				//maskInstance.bitmapData.setPixels(rec, b);
				
				
			
			
			}
			
			shaderJob = new ShaderJob(eraseShader, maskInstance.bitmapData);
			shaderJob.start(true);
			
			maskInstance.bitmapData.unlock();
		
			
			//tailInstance.x = instance.mouseX - 5 + Math.random() * 10;
			//tailInstance.y = instance.mouseY - 5 + Math.random() * 10;
			
		
			
			//maskInstance.bitmapData.applyFilter(maskInstance.bitmapData, maskInstance.bitmapData.rect, new Point, new DisplacementMapFilter(bm, new Point(), BitmapDataChannel.RED, BitmapDataChannel.ALPHA, 5,5 , DisplacementMapFilterMode.IGNORE));
			
			

		}
		
		private function initMask():void 
		{
			tailSourceInstance.cacheAsBitmap = maskInstance.cacheAsBitmap = true;
			
			tailSourceInstance.mask = maskInstance;
		}
		
	}

}