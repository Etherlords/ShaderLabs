package extendsReality 
{
	import core.locators.ServicesLocator;
	import core.view.gameobject.GameObject;
	import shaders.effects.tail.TailTargetObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class GameObjectTailTracker extends TailTargetObject 
	{
		private var object:GameObject;
		
		public function GameObjectTailTracker(object:GameObject) 
		{
			super();
			this.object = object;
			
		}
		
		override public function get y():Number 
		{
			trace(object.body.y - ServicesLocator.cameraService.camera.target.y)
			return   object.body.y
		}
		
		override public function set y(value:Number):void 
		{
			super.y = value;
		}
		
		override public function get x():Number 
		{
			if(object.direction.isRightDirection)
				return object.body.x
			else
				// (object.direction.isLeftDiretion)
					return object.body.x + object.body.width - 22;
					
			return 0;
		}
		
		override public function set x(value:Number):void 
		{
			super.x = value;
		}
		
	}

}