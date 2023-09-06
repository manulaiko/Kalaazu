package package_26
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_18;
   
   public class class_79
   {
      
      private static const _instance:class_79 = new class_79();
      
      private static const name_17:int = 300;
      
      private static const const_460:int = 500;
      
      private static const const_2252:int = 100;
       
      
      private var var_2977:TextField;
      
      private var _container:DisplayObjectContainer;
      
      private var var_2843:int;
      
      public function class_79()
      {
         super();
      }
      
      public static function getInstance() : class_79
      {
         return _instance;
      }
      
      public function init(param1:DisplayObjectContainer) : void
      {
         this._container = param1;
      }
      
      public function show(param1:String, param2:Boolean = false, param3:Number = 500) : void
      {
         if(this.var_2977 == null)
         {
            this.method_296();
         }
         if(param2)
         {
            this.var_2977.htmlText = param1;
         }
         else
         {
            this.var_2977.text = param1;
         }
         clearTimeout(this.var_2843);
         if(param3 <= 0)
         {
            this.showTooltip();
         }
         else
         {
            this.var_2843 = setTimeout(this.showTooltip,param3);
         }
      }
      
      public function hide(param1:Number = 100) : void
      {
         clearTimeout(this.var_2843);
         if(Boolean(this.var_2977) && Boolean(this.var_2977.parent))
         {
            if(param1 <= 0)
            {
               this.hideTooltip();
            }
            else
            {
               this.var_2843 = setTimeout(this.hideTooltip,param1);
            }
         }
      }
      
      private function showTooltip(param1:TimerEvent = null) : void
      {
         this.method_2923();
         this.var_2977.x = this._container.mouseX + 10;
         this.var_2977.y = Number(this._container.mouseY) - Number(this.var_2977.height) - 10;
         var _loc2_:Rectangle = new Rectangle(0,0,this._container.stage.stageWidth,this._container.stage.stageHeight);
         if(this.var_2977.x + this.var_2977.width > _loc2_.width)
         {
            this.var_2977.x = Number(this._container.mouseX) - Number(this.var_2977.width) - 10;
         }
         if(Number(this.var_2977.y) - Number(this.var_2977.height) < 0)
         {
            this.var_2977.y = this._container.mouseY + 10;
         }
         this._container.addChild(this.var_2977);
      }
      
      private function hideTooltip(param1:TimerEvent = null) : void
      {
         clearTimeout(this.var_2843);
         this._container.removeChild(this.var_2977);
      }
      
      private function method_296() : DisplayObject
      {
         this.var_2977 = new TextField();
         this.var_2977.embedFonts = false;
         if(false)
         {
            this.var_2977.defaultTextFormat = class_18.const_1832;
         }
         else
         {
            this.var_2977.defaultTextFormat = class_18.const_3012;
         }
         this.var_2977.autoSize = TextFieldAutoSize.LEFT;
         this.var_2977.textColor = 13421772;
         this.var_2977.backgroundColor = 0;
         this.var_2977.background = true;
         this.var_2977.border = true;
         this.var_2977.borderColor = 1873341;
         this.var_2977.antiAliasType = AntiAliasType.ADVANCED;
         this.var_2977.selectable = false;
         this.var_2977.mouseEnabled = false;
         return this.var_2977;
      }
      
      private function method_2923() : void
      {
         this.var_2977.wordWrap = false;
         this.var_2977.multiline = false;
         this.var_2977.autoSize = TextFieldAutoSize.LEFT;
         if(this.var_2977.width > name_17)
         {
            this.var_2977.width = name_17;
            this.var_2977.wordWrap = true;
            this.var_2977.multiline = true;
         }
      }
   }
}
