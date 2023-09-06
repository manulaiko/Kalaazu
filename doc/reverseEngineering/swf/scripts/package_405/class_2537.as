package package_405
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.MovieClipLayer;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import package_406.class_2534;
   import package_76.class_2321;
   
   public class class_2537 extends DefaultItemDataAssigner
   {
       
      
      private const TAB_COLOR_INACTIVE:int = 7320267;
      
      private const TAB_COLOR_ACTIVE:int = 15327936;
      
      protected var var_4460:Label;
      
      protected var var_4961:Label;
      
      protected var var_2702:Coreponent;
      
      protected var var_3794:MovieClip;
      
      public function class_2537()
      {
         super();
         _mouseEnabled = true;
         _mouseChildrenEnabled = true;
         this.addEventListener(Event.ADDED_TO_STAGE,this.method_396);
         initialize();
      }
      
      override public function assignChildren() : void
      {
         super.assignChildren();
         this.var_4460 = getChildByName("actionLabel") as Label;
         this.var_4961 = getChildByName("boundKey") as Label;
         this.var_2702 = getChildByName("boundKeyBg") as Coreponent;
         this.var_3794 = (this.var_2702.skin.getSkinLayer("normal") as MovieClipLayer).getChildAt(0) as MovieClip;
         this.var_3794.gotoAndStop(1);
         this.var_2702.addChild(this.var_3794);
         this.var_2702.addEventListener(MouseEvent.MOUSE_OVER,this.method_1077);
         this.var_2702.addEventListener(MouseEvent.MOUSE_OUT,this.method_5927);
         this.var_2702.addEventListener(MouseEvent.CLICK,this.method_2404);
      }
      
      private function method_396(param1:Event) : void
      {
         this.parent.addEventListener(class_2531.NOW_LISTENING_FOR_KEYBINDING,this.method_3818);
         this.parent.parent.addEventListener(class_2531.TAB_SWITCHED,this.method_3818);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.method_396);
      }
      
      private function method_1077(param1:MouseEvent) : void
      {
         if(this.var_3794.currentFrame == 1)
         {
            this.var_3794.gotoAndStop(2);
         }
      }
      
      private function method_5927(param1:MouseEvent) : void
      {
         if(this.var_3794.currentFrame == 2)
         {
            this.var_3794.gotoAndStop(1);
         }
      }
      
      private function method_2404(param1:MouseEvent) : void
      {
         this.var_3794.gotoAndStop(3);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_1685);
         this.dispatchEvent(new class_2531(class_2531.NOW_LISTENING_FOR_KEYBINDING,this.method_1315));
      }
      
      private function method_1685(param1:KeyboardEvent) : void
      {
         this.method_1315.method_4918 = param1.keyCode;
         this.var_4961.text = class_2321.method_1944(this.method_1315.method_4918);
         this.var_3794.gotoAndStop(1);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_1685);
         this.dispatchEvent(new class_2531(class_2531.LISTED_KEYBINDING_CHANGED,this.method_1315));
      }
      
      public function method_3818(param1:class_2531) : void
      {
         if(param1.target != this)
         {
            this.var_3794.gotoAndStop(1);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.method_1685);
         }
      }
      
      private function get method_1315() : class_2534
      {
         return data as class_2534;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1 as class_2534;
         if(this.method_1315)
         {
            this.var_4460.text = class_88.getItem(this.method_1315.method_1361);
            if(this.method_1315.method_5655 != class_2534.const_3304)
            {
               this.var_4460.text += " " + this.method_1315.method_5655;
            }
            this.var_4961.text = class_2321.method_1944(this.method_1315.method_4918);
         }
      }
   }
}
