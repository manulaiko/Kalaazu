package package_30
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.gui.class_1044;
   import net.bigpoint.darkorbit.gui.class_58;
   import package_11.class_39;
   import package_26.class_333;
   import package_26.class_94;
   import package_9.ResourceManager;
   
   public class class_1553 extends class_91
   {
      
      public static const const_1094:int = 1;
      
      public static const const_416:int = 5;
      
      public static const const_2338:int = 8;
      
      public static const const_2936:int = 9;
      
      public static const const_398:int = 12;
      
      public static const const_2283:int = 14;
      
      public static const const_2325:int = 15;
      
      public static const const_3180:int = 16;
      
      public static const const_2694:int = 18;
      
      public static const const_1037:int = 20;
      
      public static const const_2846:int = 21;
      
      public static const const_1280:int = 22;
      
      public static const const_1958:int = 25;
      
      public static const const_1938:int = 26;
      
      public static const const_1680:int = 27;
      
      public static const const_3255:int = 28;
      
      public static const const_1379:int = 29;
      
      public static const const_1240:int = 30;
      
      public static const const_1862:int = 31;
      
      public static const const_249:int = 43;
      
      public static const const_2831:int = 44;
      
      public static const const_2152:int = 45;
       
      
      public var typeID:int;
      
      public var key:String;
      
      public var isAdvanced:Boolean;
      
      private var textField:TextField;
      
      private var guiManager:class_58;
      
      private var icon:MovieClip;
      
      private var tooltipKey:String;
      
      public function class_1553(param1:int, param2:String, param3:class_58, param4:String = "", param5:Boolean = false)
      {
         super(class_91.const_31);
         this.typeID = param1;
         this.key = param2;
         this.guiManager = param3;
         this.isAdvanced = param5;
         this.tooltipKey = param4;
         this.init();
      }
      
      public static function method_1830(param1:int) : String
      {
         if(param1 == 1)
         {
            return "0";
         }
         return "1";
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.icon = ResourceManager.getMovieClip("ui","checkBox");
         this.icon.gotoAndStop(1);
         this.icon.buttonMode = true;
         var _loc1_:Function = this.method_6449;
         if(this.typeID == const_1680)
         {
            _loc1_ = this.method_1487;
         }
         this.icon.addEventListener(MouseEvent.CLICK,_loc1_);
         this.addChild(this.icon);
         this.textField = new TextField();
         this.textField.defaultTextFormat = class_18.const_693;
         this.textField.embedFonts = class_18.var_603;
         this.textField.text = class_88.getItem(this.key);
         this.textField.border = false;
         this.textField.selectable = false;
         this.textField.autoSize = TextFieldAutoSize.LEFT;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.height = NaN;
         this.textField.x = this.icon.width + 5;
         this.textField.addEventListener(MouseEvent.CLICK,_loc1_);
         this.addChild(this.textField);
         if(this.tooltipKey != "")
         {
            _loc2_ = new Sprite();
            _loc2_.addChild(class_39(ResourceManager.name_15.getFinisher("icons")).getEmbeddedBitmap("general_help"));
            _loc2_.x = this.textField.x + this.textField.width + 5;
            _loc2_.y = this.textField.y;
            this.addChild(_loc2_);
            _loc3_ = class_94.getInstance().method_1211(_loc2_,class_88.getItem(this.tooltipKey));
            _loc3_.showImmediately = true;
         }
         this.resetSetting();
      }
      
      public function switchChecked(param1:int) : void
      {
         var _loc2_:int = param1 == 1 ? 2 : 1;
         this.icon.gotoAndStop(_loc2_);
      }
      
      public function setSetting() : void
      {
         class_1044.method_3423(this.typeID,method_1830(this.icon.currentFrame));
      }
      
      public function resetSetting() : void
      {
         var _loc1_:Boolean = Boolean(class_1044.method_3660(this.typeID));
         var _loc2_:int = _loc1_ ? 2 : 1;
         this.icon.gotoAndStop(_loc2_);
      }
      
      private function method_1487(param1:MouseEvent) : void
      {
         if(this.icon.currentFrame == 1)
         {
            this.guiManager.method_5092();
         }
         this.method_6449();
      }
      
      private function method_6449(param1:MouseEvent = null) : void
      {
         if(this.icon.currentFrame == 1)
         {
            this.icon.gotoAndStop(2);
         }
         else
         {
            this.icon.gotoAndStop(1);
         }
      }
      
      public function getType() : int
      {
         return this.typeID;
      }
      
      public function method_2702() : MovieClip
      {
         return this.icon;
      }
      
      public function show(param1:Boolean) : void
      {
         this.visible = param1;
      }
   }
}
