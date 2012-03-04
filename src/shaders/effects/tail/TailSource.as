package  shaders.effects.tail
{
	import flash.display.BitmapData;
	import shaders.effects.tail.taileffects.EffectCreationStrategy;
	/**
	 * ...
	 * @author 
	 */
	public class TailSource 
	{
		private var _source:BitmapData;
		private var effectReactor:EffectCreationStrategy;
		private var sourceWidth:Number;
		private var sourceHeight:Number;

		public function TailSource(effectReactor:EffectCreationStrategy, sourceWidth:Number, sourceHeight:Number) 
		{
			this.sourceHeight = sourceHeight;
			this.sourceWidth = sourceWidth;
			this.effectReactor = effectReactor;
			
			initilize();
		}
		
		private function initilize():void 
		{
			_source = new BitmapData(sourceWidth, sourceHeight, true, 0x00000000);
			effectReactor.setOutput(_source);
			createEffect();
		}
		
		private function createEffect():void
		{
			effectReactor.make();
		}
		
		public function effectProgression():void
		{
			_source.lock();
			effectReactor.render();
		}
		
		public function get source():BitmapData 
		{
			return _source;
		}
		
		public function set source(value:BitmapData):void 
		{
			_source = value;
		}
		
	}

}