package package_333
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.video.VideoPlayer;
   import package_11.class_65;
   import package_239.class_2284;
   
   public class class_1843 extends Sprite
   {
      
      private static const const_2088:String = "_title";
      
      private static const const_2573:String = "_description";
       
      
      private var var_3223:Coreponent;
      
      private var var_4450:Coreponent;
      
      private var var_3553:Coreponent;
      
      private var var_4663:Coreponent;
      
      private var var_3495:Coreponent;
      
      private var var_984:Coreponent;
      
      private var var_246:VideoPlayer;
      
      private var var_2741:VideoPlayer;
      
      private var var_1758:VideoPlayer;
      
      private var var_2539:int;
      
      private var var_744:Array;
      
      private var var_3585:Number;
      
      private var var_4427:String;
      
      private var var_3764:String;
      
      public function class_1843(param1:String, param2:int)
      {
         super();
         this.var_4427 = param1;
         this.var_2539 = param2;
         this.var_744 = new Array();
         this.var_3585 = 0;
         this.var_3764 = "targeted_offer_" + this.var_4427.replace(/-[0-9]/,"");
         this.alpha = 0;
      }
      
      public function method_866() : void
      {
         this.var_3223 = this.getChildByName("windowContainer") as Coreponent;
         this.var_4450 = this.var_3223.getChildByName("imageBackgroundContainer") as Coreponent;
         this.var_3553 = this.var_3223.getChildByName("videoContainer") as Coreponent;
         this.var_3553.addEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_3553.buttonMode = true;
         this.var_2741 = this.var_3553.getChildByName("videoplayer") as VideoPlayer;
         this.var_2741.addEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_2741.buttonMode = true;
         this.var_2741.filters = [new GlowFilter(15637065),new DropShadowFilter(3,45,15637065)];
         this.var_246 = this.var_3553.getChildByName("videoplayer2") as VideoPlayer;
         this.var_246.addEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_246.buttonMode = true;
         this.var_246.filters = [new GlowFilter(15637065),new DropShadowFilter(3,45,15637065)];
         this.var_1758 = this.var_2741;
         this.var_4663 = this.var_3223.getChildByName("bottomTextContainer") as Coreponent;
         this.var_3495 = this.var_3223.getChildByName("topTextContainer") as Coreponent;
         this.var_984 = this.var_3553.getChildByName("percentageTextContainer") as Coreponent;
         dispatchEvent(new class_2284(class_2284.const_1942));
      }
      
      private function method_4113(param1:String) : void
      {
         this.var_1758.playURL(param1);
         this.var_1758.addEventListener(Event.ENTER_FRAME,this.method_5307);
      }
      
      private function method_5307(param1:Event) : void
      {
         this.var_1758.alpha = 1 - Math.pow(Number(this.var_1758.playbackProgressPercentage) - 0.5,2) * 4;
         if(this.var_1758.playbackProgressPercentage >= 0.99)
         {
            this.var_1758.removeEventListener(Event.ENTER_FRAME,this.method_5307);
            this.var_1758.stop();
            this.var_1758.alpha = 0;
            this.var_1758 = this.var_1758 == this.var_2741 ? this.var_246 : this.var_2741;
            this.method_2451();
         }
      }
      
      private function get method_1251() : int
      {
         ++this.var_3585;
         if(this.var_3585 > this.var_744.length - 1)
         {
            this.var_3585 = 0;
         }
         return this.var_3585;
      }
      
      private function method_2451() : void
      {
         var _loc1_:* = null;
         if(this.var_744)
         {
            _loc1_ = this.var_744[this.method_1251];
            this.method_4113(_loc1_);
         }
      }
      
      public function method_1528(param1:Array) : void
      {
         this.var_744 = param1;
      }
      
      private function method_4472(param1:MouseEvent) : void
      {
         dispatchEvent(new class_2284(class_2284.const_1407));
      }
      
      public function method_3983(param1:class_65 = null) : void
      {
         if(param1)
         {
            this.method_3340(param1.getBitmap());
         }
         this.var_4450.addEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_4450.buttonMode = true;
         this.method_2883();
         this.method_5891();
         this.method_4607();
         dispatchEvent(new class_2284(class_2284.const_1126));
         TweenLite.to(this,1,{"alpha":1});
         this.method_2451();
      }
      
      public function method_3340(param1:DisplayObject) : void
      {
         this.var_4450.addChild(param1);
         param1.cacheAsBitmap = true;
      }
      
      private function method_5891() : void
      {
         if(this.var_2539 <= 0)
         {
            return;
         }
         var _loc1_:* = this.var_2539 + "%";
         var _loc2_:GlowFilter = new GlowFilter(16771584,1,4,4,2,3);
         var _loc3_:DropShadowFilter = new DropShadowFilter(4,45,5046272,1,4,4,1,3);
         var _loc4_:TextFormat;
         (_loc4_ = new TextFormat(class_18.const_2241,class_18.const_151)).align = TextFormatAlign.RIGHT;
         _loc4_.color = 16761344;
         _loc4_.leading = 1;
         _loc4_.size = 36;
         var _loc5_:TextField;
         (_loc5_ = new TextField()).mouseEnabled = false;
         _loc5_.selectable = false;
         _loc5_.antiAliasType = AntiAliasType.ADVANCED;
         _loc5_.height = 5;
         _loc5_.width = this.var_984.width;
         _loc5_.embedFonts = class_18.var_4694;
         _loc5_.defaultTextFormat = _loc4_;
         _loc5_.filters = [_loc2_,_loc3_];
         _loc5_.multiline = true;
         _loc5_.wordWrap = true;
         _loc5_.text = _loc1_;
         _loc5_.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.rotation = -15;
         _loc5_.alpha = 0;
         this.var_984.addChild(_loc5_);
         TweenLite.to(_loc5_,0.25,{
            "alpha":1,
            "delay":0.5
         });
      }
      
      private function method_2883() : void
      {
         var _loc1_:String = class_88.getItem(this.var_3764 + const_2088);
         var _loc2_:GlowFilter = new GlowFilter(16733184,0.6,15,15,3,3);
         var _loc3_:DropShadowFilter = new DropShadowFilter(4,45,16733184);
         var _loc4_:TextFormat;
         (_loc4_ = new TextFormat(class_18.const_2753,class_18.const_662)).align = TextFormatAlign.CENTER;
         _loc4_.color = 16643792;
         _loc4_.size = 100;
         var _loc5_:TextField;
         (_loc5_ = new TextField()).mouseEnabled = false;
         _loc5_.selectable = false;
         _loc5_.antiAliasType = AntiAliasType.ADVANCED;
         _loc5_.height = this.var_3495.height;
         _loc5_.width = this.var_3495.width;
         _loc5_.embedFonts = class_18.var_4694;
         _loc5_.filters = [_loc2_,_loc3_];
         _loc5_.defaultTextFormat = _loc4_;
         _loc5_.text = _loc1_;
         _loc5_.alpha = 0;
         this.method_838(_loc5_);
         _loc5_.multiline = true;
         this.var_3495.addChild(_loc5_);
         TweenMax.to(_loc5_,1.5,{
            "glowFilter":{"strength":0},
            "dropShadowFilter":{"strength":0},
            "repeat":-1,
            "yoyo":true
         });
         TweenLite.to(_loc5_,0.25,{
            "alpha":1,
            "delay":0.5
         });
      }
      
      private function method_4607() : void
      {
         var _loc1_:String = class_88.getItem(this.var_3764 + const_2573);
         var _loc2_:GlowFilter = new GlowFilter(16777215,0.1,1,1,1,1);
         var _loc3_:TextFormat = new TextFormat(class_18.const_2753,class_18.const_662);
         _loc3_.align = TextFormatAlign.CENTER;
         _loc3_.color = 14011853;
         _loc3_.leading = 1;
         _loc3_.size = _loc1_.length < 150 ? 18 : 18 * (150 / _loc1_.length);
         var _loc6_:TextField;
         (_loc6_ = new TextField()).mouseEnabled = false;
         _loc6_.selectable = false;
         _loc6_.antiAliasType = AntiAliasType.ADVANCED;
         _loc6_.width = this.var_4663.width;
         _loc6_.embedFonts = class_18.var_4694;
         _loc6_.filters = [_loc2_];
         _loc6_.defaultTextFormat = _loc3_;
         _loc6_.multiline = true;
         _loc6_.wordWrap = true;
         _loc6_.text = _loc1_;
         _loc6_.autoSize = TextFieldAutoSize.CENTER;
         _loc6_.alpha = 0;
         this.var_4663.addChild(_loc6_);
         TweenLite.to(_loc6_,0.25,{
            "alpha":1,
            "delay":0.5
         });
      }
      
      private function method_838(param1:TextField) : void
      {
         var _loc2_:int = param1.width - 20;
         var _loc3_:int = param1.height;
         var _loc4_:TextFormat = param1.getTextFormat();
         while(param1.textWidth > _loc2_ || param1.textHeight > _loc3_)
         {
            _loc4_.size = int(_loc4_.size) - 1;
            param1.setTextFormat(_loc4_);
         }
      }
      
      public function cleanup() : void
      {
         this.var_4450.removeEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_2741.removeEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_246.removeEventListener(MouseEvent.CLICK,this.method_4472);
         this.var_3553.removeEventListener(MouseEvent.CLICK,this.method_4472);
         if(this.var_2741.hasEventListener(Event.ENTER_FRAME))
         {
            this.var_2741.removeEventListener(Event.ENTER_FRAME,this.method_5307);
         }
         if(this.var_246.hasEventListener(Event.ENTER_FRAME))
         {
            this.var_246.removeEventListener(Event.ENTER_FRAME,this.method_5307);
         }
         TweenLite.killTweensOf(this.var_2741);
         TweenLite.killTweensOf(this.var_246);
         this.var_2741.stop();
         this.var_246.stop();
         this.var_2741.dispose();
         this.var_246.dispose();
      }
      
      public function get method_5364() : String
      {
         return this.var_4427;
      }
   }
}
