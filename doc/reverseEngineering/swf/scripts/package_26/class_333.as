package package_26
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   import net.bigpoint.darkorbit.class_18;
   
   public class class_333
   {
      
      private static const name_17:int = 300;
      
      private static const const_460:int = 500;
      
      private static const const_2252:int = 100;
      
      private static var name_9:TextField;
       
      
      private var name_22:InteractiveObject;
      
      private var text:String;
      
      private var t:Timer;
      
      private var var_621:Boolean;
      
      private var bounds:Rectangle;
      
      public var showImmediately:Boolean = false;
      
      private var htmlText:Boolean;
      
      public function class_333(param1:InteractiveObject, param2:String, param3:Boolean = false)
      {
         super();
         this.name_22 = param1;
         this.text = param2;
         this.htmlText = param3;
      }
      
      public function method_1455(param1:String) : void
      {
         this.text = param1;
         if(Boolean(this.var_621) && name_9 != null)
         {
            if(this.htmlText)
            {
               name_9.htmlText = param1;
            }
            else
            {
               name_9.text = param1;
            }
         }
      }
      
      private function method_273(param1:MouseEvent) : void
      {
         if(this.showImmediately)
         {
            this.showTooltip();
         }
         else
         {
            this.t = new Timer(const_460,1);
            this.t.addEventListener(TimerEvent.TIMER_COMPLETE,this.showTooltip);
            this.t.start();
         }
      }
      
      private function method_3452(param1:MouseEvent = null) : void
      {
         if(this.t != null)
         {
            this.t.removeEventListener(TimerEvent.TIMER_COMPLETE,this.showTooltip);
            this.t.stop();
            this.t = null;
         }
         if(this.var_621)
         {
            this.t = new Timer(const_2252,1);
            this.t.addEventListener(TimerEvent.TIMER_COMPLETE,this.hideTooltip);
            this.t.start();
         }
      }
      
      public function addEventListeners() : void
      {
         this.name_22.addEventListener(MouseEvent.ROLL_OVER,this.method_273);
         this.name_22.addEventListener(MouseEvent.ROLL_OUT,this.method_3452);
         this.name_22.addEventListener(MouseEvent.MOUSE_DOWN,this.method_3452);
      }
      
      private function removeEventListeners() : void
      {
         this.name_22.removeEventListener(MouseEvent.ROLL_OVER,this.method_273);
         this.name_22.removeEventListener(MouseEvent.ROLL_OUT,this.method_3452);
         this.name_22.removeEventListener(MouseEvent.MOUSE_DOWN,this.method_3452);
      }
      
      public function method_2670(param1:Rectangle) : void
      {
         this.bounds = param1;
      }
      
      public function showTooltip(param1:TimerEvent = null) : void
      {
         var event:TimerEvent = param1;
         if(name_9 == null)
         {
            this.method_296();
         }
         if(this.bounds == null || this.name_22 == null)
         {
            return;
         }
         if(this.htmlText)
         {
            name_9.htmlText = this.text;
         }
         else
         {
            name_9.text = this.text;
         }
         this.method_2923();
         try
         {
            name_9.x = this.name_22.stage.mouseX + 10;
            name_9.y = Number(this.name_22.stage.mouseY) - 0 - 10;
            if(NaN > this.bounds.width)
            {
               name_9.x = Number(this.name_22.stage.mouseX) - 0 - 10;
            }
            if(0 - 0 < 0)
            {
               name_9.y = this.name_22.stage.mouseY + 10;
            }
            this.name_22.stage.addChild(name_9);
         }
         catch(e:Error)
         {
         }
         this.var_621 = true;
      }
      
      public function hideTooltip(param1:TimerEvent = null) : void
      {
         if(this.t != null)
         {
            this.t.stop();
            this.t.removeEventListener(TimerEvent.TIMER_COMPLETE,this.hideTooltip);
            this.t.removeEventListener(TimerEvent.TIMER_COMPLETE,this.showTooltip);
            this.t = null;
         }
         try
         {
            this.name_22.stage.removeChild(name_9);
         }
         catch(e:Error)
         {
         }
         this.var_621 = false;
      }
      
      public function method_6022() : void
      {
         try
         {
            this.name_22.stage.removeChild(name_9);
         }
         catch(e:Error)
         {
         }
         this.var_621 = false;
      }
      
      public function getTargetObject() : InteractiveObject
      {
         return this.name_22;
      }
      
      function suicide() : void
      {
         try
         {
            this.removeEventListeners();
            this.hideTooltip(null);
         }
         catch(e:Error)
         {
         }
      }
      
      private function method_296() : DisplayObject
      {
         name_9 = new TextField();
         name_9.embedFonts = false;
         if(false)
         {
            name_9.defaultTextFormat = class_18.const_1832;
         }
         else
         {
            name_9.defaultTextFormat = class_18.const_3012;
         }
         name_9.autoSize = TextFieldAutoSize.LEFT;
         name_9.textColor = 13421772;
         name_9.backgroundColor = 0;
         name_9.background = true;
         name_9.border = true;
         name_9.borderColor = 1873341;
         name_9.antiAliasType = AntiAliasType.ADVANCED;
         name_9.selectable = false;
         if(this.htmlText)
         {
            name_9.htmlText = this.text;
         }
         else
         {
            name_9.text = this.text;
         }
         name_9.mouseEnabled = false;
         return name_9;
      }
      
      private function method_2923() : void
      {
         name_9.wordWrap = false;
         name_9.multiline = false;
         name_9.autoSize = TextFieldAutoSize.LEFT;
         if(name_9.width > name_17)
         {
            name_9.width = name_17;
            name_9.wordWrap = true;
            name_9.multiline = true;
         }
      }
      
      public function getText() : String
      {
         return name_9.text;
      }
   }
}
