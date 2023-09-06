package package_74
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.net.class_53;
   import net.bigpoint.darkorbit.net.class_74;
   import package_11.class_39;
   import package_17.class_62;
   import package_174.class_1060;
   import package_175.StarmapBattleStationIconProxy;
   import package_9.ResourceManager;
   
   public class class_205 extends Sprite
   {
      
      private static const const_2917:TextFormat = new TextFormat(class_18.const_740,class_18.const_2945,15327936,null,null,null,null,null,TextFormatAlign.CENTER);
       
      
      private var var_4585:Sprite;
      
      private var maps:Array;
      
      private var finisher:class_39;
      
      private var connectionManager:class_53;
      
      public var lastSelectedMapForJump:class_1061;
      
      private var tween:TweenLite;
      
      public var var_4690:Boolean = false;
      
      public function class_205()
      {
         this.maps = [];
         super();
      }
      
      public function init(param1:Array, param2:Array, param3:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         this.finisher = class_39(ResourceManager.name_15.getFinisher("spacemap"));
         this.addChild(this.finisher.getEmbeddedBitmap(param3));
         var _loc8_:int = 0;
         while(_loc8_ < param1.length)
         {
            _loc6_ = int(param1[_loc8_]);
            _loc7_ = class_73(param2[_loc6_]);
            _loc5_ = this.finisher.getEmbeddedBitmap("map_" + _loc6_);
            (_loc4_ = new class_1061(_loc6_,_loc5_)).setPosition(_loc7_.x + 1,_loc7_.y + 1);
            this.maps[_loc6_] = _loc4_;
            this.addChild(_loc4_);
            this.method_6000(_loc4_);
            _loc8_++;
         }
      }
      
      public function update(param1:int, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc5_:* = null;
         this.method_25();
         var _loc6_:int = 0;
         while(_loc6_ < this.maps.length)
         {
            if((_loc5_ = this.maps[_loc6_]) != null)
            {
               this.cleanup(_loc5_);
            }
            _loc6_++;
         }
         this.method_3682(param1);
         this.method_1628(param4);
         this.method_141(param3);
         this.method_5137(param2);
         this.method_4239();
         this.method_3257();
      }
      
      public function method_4239() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.maps.length)
         {
            _loc2_ = this.maps[_loc1_];
            if(_loc2_ != null)
            {
               _loc3_ = this.method_1175.method_1794(_loc1_);
               if(_loc3_)
               {
                  (_loc4_ = new class_1062(_loc3_)).x = Number(_loc3_.name_146) / 100 * Number(_loc2_.width);
                  _loc4_.y = Number(_loc3_.name_102) / 100 * Number(_loc2_.height);
                  _loc2_.method_4940(_loc4_);
               }
               else if(_loc2_.method_6323)
               {
                  _loc2_.method_382();
               }
            }
            _loc1_++;
         }
      }
      
      private function cleanup(param1:class_1061) : void
      {
         var _loc2_:int = 0;
         if(param1.numChildren > 1)
         {
            _loc2_ = 1;
            while(_loc2_ < param1.numChildren - 1)
            {
               param1.removeChildAt(_loc2_);
               _loc2_++;
            }
         }
      }
      
      private function method_5137(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:* = [];
         var _loc8_:int = 0;
         while(_loc8_ < param1.length)
         {
            _loc3_ = param1[_loc8_];
            _loc6_ = int(_loc3_[0]);
            _loc4_ = _loc3_[1];
            _loc9_ = 0;
            while(_loc9_ < _loc4_.length)
            {
               _loc7_ = int(_loc4_[_loc9_]);
               _loc2_.push(_loc7_);
               if((_loc5_ = this.method_1063(_loc7_)) != null)
               {
                  _loc5_.var_1161 = class_126.getInstance().var_1524[_loc7_];
                  _loc5_.price = _loc6_;
                  this.method_2998(_loc5_);
               }
               _loc9_++;
            }
            _loc8_++;
         }
         this.addListeners(_loc2_);
      }
      
      private function method_1628(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = int(param1[_loc4_]);
            _loc2_ = this.method_1063(_loc3_);
            if(_loc2_ != null)
            {
               _loc2_.var_1161 = class_126.getInstance().var_1524[_loc3_];
               _loc2_.price = -1;
               this.method_13(_loc2_);
            }
            _loc4_++;
         }
      }
      
      private function method_141(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = int(param1[_loc4_]);
            _loc2_ = this.method_1063(_loc3_);
            if(_loc2_ != null)
            {
               _loc2_.var_1161 = class_126.getInstance().var_1524[_loc3_];
               _loc2_.price = -1;
               this.method_325(_loc2_);
            }
            _loc4_++;
         }
      }
      
      public function method_800(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.method_1063(param1) != null)
         {
            if(this.lastSelectedMapForJump != null)
            {
               _loc2_ = this.method_1063(this.lastSelectedMapForJump.id);
               if(_loc2_.method_3843)
               {
                  _loc2_.method_1779();
               }
            }
            _loc2_ = this.method_1063(param1);
            if(_loc2_ != null)
            {
               this.lastSelectedMapForJump = _loc2_;
               this.lastSelectedMapForJump.method_356(this.method_5252());
            }
         }
      }
      
      public function method_6388(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(Boolean(this.method_1063(param2)) && Boolean(this.lastSelectedMapForJump) && Boolean(this.lastSelectedMapForJump.method_3843))
         {
            _loc3_ = this.lastSelectedMapForJump.method_3843;
            _loc4_ = _loc3_.getChildAt(1) as TextField;
            _loc5_ = _loc3_.getChildAt(0) as Sprite;
            if(param1 > -1)
            {
               this.var_4690 = true;
               this.tween = TweenLite.to(_loc5_,param1,{
                  "ease":Linear.easeNone,
                  "rotation":-180 * param1,
                  "onUpdate":this.setText,
                  "onUpdateParams":[_loc4_]
               });
            }
            else
            {
               this.var_4690 = false;
               TweenLite.killTweensOf(_loc5_);
               _loc3_.getChildAt(1).rotation = 0;
               TextField(_loc3_.getChildAt(1)).text = "";
            }
         }
      }
      
      private function method_3257() : void
      {
         this.var_4690 = false;
      }
      
      private function setText(param1:TextField) : void
      {
         param1.text = (Number(this.tween.duration) - Math.round(this.tween.currentTime)).toString();
         if(param1.text == "0")
         {
            param1.text = "";
         }
      }
      
      private function method_5252() : Sprite
      {
         if(!this.var_4585)
         {
            this.var_4585 = this.method_3867();
         }
         else
         {
            this.var_4585.x = Number(this.lastSelectedMapForJump.width) * 0.5;
            this.var_4585.y = Number(this.lastSelectedMapForJump.height) * 0.5;
         }
         return this.var_4585;
      }
      
      private function method_3867() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Bitmap = this.finisher.getEmbeddedBitmap("jump_cpu_loading_animation");
         _loc3_.cacheAsBitmap = true;
         _loc3_.x = -_loc3_.width * 0.5;
         _loc3_.y = -_loc3_.height * 0.5;
         _loc1_.x = Number(this.lastSelectedMapForJump.width) * 0.5;
         _loc1_.y = Number(this.lastSelectedMapForJump.height) * 0.5;
         _loc2_.addChild(_loc3_);
         _loc1_.addChild(_loc2_);
         var _loc4_:TextField;
         (_loc4_ = new TextField()).defaultTextFormat = const_2917;
         _loc4_.type = TextFieldType.DYNAMIC;
         _loc4_.embedFonts = class_18.var_3911;
         _loc4_.antiAliasType = AntiAliasType.ADVANCED;
         _loc4_.selectable = false;
         _loc4_.width = _loc3_.width;
         _loc4_.height = class_18.const_2945;
         _loc4_.y = 0;
         _loc4_.x = _loc3_.x;
         _loc1_.addChild(_loc4_);
         return _loc1_;
      }
      
      private function method_2998(param1:class_1061) : void
      {
         this.method_4427(param1,null);
      }
      
      private function method_325(param1:class_1061) : void
      {
         var _loc2_:Bitmap = this.finisher.getEmbeddedBitmap("marker_level_locked");
         param1.method_1779();
         this.method_4427(param1,_loc2_);
      }
      
      public function method_13(param1:class_1061) : void
      {
         var _loc2_:Bitmap = this.finisher.getEmbeddedBitmap("marker_uri_locked");
         param1.method_1779();
         this.method_4427(param1,_loc2_);
      }
      
      private function method_6000(param1:class_1061) : void
      {
         var _loc2_:Bitmap = this.finisher.getEmbeddedBitmap("marker_blocked");
         param1.method_1779();
         this.method_4427(param1,_loc2_);
      }
      
      public function method_3682(param1:int) : void
      {
         var _loc3_:* = null;
         this.lastSelectedMapForJump = null;
         var _loc2_:class_1061 = this.method_1063(param1);
         if(_loc2_ != null)
         {
            _loc3_ = this.finisher.getEmbeddedBitmap("marker_currentMap");
            _loc2_.method_1779();
            this.method_4427(_loc2_,_loc3_);
         }
      }
      
      private function method_4427(param1:class_1061, param2:Bitmap = null) : void
      {
         if(param1.numChildren > 1)
         {
            param1.removeChildAt(1);
         }
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(0,0);
         _loc3_.graphics.drawRect(0,0,param1.width,param1.height);
         _loc3_.graphics.endFill();
         if(param2 != null)
         {
            param2.x = (Number(param1.width) - param2.width) * 0.5;
            param2.y = (Number(param1.height) - param2.height) * 0.5;
            _loc3_.addChild(param2);
         }
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         param1.addChild(_loc3_);
         param1.useHandCursor = true;
         param1.buttonMode = true;
      }
      
      public function setPosition(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function method_1063(param1:int) : class_1061
      {
         return this.maps[param1] as class_1061;
      }
      
      public function addListeners(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = this.method_1063(param1[_loc3_]);
            if(_loc2_ != null)
            {
               _loc2_.addEventListener(MouseEvent.CLICK,this.method_2220);
            }
            _loc3_++;
         }
      }
      
      public function method_25() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.maps.length)
         {
            _loc1_ = this.maps[_loc2_];
            if(_loc1_ != null && Boolean(_loc1_.hasEventListener(MouseEvent.CLICK)))
            {
               _loc1_.removeEventListener(MouseEvent.CLICK,this.method_2220);
            }
            _loc2_++;
         }
      }
      
      private function method_2220(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(!this.var_4690 && param1.target is class_1061)
         {
            _loc2_ = int(class_1061(param1.target).id);
            this.connectionManager.sendCommand(class_74.const_1367,[class_74.const_1690,_loc2_]);
         }
      }
      
      public function method_5755(param1:class_53) : void
      {
         this.connectionManager = param1;
      }
      
      public function method_6051() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.maps.length)
         {
            _loc1_ = this.maps[_loc2_];
            if(_loc1_ != null)
            {
               this.method_13(_loc1_);
            }
            _loc2_++;
         }
      }
      
      public function method_3653(param1:int) : void
      {
         var _loc2_:class_1061 = this.method_1063(param1);
         if(_loc2_ != null)
         {
         }
      }
      
      private function get method_1175() : StarmapBattleStationIconProxy
      {
         return class_62.getInstance().retrieveProxy(StarmapBattleStationIconProxy.NAME) as StarmapBattleStationIconProxy;
      }
   }
}
