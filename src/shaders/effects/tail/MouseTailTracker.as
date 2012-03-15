package shaders.effects.tail 
{
	import flash.display.DisplayObjectContainer;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author 
	 */
	public class MouseTailTracker extends TailTargetObject 
	{
		private var instance:DisplayObjectContainer;
		
		public function MouseTailTracker(instance:DisplayObjectContainer) 
		{
			super();
			this.instance = instance;
			
		}
		
		override public function get x():Number 
		{
			return instance.mouseX;
		}
		
		override public function set x(value:Number):void 
		{
			
		}
		
		override public function get y():Number 
		{
			return instance.mouseY;
		}
		
		override public function set y(value:Number):void 
		{
			
		}
		
	}

}