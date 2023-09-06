package package_171
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.mvc.common.KeyboardNotifications;
   import package_11.class_39;
   import package_17.class_62;
   import package_30.class_162;
   import package_9.ResourceManager;
   
   public class class_1041 extends Sprite
   {
      
      public static const OUT:int = 1;
      
      public static const HOVER:int = 2;
      
      public static const DOWN:int = 3;
      
      public static const INACTIVE:int = 4;
      
      public static const const_1943:String = "inc";
      
      public static const const_2578:String = "dec";
       
      
      private var var_844:class_162;
      
      private var var_2278:TextField;
      
      private var var_3499:TextField;
      
      private var var_481:int = -1;
      
      private var var_393:int = 0;
      
      private var var_2500:int = 0;
      
      public var var_1038:MovieClip;
      
      public var var_4135:MovieClip;
      
      private var var_2948:String = "";
      
      private var var_1935:String = "";
      
      private var var_2947:Boolean = false;
      
      private var var_161:Boolean = false;
      
      private var var_4769:int;
      
      private var var_118:int = -1;
      
      public function class_1041(param1:class_162)
      {
         super();
         this.var_844 = param1;
         this.init();
      }
      
      public function getValue() : int
      {
         var _loc1_:int = 0;
         if(this.var_3499.text.length > 0)
         {
            _loc1_ = int(this.var_3499.text);
         }
         else
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function method_3523(param1:int) : void
      {
         this.var_4769 = param1;
      }
      
      public function method_5215(param1:int, param2:int) : void
      {
         this.var_118 = param2;
         if(this.var_481 > param1)
         {
            this.var_2500 = param1;
            this.var_481 = param1;
            this.var_393 = 0;
            this.method_657();
         }
         else
         {
            this.var_2500 = param1 - param1 % Number(this.var_4769);
            this.var_481 = param1;
            this.var_393 = Number(this.var_481) - Number(this.var_2500);
            this.method_657();
         }
         this.setText(this.var_3499,String(this.var_2500));
         this.setText(this.var_2278,String(this.var_481));
         this.method_2797();
      }
      
      public function method_1946() : void
      {
      }
      
      private function setText(param1:TextField, param2:String) : void
      {
         if(param1.text == "" && param2 == "0")
         {
            return;
         }
         if(param1.text != param2)
         {
            param1.text = param2;
         }
      }
      
      private function method_657() : void
      {
         if(this.var_481 == 0 || this.var_118 < 0 || this.var_481 < this.var_4769)
         {
            this.var_161 = true;
            this.var_2947 = true;
            this.method_629(this.var_4135,INACTIVE);
            this.method_629(this.var_1038,INACTIVE);
            this.method_25();
         }
         else
         {
            if(this.var_481 > this.var_2500 && Number(this.var_481) - Number(this.var_2500) >= this.var_4769)
            {
               this.var_2947 = false;
               this.method_629(this.var_1038,OUT);
            }
            if(this.var_2500 == 0)
            {
               this.var_161 = true;
               this.method_629(this.var_4135,INACTIVE);
            }
            else
            {
               this.var_161 = false;
               this.method_629(this.var_4135,OUT);
            }
            this.addListeners();
         }
      }
      
      private function init() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         var _loc2_:TextFormat = class_18.const_2667;
         _loc2_.align = TextFormatAlign.CENTER;
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Sprite = new Sprite();
         this.var_2278 = new TextField();
         this.var_2278.antiAliasType = AntiAliasType.ADVANCED;
         this.var_2278.defaultTextFormat = _loc2_;
         this.var_2278.embedFonts = class_18.var_3911;
         this.var_2278.multiline = false;
         this.var_2278.selectable = false;
         this.var_2278.textColor = 10066329;
         this.var_2278.setTextFormat(_loc2_);
         this.var_2278.width = 50;
         this.var_2278.height = 18;
         this.var_2278.restrict = "0-9";
         this.var_2278.maxChars = 6;
         this.var_2278.y = 1;
         this.var_3499 = new TextField();
         this.var_3499.type = TextFieldType.INPUT;
         this.var_3499.antiAliasType = AntiAliasType.ADVANCED;
         this.var_3499.defaultTextFormat = _loc2_;
         this.var_3499.embedFonts = class_18.var_3911;
         this.var_3499.multiline = false;
         this.var_3499.selectable = true;
         this.var_3499.textColor = 16777215;
         this.var_3499.setTextFormat(_loc2_);
         this.var_3499.width = 40;
         this.var_3499.height = 18;
         this.var_3499.restrict = "0-9";
         this.var_3499.maxChars = 6;
         this.var_3499.text = "0";
         this.var_3499.y = this.var_2278.y + this.var_2278.height - 2;
         this.var_1038 = _loc1_.getEmbeddedMovieClip("numericStepperPlus");
         this.var_1038.y = 17;
         this.var_1038.x = 53;
         this.var_1038.buttonMode = this.var_1038.useHandCursor = true;
         this.method_629(this.var_1038,INACTIVE);
         this.var_4135 = _loc1_.getEmbeddedMovieClip("numericStepperMinus");
         this.var_4135.y = 17;
         this.var_4135.buttonMode = this.var_4135.useHandCursor = true;
         this.method_629(this.var_4135,INACTIVE);
         _loc4_.x = Number(this.var_1038.width) * 0.5;
         _loc4_.y = Number(this.var_1038.height) * 0.5;
         _loc4_.addChild(this.var_1038);
         _loc4_.addChild(this.var_4135);
         this.var_3499.x = this.var_4135.x + this.var_4135.width - 1;
         this.var_2278.width = _loc4_.width;
         _loc3_.addChild(this.var_3499);
         _loc3_.addChild(this.var_2278);
         addChild(_loc4_);
         addChild(_loc3_);
      }
      
      private function method_4985(param1:MouseEvent) : void
      {
         this.method_5393();
         if(this.var_393 + this.var_4769 < this.var_481)
         {
            this.method_3910(this.var_393 + this.var_4769);
         }
         else
         {
            this.method_3910(this.var_481);
         }
      }
      
      private function method_492(param1:MouseEvent) : void
      {
         this.method_5393();
         if(Number(this.var_393) - Number(this.var_4769) >= 0)
         {
            this.method_3910(Number(this.var_393) - Number(this.var_4769));
         }
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = MovieClip(param1.target);
         if(!this.var_161 && _loc2_ == this.var_4135)
         {
            this.method_629(_loc2_,OUT);
         }
         else if(!this.var_2947 && _loc2_ == this.var_1038)
         {
            this.method_629(_loc2_,OUT);
         }
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = MovieClip(param1.target);
         if(!this.var_161 && _loc2_ == this.var_4135)
         {
            this.method_629(_loc2_,HOVER);
         }
         else if(!this.var_2947 && _loc2_ == this.var_1038)
         {
            this.method_629(_loc2_,HOVER);
         }
      }
      
      public function method_3497() : void
      {
         this.var_3499.removeEventListener(FocusEvent.FOCUS_IN,this.method_1191);
         this.var_3499.removeEventListener(FocusEvent.FOCUS_OUT,this.method_5527);
         this.var_3499.removeEventListener(Event.CHANGE,this.method_4139);
         this.var_3499.type = TextFieldType.DYNAMIC;
         this.var_3499.selectable = false;
         this.var_3499.mouseEnabled = false;
      }
      
      public function method_3747() : void
      {
         this.var_3499.addEventListener(FocusEvent.FOCUS_IN,this.method_1191);
         this.var_3499.addEventListener(FocusEvent.FOCUS_OUT,this.method_5527);
         this.var_3499.addEventListener(Event.CHANGE,this.method_4139);
         this.var_3499.type = TextFieldType.INPUT;
         this.var_3499.selectable = true;
         this.var_3499.mouseEnabled = true;
      }
      
      public function method_2868() : void
      {
         this.var_2947 = true;
         this.method_629(this.var_1038,INACTIVE);
         this.var_1038.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
         this.var_1038.removeEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.var_1038.removeEventListener(MouseEvent.CLICK,this.method_492);
      }
      
      public function method_2500() : void
      {
         this.var_161 = true;
         this.method_629(this.var_4135,INACTIVE);
         this.var_4135.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
         this.var_4135.removeEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.var_4135.removeEventListener(MouseEvent.CLICK,this.method_4985);
      }
      
      public function method_2435() : void
      {
         this.var_2947 = false;
         this.method_629(this.var_1038,OUT);
         this.var_1038.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
         this.var_1038.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.var_1038.addEventListener(MouseEvent.CLICK,this.method_492);
      }
      
      public function method_4565() : void
      {
         this.var_161 = false;
         this.method_629(this.var_4135,OUT);
         this.var_4135.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
         this.var_4135.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.var_4135.addEventListener(MouseEvent.CLICK,this.method_4985);
      }
      
      public function addListeners() : void
      {
         if(!this.var_1038.hasEventListener(MouseEvent.MOUSE_OVER))
         {
            this.method_2435();
            this.method_4565();
            this.method_3747();
         }
      }
      
      public function method_25() : void
      {
         if(this.var_1038.hasEventListener(MouseEvent.MOUSE_OVER))
         {
            this.method_2868();
            this.method_2500();
            this.method_3497();
            this.var_393 = 0;
         }
      }
      
      private function method_2126(param1:Event) : void
      {
         var _loc2_:int = int(TextField(param1.target).text);
         if(_loc2_ > this.var_481)
         {
            _loc2_ = int(this.var_481);
         }
         this.var_393 = _loc2_;
         if(this.var_2948 != String(_loc2_))
         {
            this.method_3910(this.var_393);
         }
      }
      
      private function method_1191(param1:FocusEvent) : void
      {
         class_62.getInstance().method_2407(KeyboardNotifications.LOCK_KEYBOARD);
         this.var_1935 = TextField(param1.target).text;
         this.setText(TextField(param1.target),"");
      }
      
      private function method_4139(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = int(TextField(param1.target).text);
         if(_loc2_ > this.var_481)
         {
            _loc3_ = int(this.var_481);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         _loc4_ = Number(this.var_481) - _loc3_;
         this.method_3910(_loc4_);
      }
      
      private function method_5527(param1:FocusEvent) : void
      {
         class_62.getInstance().method_2407(KeyboardNotifications.UNLOCK_KEYBOARD);
         var _loc2_:TextField = TextField(param1.target);
         if(!_loc2_.text.length > 0)
         {
            this.setText(_loc2_,this.var_1935);
         }
         this.method_5393();
         this.var_1935 = "";
      }
      
      private function method_5393() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(this.var_3499.text);
         if(_loc1_ > this.var_481)
         {
            _loc2_ = int(this.var_481);
         }
         else
         {
            _loc2_ = _loc1_;
         }
         _loc2_ -= _loc2_ % Number(this.var_4769);
         var _loc3_:int = Number(this.var_481) - _loc2_;
         this.method_3910(_loc3_);
      }
      
      private function method_629(param1:MovieClip, param2:int) : void
      {
         param1.gotoAndStop(param2);
      }
      
      private function method_3910(param1:int) : void
      {
         this.var_2500 = Number(this.var_481) - param1;
         this.var_393 = param1;
         this.setText(this.var_3499,String(this.var_2500));
         this.method_2797();
         dispatchEvent(new class_1042(class_1042.CHANGE,this.var_2500));
      }
      
      public function method_5301() : void
      {
         this.setText(this.var_3499,String(0));
      }
      
      public function method_2797() : void
      {
         this.var_2947 = false;
         this.var_161 = false;
         if(this.var_393 < this.var_4769 || this.var_118 < 0)
         {
            this.var_2947 = true;
            this.method_629(this.var_1038,INACTIVE);
         }
         else
         {
            this.var_2947 = false;
            this.method_629(this.var_1038,OUT);
         }
         if(this.var_481 == this.var_393 || this.var_2500 == 0 || this.var_118 < 0)
         {
            this.var_161 = true;
            this.method_629(this.var_4135,INACTIVE);
         }
         else
         {
            this.var_161 = false;
            this.method_629(this.var_4135,OUT);
         }
         if(this.var_118 < 0)
         {
            this.setText(this.var_3499,"");
         }
         this.var_844.method_4423(!this.var_2947 || !this.var_161);
      }
      
      public function method_2884(param1:Point) : void
      {
         this.var_4769 = param1.y;
      }
   }
}
