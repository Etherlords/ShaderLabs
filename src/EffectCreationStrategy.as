package  
{
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author 
	 */
	public class EffectCreationStrategy 
	{
		protected var output:BitmapData;
		
		public function EffectCreationStrategy() 
		{
			initilize();
		}
		
		public function setOutput(output:BitmapData):void
		{
			this.output = output;
		}
		
		protected function initilize():void 
		{
			
		}
		
		public function make():void
		{
			
		}
		
		public function render():void
		{
			
		}
		
	}

}