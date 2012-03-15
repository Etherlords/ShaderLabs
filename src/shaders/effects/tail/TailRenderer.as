package  shaders.effects.tail
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.utils.*;
	import shaders.*;
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
		private var tailTarget:TailTargetObject;
		
		public function TailRenderer(tailSource:BitmapData, instance:DisplayObjectContainer, tailTarget:TailTargetObject) 
		{
			this.tailTarget = tailTarget;
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
			eraseShader.data.alphaFactor.value = [0.05];
		
			
		
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
			var newPoint:Point = new Point(tailTarget.x, tailTarget.y);
			
			var distance:Number = Point.distance(lastPoint, newPoint);
			
			
			var numberOfSteps:int = 1 + distance / 1;
			
			var deltax:Number = (newPoint.x - lastPoint.x) / numberOfSteps;
			var deltay:Number = (newPoint.y - lastPoint.y) / numberOfSteps;
			
			var transform:ColorTransform = new ColorTransform();
			
			//transform.alphaOffset = -255;
			transform.alphaMultiplier = 0.1;
			var alphaStep:Number = 1 / numberOfSteps;
			

			
		
			//eraseShader.data.alphaFactor.value = [1 / (numberOfSteps - 1)];
			
			for (var i:int = 0; i < numberOfSteps; i++)
			{
				tailInstance.x += deltax;
				tailInstance.y += deltay;
				
				m = new Matrix();
				
				m.tx = tailInstance.x + ( -5 + Math.random() * 10);
				m.ty = tailInstance.y + ( -5 + Math.random() * 10);
				
				
				p = new Point(m.tx, m.ty);
				
				
				
			
				
				//maskInstance.bitmapData.draw(tailInstance, m);
				maskInstance.bitmapData.copyPixels(patter, patter.rect, p, patter, new Point(10), true);
				
					
				//b = maskInstance.bitmapData.getPixels(rec);
				//b.position = 0;
				
				//bmp = new BitmapData(rec.width, rec.height, true);
				//bmp.setPixels(bmp.rect, b);
				
				
				
				//eraseShader.data.src.input = maskInstance.bitmapData;
				
				
				
				//b = bmp.getPixels(bmp.rect);
				//b.position = 0;
				
				//maskInstance.bitmapData.setPixels(rec, b);
				
				
			
			
			}
			//shaderJob.cancel();
			//maskInstance.bitmapData.merge(bb, bb.rect, new Point, 10, 10, 10, 10);
			shaderJob = new ShaderJob(eraseShader, maskInstance.bitmapData);
			shaderJob.start(false);
			
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