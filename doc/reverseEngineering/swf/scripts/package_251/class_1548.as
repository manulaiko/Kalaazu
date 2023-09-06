package package_251
{
   import fl.controls.Slider;
   import fl.controls.SliderDirection;
   import fl.events.SliderEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.gui.class_1044;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_30.class_91;
   
   public class class_1548 extends class_91
   {
      
      public static const const_3098:int = 20;
      
      public static const const_2903:int = 350;
       
      
      private var typeID:int;
      
      private var labelKey:String;
      
      private var elements:Array;
      
      public var slider:Slider;
      
      private var var_3351:TextField;
      
      public function class_1548(param1:int, param2:String, param3:Array)
      {
         super(class_91.const_748);
         this.typeID = param1;
         this.labelKey = param2;
         this.elements = param3;
         this.init();
      }
      
      private function init() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:TextField = new TextField();
         _loc1_.selectable = false;
         _loc1_.defaultTextFormat = class_18.const_2843;
         _loc1_.textColor = 16777215;
         _loc1_.text = class_88.getItem(this.labelKey);
         _loc1_.border = false;
         _loc1_.embedFonts = class_18.var_5039;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.antiAliasType = AntiAliasType.ADVANCED;
         _loc1_.height = NaN;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.var_3351 = new TextField();
         this.var_3351.selectable = false;
         this.var_3351.defaultTextFormat = class_18.const_2843;
         this.var_3351.textColor = 15327936;
         this.var_3351.border = false;
         this.var_3351.embedFonts = class_18.var_5039;
         this.var_3351.autoSize = TextFieldAutoSize.LEFT;
         this.var_3351.antiAliasType = AntiAliasType.ADVANCED;
         this.var_3351.height = NaN;
         this.var_3351.x = _loc1_.width + 10;
         this.var_3351.y = 0;
         addChild(this.var_3351);
         var _loc2_:int = Math.round(const_2903 / (this.elements.length - 1));
         var _loc3_:int = int(const_3098);
         for each(_loc5_ in this.elements)
         {
            (_loc4_ = new TextField()).selectable = false;
            _loc4_.defaultTextFormat = class_18.const_693;
            _loc4_.embedFonts = class_18.var_603;
            _loc4_.text = class_88.getItem(_loc5_.labelKey);
            _loc4_.border = false;
            _loc4_.selectable = false;
            _loc4_.autoSize = TextFieldAutoSize.LEFT;
            _loc4_.antiAliasType = AntiAliasType.ADVANCED;
            _loc4_.height = NaN;
            _loc4_.x = _loc3_ - _loc4_.width / 2;
            _loc4_.y = _loc4_.height;
            addChild(_loc4_);
            _loc3_ += _loc2_;
         }
         this.slider = new Slider();
         this.slider.direction = SliderDirection.HORIZONTAL;
         this.slider.move(const_3098,_loc1_.height + 20);
         this.slider.setSize(const_2903,10);
         this.slider.maximum = this.elements.length - 1;
         this.slider.minimum = 0;
         this.slider.snapInterval = 1;
         addChild(this.slider);
         this.slider.addEventListener(SliderEvent.CHANGE,this.method_628);
      }
      
      public function method_5841(param1:int) : void
      {
         this.slider.value = param1;
      }
      
      public function method_57() : int
      {
         return int(this.slider.value);
      }
      
      public function setSetting() : void
      {
         class_1044.method_3423(this.typeID,String(this.slider.value));
      }
      
      public function resetSetting() : void
      {
         var _loc1_:int = int(class_1044.method_4513(this.typeID));
         this.method_5841(_loc1_);
         if(true)
         {
            this.method_1046(class_1559(this.elements[_loc1_]).labelKey);
         }
         else
         {
            this.method_1046("quality_custom");
         }
      }
      
      public function method_1046(param1:String) : void
      {
         this.var_3351.text = class_88.getItem(param1);
      }
      
      private function method_628(param1:SliderEvent) : void
      {
         this.method_5841(this.slider.value);
         this.method_1046(class_1559(this.elements[this.slider.value]).labelKey);
      }
   }
}
