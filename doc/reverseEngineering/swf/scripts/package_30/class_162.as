package package_30
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.net.class_74;
   import package_11.class_39;
   import package_171.class_1041;
   import package_171.class_1042;
   import package_22.class_169;
   import package_22.class_198;
   import package_26.class_94;
   import package_38.class_163;
   import package_38.class_476;
   import package_9.ResourceManager;
   
   public class class_162 extends class_91
   {
       
      
      private var guiManager:class_58;
      
      private var type:int;
      
      private var languageKey:String;
      
      private var var_3771:class_1041;
      
      private var var_4472:MovieClip;
      
      private var var_3209:MovieClip;
      
      private var var_118:int;
      
      private var sellButton:class_218;
      
      private var var_1291:TextField;
      
      private var var_660:int;
      
      private var var_3431:Number;
      
      private var var_1318:TextField;
      
      private var var_4373:int;
      
      private var var_4598:Number;
      
      private var var_3655:String;
      
      private var pricetagTooltipKey:String;
      
      private var var_2072:String;
      
      private var var_2763:String;
      
      private var gaintagTooltipKey:String;
      
      private var var_688:Array = null;
      
      private var var_4981:Boolean = false;
      
      public function class_162(param1:class_58, param2:int, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:Boolean = false)
      {
         super(class_91.const_2531);
         this.guiManager = param1;
         this.type = param2;
         this.languageKey = param3;
         this.var_3655 = param4;
         this.pricetagTooltipKey = param6;
         this.var_2763 = param8;
         if(param5 != "")
         {
            this.var_2072 = param5;
         }
         else
         {
            this.var_2072 = param4;
         }
         this.gaintagTooltipKey = param7;
         this.var_4981 = param9;
         if(this.var_4981)
         {
            this.var_688 = [];
            this.var_688[0] = 1;
            this.var_688[1] = 0;
         }
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.var_4472 = _loc1_.getEmbeddedMovieClip("trade_module_1");
         this.var_4472.mouseEnabled = class_9.const_3029;
         this.var_1291 = this.var_4472["ore_price"];
         this.var_1291.defaultTextFormat = class_18.const_2843;
         this.var_1291.embedFonts = class_18.var_3911;
         this.var_1291.text = "";
         this.var_660 = this.var_1291.width;
         this.var_3431 = this.var_1291.x;
         this.var_1318 = this.var_4472["ore_gain"];
         this.var_1318.defaultTextFormat = class_18.const_2843;
         this.var_1318.embedFonts = class_18.var_3911;
         this.var_1318.text = "";
         this.var_4373 = this.var_1318.width;
         this.var_4598 = this.var_1318.x;
         var _loc2_:MovieClip = new MovieClip();
         _loc2_.x = 8;
         _loc2_.y = 79;
         this.var_4472.addChild(_loc2_);
         this.var_3771 = new class_1041(this);
         this.var_3771.method_3523(!!this.var_4981 ? int(this.var_688[1]) : 1);
         this.var_3771.addEventListener(class_1042.CHANGE,this.method_1133);
         _loc2_.addChild(this.var_3771);
         addChild(this.var_4472);
         this.var_3209 = this.var_4472["_oreTarget"];
         var _loc3_:class_169 = class_198.var_4944[int(this.type)];
         var _loc4_:Bitmap;
         (_loc4_ = _loc1_.getEmbeddedBitmap(_loc3_.resKey)).x = Number(this.var_3209.width) / 2 - _loc4_.width / 2;
         _loc4_.y = Number(this.var_3209.height) / 2 - _loc4_.height / 2;
         this.var_3209.addChild(_loc4_);
         if(this.type == class_163.PALLADIUM)
         {
            this.sellButton = new class_218(class_185.var_4147,class_88.getItem("out_trade"),_loc1_.getEmbeddedMovieClip("tradeButton"),class_18.const_2538);
            this.sellButton.addEventListener(MouseEvent.CLICK,this.method_213);
         }
         else
         {
            this.sellButton = new class_218(class_185.var_4139,class_88.getItem("out_verkaufen"),_loc1_.getEmbeddedMovieClip("sellButton"),class_18.const_2538);
            this.sellButton.addEventListener(MouseEvent.CLICK,this.method_6369);
         }
         this.sellButton.y = 135;
         this.sellButton.x = 6;
         this.sellButton.width = 70;
         this.sellButton.height = 15;
         this.sellButton.method_602(0);
         addChild(this.sellButton);
      }
      
      public function method_2875() : void
      {
         this.var_3771.method_25();
         this.method_4423(false);
      }
      
      public function method_6173() : void
      {
         this.var_3771.addListeners();
         this.method_4423(true);
      }
      
      public function method_4423(param1:Boolean) : void
      {
         if(param1)
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{"saturation":1}});
            this.sellButton.method_543(16777215);
            this.sellButton.method_5741();
            this.sellButton.method_4169();
         }
         else
         {
            TweenMax.to(this,1,{"colorMatrixFilter":{"saturation":0}});
            this.sellButton.method_543(10066329);
            this.sellButton.method_2724();
            this.sellButton.method_4131();
         }
      }
      
      private function method_1133(param1:class_1042) : void
      {
         var _loc2_:int = int(param1.value);
         this.method_6322();
      }
      
      public function method_775(param1:int) : void
      {
         var _loc2_:* = null;
         this.var_118 = param1;
         this.method_1345(param1);
         this.var_3209.alpha = 1;
         if(!this.var_4981)
         {
            _loc2_ = class_88.getItem(this.var_3655).replace(/%VALUE%/,param1);
            if(this.pricetagTooltipKey != "")
            {
               class_94.getInstance().method_4247(this.var_1291);
               class_94.getInstance().method_4247(this.var_3209);
               class_94.getInstance().method_1211(this.var_1291,class_88.getItem(this.pricetagTooltipKey).replace(/%VALUE%/,param1));
               class_94.getInstance().method_1211(this.var_3209,class_88.getItem(this.pricetagTooltipKey).replace(/%VALUE%/,param1));
            }
         }
         else
         {
            this.var_688[1] = this.var_118;
            if(param1 == -1)
            {
               this.method_2875();
               class_94.getInstance().method_4247(this.var_1291);
               class_94.getInstance().method_4247(this.var_3209);
               if(this.var_2763 != "")
               {
                  class_94.getInstance().method_1211(this.var_1291,class_88.getItem(this.var_2763).replace(/%VALUE%/,param1));
                  class_94.getInstance().method_1211(this.var_3209,class_88.getItem(this.var_2763).replace(/%VALUE%/,param1));
               }
               this.var_3209.alpha = 0.5;
               _loc2_ = "";
            }
            else
            {
               this.method_6173();
               _loc2_ = class_88.getItem(this.var_3655).replace(/%VALUE_OUTPUT%/,this.var_688[0]).replace(/%VALUE_INPUT%/,this.var_688[1]);
               if(this.pricetagTooltipKey != "")
               {
                  class_94.getInstance().method_4247(this.var_1291);
                  class_94.getInstance().method_4247(this.var_3209);
                  class_94.getInstance().method_1211(this.var_1291,class_88.getItem(this.pricetagTooltipKey).replace(/%VALUE_OUTPUT%/,this.var_688[0]).replace(/%VALUE_INPUT%/,this.var_688[1]));
                  class_94.getInstance().method_1211(this.var_3209,class_88.getItem(this.pricetagTooltipKey).replace(/%VALUE_OUTPUT%/,this.var_688[0]).replace(/%VALUE_INPUT%/,this.var_688[1]));
               }
               this.var_3771.method_3523(!!this.var_4981 ? int(this.var_688[1]) : 1);
            }
         }
         this.var_1291.text = "";
         this.var_1291.autoSize = TextFieldAutoSize.NONE;
         this.var_1291.width = this.var_660;
         this.var_1291.x = this.var_3431;
         class_122.method_2867(_loc2_,this.var_1291,TextFieldAutoSize.CENTER);
      }
      
      public function method_1345(param1:int) : void
      {
         if(param1 < 0)
         {
            if(!this.var_4981)
            {
               this.sellButton.visible = false;
               this.var_3771.visible = false;
               this.var_3771.method_25();
            }
            else
            {
               this.sellButton.visible = true;
               this.var_3771.visible = true;
               this.var_3771.addListeners();
            }
         }
         else
         {
            this.sellButton.visible = true;
            this.var_3771.visible = true;
            this.var_3771.addListeners();
         }
      }
      
      public function method_4016(param1:int) : void
      {
         if(this.var_118 > 0 || Boolean(this.var_4981))
         {
            this.var_3771.method_5215(param1,this.var_118);
         }
         this.method_6322();
      }
      
      private function method_6322() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this.var_4981) && int(this.var_688[1]) > 0)
         {
            _loc1_ = int(this.var_3771.getValue());
            _loc2_ = int(this.method_4121(Number(this.var_3771.getValue()) / int(this.var_688[1])));
            _loc3_ = class_88.getItem(this.var_2072).replace(/%VALUE%/,class_122.method_98(_loc2_));
            this.var_1318.text = "";
            this.var_1318.autoSize = TextFieldAutoSize.NONE;
            this.var_1318.width = this.var_4373;
            this.var_1318.x = this.var_4598;
            class_122.method_2867(_loc3_,this.var_1318,TextFieldAutoSize.CENTER);
            if(this.gaintagTooltipKey != "")
            {
               class_94.getInstance().method_4247(this.var_1318);
               if(_loc2_ > 0)
               {
                  class_94.getInstance().method_1211(this.var_1318,class_88.getItem(this.gaintagTooltipKey).replace(/%VALUE_OUTPUT%/,_loc2_).replace(/%VALUE_INPUT%/,_loc1_));
               }
            }
            return;
         }
         if(Boolean(this.var_688) && int(this.var_688[1]) < 0)
         {
            this.var_1318.text = "";
            class_94.getInstance().method_4247(this.var_1318);
         }
         if(this.var_118 > 0)
         {
            _loc1_ = int(this.var_3771.getValue());
            _loc2_ = Number(this.var_118) * Number(this.var_3771.getValue());
            _loc3_ = class_88.getItem(this.var_2072).replace(/%VALUE%/,class_122.method_98(_loc2_));
            this.var_1318.text = "";
            this.var_1318.autoSize = TextFieldAutoSize.NONE;
            this.var_1318.width = this.var_4373;
            this.var_1318.x = this.var_4598;
            class_122.method_2867(_loc3_,this.var_1318,TextFieldAutoSize.CENTER);
            if(this.gaintagTooltipKey != "")
            {
               class_94.getInstance().method_4247(this.var_1318);
               if(_loc2_ > 0)
               {
                  class_94.getInstance().method_1211(this.var_1318,class_88.getItem(this.gaintagTooltipKey).replace(/%VALUE_OUTPUT%/,_loc2_).replace(/%VALUE_INPUT%/,_loc1_));
               }
            }
         }
      }
      
      private function method_4121(param1:Number) : int
      {
         if(param1 % 1 == 0)
         {
            return param1;
         }
         return Math.floor(param1);
      }
      
      private function method_6369(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.var_3771.getValue());
         if(_loc2_ < 1)
         {
            return;
         }
         var _loc3_:class_476 = new class_476();
         _loc3_.var_4592.var_4809.var_2008 = this.type;
         _loc3_.var_4592.count = _loc2_;
         this.guiManager.method_6185().method_6154().sendRequest(_loc3_);
      }
      
      private function method_213(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.var_3771.getValue());
         if(_loc2_ < 1)
         {
            return;
         }
         this.guiManager.method_6185().method_6154().sendCommand(class_74.const_1900,[_loc2_]);
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function method_4151() : MovieClip
      {
         return this.var_4472;
      }
      
      public function cleanup() : void
      {
         if(this.sellButton != null)
         {
            if(this.type == class_163.PALLADIUM)
            {
               this.sellButton.removeEventListener(MouseEvent.CLICK,this.method_6369);
            }
            else
            {
               this.sellButton.removeEventListener(MouseEvent.CLICK,this.method_213);
            }
         }
         if(this.var_3771 != null)
         {
            this.var_3771.method_25();
            this.var_3771.removeEventListener(class_1042.CHANGE,this.method_1133);
         }
      }
   }
}
