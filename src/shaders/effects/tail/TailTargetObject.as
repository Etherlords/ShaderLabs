package shaders.effects.tail 
{
	/**
	 * ...
	 * @author 
	 */
	public class TailTargetObject 
	{
		private var _x:Number = 0;
		private var _y:Number = 0;
	
		public function TailTargetObject() 
		{
			
		}
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
	}

}