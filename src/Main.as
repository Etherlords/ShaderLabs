package 
{
	import com.sociodox.theminer.TheMiner;
	import fl.controls.ComboBox;
	import fl.data.DataProvider;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var tailSource:TailSource;
		private var combo:ComboBox;
		private var lable:TextField;
		private var reactor:PerlinEffect;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			reactor = new PerlinEffect();
			
			tailSource = new TailSource(reactor, 800, 624);
			
			var sourcePreview:Bitmap = new Bitmap(tailSource.source);
			
			var effectInstance:Sprite = new Sprite();
			
			
			var tailRenderer:TailRenderer = new TailRenderer(tailSource.source, effectInstance);
			
			addChild(sourcePreview);
			addChild(effectInstance);
			effectInstance.x = 500;
			
			
			
			combo = new ComboBox();
			addChild(combo);
			combo.y = 510;
			
			combo.addEventListener(Event.RENDER, init2);
			
			combo.dataProvider = new DataProvider([ { label:true, data:true }, { label:false, data:false } ]);
			
			lable = new TextField();
			lable.type = TextFieldType.INPUT;
			lable.border = true;
			lable.width = 50;
			lable.height = 25;
			lable.y = combo.y + combo.height + 5;
			
			addChild(lable);
			lable.text = '1';
			
			addChild(new TheMiner());
			
			
		}
		
		private function init2(e:*):void
		{
			combo.removeEventListener(Event.RENDER, init);
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void 
		{
			reactor.render();
			reactor.fractal = combo.getItemAt(combo.selectedIndex).data
			reactor.dataChannel = parseInt(lable.text) || 1;
			
		}
		
	}
	
}