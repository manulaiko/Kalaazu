package package_123
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import package_122.class_340;
   import package_124.class_344;
   import package_26.class_94;
   import package_30.class_185;
   import package_30.class_209;
   import package_30.class_218;
   import package_38.class_345;
   import package_38.class_346;
   import package_9.ResourceManager;
   
   public class class_342 extends Sprite
   {
       
      
      private var var_3624:MovieClip;
      
      private var var_3798:Sprite;
      
      private var var_2813:class_218;
      
      private var var_3821:class_218;
      
      private var title:TextField;
      
      private var detail:class_209;
      
      private var description:TextField;
      
      public var var_2001:TextField;
      
      private var var_3534:TextField;
      
      private var _options:Array;
      
      private var var_2584:Sprite;
      
      private var var_1607:Vector.<class_340>;
      
      public function class_342(param1:Vector.<class_340>)
      {
         this.var_1607 = new Vector.<class_340>();
         super();
         this.var_1607 = param1;
         this.init();
      }
      
      private function init() : void
      {
         this._options = [];
         this.var_3624 = new MovieClip();
         var _loc1_:Bitmap = ResourceManager.getBitmap("ui","repairBG");
         this.var_3624.addChild(_loc1_);
         this.var_2813 = new class_218(class_185.const_26,"",ResourceManager.getMovieClip("ui","repairButtons"),class_18.const_954);
         this.var_3821 = new class_218(class_185.const_2386,"",ResourceManager.getMovieClip("ui","repairLogoutButtons"));
         this.var_2813.width = 229;
         this.var_2813.height = 32;
         this.var_2813.x = this.method_3021(this.var_2813);
         this.var_2813.y = 410;
         this.var_2813.addEventListener(MouseEvent.CLICK,this.method_2133);
         this.var_2813.method_581(true);
         this.var_2813.alpha = 1;
         this.var_2813.method_5741();
         this.var_3821.width = 26;
         this.var_3821.height = 27;
         this.var_3821.x = 490;
         this.var_3821.y = 5;
         this.description = new TextField();
         this.description.selectable = false;
         this.description.defaultTextFormat = class_18.const_2764;
         this.description.embedFonts = class_18.var_1210;
         this.description.autoSize = TextFieldAutoSize.CENTER;
         this.description.antiAliasType = AntiAliasType.ADVANCED;
         this.description.width = 300;
         this.description.x = this.method_3021(this.description);
         this.description.y = 115;
         this.detail = new class_209(400,100,TextFormatAlign.CENTER,false);
         this.detail.textArea.setStyle("textFormat",class_18.const_867);
         this.detail.textArea.setStyle("embedFonts",class_18.var_1210);
         this.detail.textArea.setStyle("textPadding",0);
         this.detail.x = this.method_3021(this.detail.textArea);
         this.detail.y = 304;
         this.var_2001 = new TextField();
         this.var_2001.defaultTextFormat = class_18.const_747;
         this.var_2001.embedFonts = class_18.var_1210;
         this.var_2001.autoSize = TextFieldAutoSize.CENTER;
         this.var_2001.x = this.method_3021(this.var_2001);
         this.var_2001.y = 90;
         this.title = new TextField();
         this.title.defaultTextFormat = class_18.const_1236;
         this.title.embedFonts = class_18.var_1210;
         this.title.selectable = false;
         this.title.autoSize = TextFieldAutoSize.CENTER;
         this.title.x = this.method_3021(this.title);
         this.title.y = 48;
         this.var_3534 = new TextField();
         this.var_3798 = new Sprite();
         this.var_3624.addChild(this.var_2813);
         this.var_3624.addChild(this.var_3821);
         this.var_3624.addChild(this.var_2001);
         this.var_3624.addChild(this.title);
         this.var_3624.addChild(this.description);
         this.var_3624.addChild(this.detail);
         this.var_3624.addChild(this.var_3534);
         this.var_3624.addChild(this.var_3798);
         addChild(this.var_3624);
      }
      
      public function method_5813() : void
      {
         this.var_3821.addEventListener(MouseEvent.CLICK,this.method_2849);
         this.var_3821.method_581(true);
      }
      
      public function method_25() : void
      {
         var _loc1_:* = null;
         this.var_3821.removeEventListener(MouseEvent.CLICK,this.method_2849);
         for each(_loc1_ in this._options)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_4864);
            _loc1_.method_2724();
         }
      }
      
      private function method_4864(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._options.length)
         {
            if(param1.currentTarget == this._options[_loc2_])
            {
               (this._options[_loc2_] as class_218).selected = true;
               dispatchEvent(new class_343(class_343.SET_SELECTED,(param1.currentTarget as class_218).getType()));
            }
            else
            {
               (this._options[_loc2_] as class_218).selected = false;
            }
            _loc2_++;
         }
      }
      
      private function method_2133(param1:MouseEvent) : void
      {
         this.var_2813.removeEventListener(MouseEvent.CLICK,this.method_2133);
         this.var_2813.method_2724();
         this.var_2813.method_581(false);
         dispatchEvent(new class_343(class_343.REPAIR));
      }
      
      private function method_3021(param1:Object) : Number
      {
         return Number(this.var_3624.width) - Number(param1["width"]) >> 1;
      }
      
      private function method_1579(param1:TextField, param2:int, param3:int) : void
      {
         param1.y = param2 + (param3 - param1.height >> 1);
      }
      
      private function method_2849(param1:MouseEvent = null) : void
      {
         dispatchEvent(new class_343(class_343.LOGOUT));
      }
      
      private function method_2696(param1:MouseEvent) : void
      {
         dispatchEvent(new class_343(class_343.OPEN_PROFILE_PAGE));
      }
      
      private function method_4981(param1:class_218) : void
      {
         param1.removeChild(param1.getChildByName("rect"));
         param1.removeChild(param1.getChildByName("mask"));
         param1.addEventListener(MouseEvent.CLICK,this.method_4864);
         param1.method_5741();
         param1.method_581(true);
         this.var_1607[param1.getType()].cooldown = 0;
         var _loc2_:TweenLite = this.var_1607[param1.getType()].method_2239;
         _loc2_.kill();
      }
      
      private function method_4990(param1:class_218) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(!(param1.getType() == class_345.const_2655 || param1.getType() == class_345.const_2251 || param1.getType() == class_345.const_667))
         {
            _loc2_ = ResourceManager.getBitmap("ui","icon_payment");
            _loc2_.name = "mask";
            _loc2_.x = _loc2_.y = 8;
            param1.addChild(_loc2_);
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(296397482);
            _loc3_.graphics.drawRect(0,0,100,100);
            _loc3_.graphics.endFill();
            (_loc4_ = new MovieClip()).name = "rect";
            _loc4_.addChild(_loc3_);
            _loc4_.x = _loc4_.y = 8;
            _loc4_.cacheAsBitmap = true;
            _loc2_.cacheAsBitmap = true;
            param1.addChild(_loc4_);
            _loc4_.mask = _loc2_;
            param1.removeEventListener(MouseEvent.CLICK,this.method_4864);
            param1.method_2724();
            param1.method_581(false);
            _loc5_ = int(this.var_1607[param1.getType()].cooldown);
            this.var_1607[param1.getType()].method_2239 = TweenLite.to(_loc4_,_loc5_,{
               "y":104,
               "alpha":0.2,
               "onComplete":this.method_4981,
               "onCompleteParams":[param1],
               "ease":Linear.easeNone(_loc5_,8,96,_loc5_ + 4)
            });
         }
      }
      
      private function method_5355(param1:class_218, param2:class_340) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = param2.currency == class_344.method_4307(class_346.CREDITS);
         if(_loc3_)
         {
            this.var_1607[5].method_3245 = class_88.getItem("desc_killscreen_repair_credits_impossible");
         }
         else
         {
            _loc4_ = ResourceManager.getBitmap("ui","icon_payment");
            param1.addChild(_loc4_);
            _loc4_.x = 8;
            _loc4_.y = 8;
            param1.setChildIndex(_loc4_,Number(param1.numChildren) - 2);
            this.var_1607[5].method_3245 = class_88.getItem("desc_killscreen_repair_impossible");
         }
         this.var_1607[5].name_29 = param2.name_29;
         this.var_1607[5].tooltip = param2.tooltip;
         this.var_1607[5].currency = param2.currency;
         param1.setType(5);
      }
      
      public function method_313(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new class_218(param1[_loc3_],"",ResourceManager.getMovieClip("ui","repairOptions"),class_18.const_2414)).addEventListener(MouseEvent.CLICK,this.method_4864);
            _loc4_.icon = ResourceManager.getBitmap("ui",this.var_1607[param1[_loc3_]].graphic);
            _loc4_.x = 150 * _loc3_;
            _loc4_.y = 150;
            if(this.var_1607[param1[_loc3_]].method_4246 > 0)
            {
               switch(this.var_1607[param1[_loc3_]].method_5292)
               {
                  case class_346.CREDITS:
                     _loc4_.method_4577 = class_88.getItem("pricetag_credits_compact").replace(/%VALUE%/,class_122.method_98(this.var_1607[param1[_loc3_]].method_4246));
                     continue;
                  case class_346.URIDIUM:
               }
               _loc4_.method_4577 = class_88.getItem("pricetag_uridium_compact").replace(/%VALUE%/,class_122.method_98(this.var_1607[param1[_loc3_]].method_4246));
            }
            else
            {
               _loc4_.method_4577 = class_88.getItem("pricetag_killscreen_free");
            }
            _loc4_.method_543(this.var_1607[param1[_loc3_]].method_1472);
            _loc4_.method_602(118);
            _loc4_.width = 116;
            _loc4_.height = 150;
            this._options.push(_loc4_);
            class_94.getInstance().method_1211(_loc4_,class_88.getItem(this.var_1607[param1[_loc3_]].tooltip));
            this.var_3798.addChild(_loc4_);
            if(this.var_1607[param1[_loc3_]].method_5478 == false)
            {
               this.method_5355(_loc4_,this.var_1607[param1[_loc3_]]);
            }
            else if(this.var_1607[param1[_loc3_]].cooldown > 0)
            {
               this.method_4990(_loc4_);
            }
            _loc3_++;
         }
         this.var_3798.x = this.method_3021(this.var_3798);
         this.method_2697();
         this.method_27();
      }
      
      private function method_2697() : void
      {
         if(this.method_2377(class_345.const_2655))
         {
            class_94.getInstance().method_1211(this.var_3821,class_88.getItem("ttip_killscreen_logout_spawnpoint"));
         }
         else if(this.method_2377(class_345.const_2251))
         {
            class_94.getInstance().method_1211(this.var_3821,class_88.getItem("ttip_killscreen_logout_hadesgate"));
         }
         else if(this.method_2377(class_345.const_667))
         {
            class_94.getInstance().method_1211(this.var_3821,class_88.getItem("ttip_killscreen_logout_tdm"));
         }
         else if(Boolean(this.method_2377(class_345.const_1505)) && Boolean(this.method_2377(class_345.const_598)))
         {
            class_94.getInstance().method_1211(this.var_3821,class_88.getItem("ttip_killscreen_logout_1"));
         }
         else
         {
            class_94.getInstance().method_1211(this.var_3821,class_88.getItem("ttip_logout"));
         }
      }
      
      private function method_27() : void
      {
         var _loc1_:* = null;
         if(this.method_2377(class_345.const_2655))
         {
            _loc1_ = this.method_447(class_345.const_2655);
         }
         else if(this.method_2377(class_345.const_2251))
         {
            _loc1_ = this.method_447(class_345.const_2251);
         }
         else if(this.method_2377(class_345.const_667))
         {
            _loc1_ = this.method_447(class_345.const_667);
         }
         else if(this.method_2377(class_345.const_1510))
         {
            _loc1_ = this.method_447(class_345.const_1510);
         }
         else
         {
            if(!this.method_2377(class_345.const_1445))
            {
               return;
            }
            _loc1_ = this.method_447(class_345.const_1445);
         }
         _loc1_.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      private function method_2377(param1:uint) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         for each(_loc3_ in this._options)
         {
            if(_loc3_.getType() == param1)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      private function method_447(param1:uint) : class_218
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._options)
         {
            if(_loc2_.getType() == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function method_5203() : void
      {
         var _loc1_:* = null;
         this.method_25();
         this.method_2014();
         this.method_5813();
         for each(_loc1_ in this._options)
         {
            this.var_3798.removeChild(_loc1_);
         }
         this._options = [];
      }
      
      public function setTitle(param1:String) : void
      {
         this.title.text = param1;
      }
      
      public function method_4318(param1:String) : void
      {
         this.description.text = param1;
      }
      
      public function method_5164(param1:String) : void
      {
         this.detail.textArea.htmlText = param1;
         this.detail.textArea.verticalScrollPosition = this.detail.textArea.maxVerticalScrollPosition;
      }
      
      public function method_4045(param1:String, param2:String) : void
      {
         this.method_2872();
         this.var_2813.method_4577 = param1;
         this.var_2813.method_602(5);
         this.var_2813.width = 229;
         this.var_2813.height = 32;
         this.var_2813.x = this.method_3021(this.var_2813);
         class_94.getInstance().method_1211(this.var_2813,param2);
      }
      
      public function method_3804(param1:String, param2:String, param3:Boolean) : void
      {
         this.var_3534.defaultTextFormat = class_18.const_2764;
         this.var_3534.embedFonts = class_18.var_1210;
         this.var_3534.text = param1;
         this.var_2001.text = param2;
         if(param3)
         {
            this.var_2584 = new Sprite();
            this.var_2584.graphics.beginFill(16711680);
            this.var_2584.graphics.drawRect(0,0,this.var_2001.width,this.var_2001.height);
            this.var_2584.alpha = 0;
            this.var_2584.addEventListener(MouseEvent.CLICK,this.method_2696);
            this.var_2584.buttonMode = true;
            this.var_2584.x = this.var_2001.x;
            this.var_2584.y = this.var_2001.y;
            this.var_3624.addChild(this.var_2584);
         }
         this.var_2001.selectable = param3;
         this.var_3534.selectable = false;
         this.var_3534.autoSize = TextFieldAutoSize.CENTER;
         this.var_3534.x = this.method_3021(this.var_3534);
         this.var_3534.y = 70;
      }
      
      public function method_2014() : void
      {
         class_94.getInstance().method_4247(this.var_2813);
         class_94.getInstance().method_4247(this.var_3821);
         var _loc1_:int = 0;
         while(_loc1_ < this._options.length)
         {
            class_94.getInstance().method_4247(this._options[_loc1_]);
            _loc1_++;
         }
      }
      
      public function method_2190() : void
      {
         this.var_2813.visible = false;
      }
      
      public function method_2872() : void
      {
         this.var_2813.visible = true;
      }
      
      public function cleanup() : void
      {
         this.method_25();
         this.method_5164("");
         this.method_2190();
      }
   }
}
