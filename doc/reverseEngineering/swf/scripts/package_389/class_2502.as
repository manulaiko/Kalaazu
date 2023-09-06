package package_389
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Quart;
   import com.greensock.easing.Sine;
   import flash.display.Bitmap;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.image.ImageSlideShow;
   import net.bigpoint.darkorbit.fui.components.image.ImageSlideShowElement;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.fui.system.utils.GhostTyperEffect;
   import package_38.class_595;
   import package_388.class_2256;
   import package_392.class_2265;
   import package_448.class_2514;
   import package_76.class_1110;
   
   public class class_2502 extends Sprite
   {
      
      public static const const_1582:String = "closeAnimationFinished";
      
      public static const const_1206:String = "fadeToExtendedViewFinished";
      
      public static const const_127:String = "openURL";
      
      public static const const_3159:String = "closeButtonClicked";
      
      public static const const_2587:String = "confirmation01Clicked";
      
      public static const const_2175:String = "confirmation02Clicked";
      
      private static const const_3048:int = 6;
      
      private static const const_365:int = 6;
      
      private static const const_2431:Number = 54;
      
      private static const const_1261:Number = 74;
      
      private static const const_79:Number = 8;
      
      private static const const_1453:Number = 592;
      
      private static const const_1701:Number = 34;
      
      private static const const_1102:Number = 479;
       
      
      private var var_3202:Coreponent;
      
      private var _title:String;
      
      private var var_641:uint;
      
      private var var_1592:Container;
      
      private var var_745:Coreponent;
      
      private var var_4113:Coreponent;
      
      private var var_8:Coreponent;
      
      private var var_3015:Label;
      
      private var var_4885:Button;
      
      private var var_4627:Coreponent;
      
      private var var_2070:Coreponent;
      
      private var var_516:Number = 12;
      
      private var var_4883:GhostTyperEffect;
      
      private var var_4855:Number;
      
      private var var_2997:Number;
      
      private var window:Coreponent;
      
      private var var_2166:Coreponent;
      
      private var var_3072:Coreponent;
      
      private var closeButton:Button;
      
      private var contentContainer:Sprite;
      
      private var characterContainer:Coreponent;
      
      private var var_4075:Coreponent;
      
      private var name_7:Bitmap;
      
      private var var_3840:Bitmap;
      
      private var var_1962:Container;
      
      private var scrollContainer:ScrollContainer;
      
      private var var_2580:Label;
      
      private var var_4313:Label;
      
      private var windowHeaderLabel:Label;
      
      private var windowHeaderBackground:Coreponent;
      
      private var scrollbar:Scrollbar;
      
      private var slider:Button;
      
      private var imageSlideShow:ImageSlideShow;
      
      private var confirmationButton01:Button;
      
      private var confirmationButton02:Button;
      
      private var var_2944:Number;
      
      private var var_1771:Number;
      
      private var var_1973:Number = 0.3;
      
      private var var_1486:Number = 0.3;
      
      public function class_2502()
      {
         super();
      }
      
      public function build(param1:XML) : void
      {
         UISystem.getInstance().build(param1,this);
         this.var_3202 = this.getChildByName("hintDialogView") as Coreponent;
         this.var_3202.mouseEnabled = false;
         this.mouseEnabled = false;
         this.method_1233();
         this.method_6001();
      }
      
      override public function get width() : Number
      {
         return this.var_3202.width;
      }
      
      override public function get height() : Number
      {
         return this.var_3202.height;
      }
      
      private function method_1233() : void
      {
         this.var_1592 = this.var_3202.getChildByName("minibar") as Container;
         this.var_745 = this.var_1592.getChildByName("background") as Coreponent;
         this.var_3015 = this.var_1592.getChildByName("infoLabel") as Label;
         this.var_3015.mouseChildren = false;
         this.var_3015.mouseEnabled = false;
         this.var_3015.useHTML = class_2256.const_2339;
         this.var_4883 = new GhostTyperEffect();
         this.var_4113 = this.var_1592.getChildByName("infoIcon") as Coreponent;
         this.var_8 = this.var_1592.getChildByName("infoIconbackground") as Coreponent;
         this.var_4885 = this.var_1592.getChildByName("closeButton") as Button;
         this.var_4885.addEventListener(MouseEvent.CLICK,this.method_6175);
         this.var_4885.addEventListener(MouseEvent.MOUSE_OVER,this.method_4702);
         this.var_4885.addEventListener(MouseEvent.MOUSE_OUT,this.method_6122);
         this.method_3100();
         this.var_1592.buttonMode = true;
         this.var_4627 = this.var_1592.getChildByName("borderTR") as Coreponent;
         this.var_2070 = this.var_1592.getChildByName("borderBR") as Coreponent;
         this.var_4855 = this.var_3015.marginLeft + 10;
         this.var_2997 = this.var_3015.marginLeft;
      }
      
      private function method_3100() : void
      {
         this.var_1592.addEventListener(MouseEvent.CLICK,this.method_3149);
         this.var_1592.addEventListener(MouseEvent.MOUSE_OUT,this.method_2370);
         this.var_1592.addEventListener(MouseEvent.MOUSE_OVER,this.method_5825);
      }
      
      private function method_1168() : void
      {
         this.var_1592.removeEventListener(MouseEvent.CLICK,this.method_3149);
         this.var_1592.removeEventListener(MouseEvent.MOUSE_OUT,this.method_2370);
         this.var_1592.removeEventListener(MouseEvent.MOUSE_OVER,this.method_5825);
      }
      
      private function method_3149(param1:MouseEvent) : void
      {
         this.method_691(this.var_1592,false);
         this.method_4507();
      }
      
      private function method_2370(param1:MouseEvent) : void
      {
         TweenMax.to(this.var_1592,0.3,{"colorMatrixFilter":{
            "amount":1,
            "contrast":1,
            "brightness":1,
            "saturation":1
         }});
      }
      
      private function method_5825(param1:MouseEvent) : void
      {
         TweenMax.to(this.var_1592,0.3,{"colorMatrixFilter":{
            "amount":1.7,
            "contrast":1.8,
            "brightness":1.5,
            "saturation":1.5
         }});
      }
      
      private function method_6175(param1:MouseEvent) : void
      {
         this.method_3692();
      }
      
      private function method_4702(param1:MouseEvent) : void
      {
         this.method_1168();
      }
      
      private function method_6122(param1:MouseEvent) : void
      {
         this.method_3100();
      }
      
      private function method_6001() : void
      {
         this.window = this.var_3202.getChildByName("hintWindow") as Coreponent;
         this.window.alpha = 0;
         this.var_3072 = this.window.getChildByName("iconBackground") as Coreponent;
         this.var_2166 = this.window.getChildByName("windowContainer") as Coreponent;
         this.closeButton = this.window.getChildByName("closeButton") as Button;
         if(this.closeButton)
         {
            this.closeButton.addEventListener(MouseEvent.CLICK,this.method_234);
         }
         this.contentContainer = this.window.getChildByName("contentContainer") as Sprite;
         var _loc1_:Sprite = this.contentContainer.getChildByName("confirmationContainer") as Sprite;
         this.confirmationButton01 = _loc1_.getChildByName("confirmationButton01") as Button;
         this.confirmationButton02 = _loc1_.getChildByName("confirmationButton02") as Button;
         if(this.confirmationButton01)
         {
            this.confirmationButton01.addEventListener(MouseEvent.CLICK,this.method_5420);
         }
         if(this.confirmationButton02)
         {
            this.confirmationButton02.addEventListener(MouseEvent.CLICK,this.method_3788);
         }
         var _loc2_:Coreponent = this.contentContainer.getChildByName("messageContainer") as Coreponent;
         this.characterContainer = _loc2_.getChildByName("characterContainer") as Coreponent;
         this.var_4075 = _loc2_.getChildByName("characterBackground") as Coreponent;
         this.var_1962 = _loc2_.getChildByName("textBoxContainer") as Container;
         this.var_2580 = this.var_1962.getChildByName("header") as Label;
         this.scrollContainer = this.var_1962.getChildByName("scrollContainer") as ScrollContainer;
         this.scrollbar = this.var_1962.getChildByName("scrollbar") as Scrollbar;
         this.slider = this.scrollbar.getChildByName("buttonSlider") as Button;
         this.var_4313 = this.scrollContainer.content as Label;
         this.var_4313.useHTML = class_2256.const_1793;
         this.windowHeaderLabel = this.window.getChildByName("windowHeaderLabel") as Label;
         this.windowHeaderLabel.useHTML = class_2256.const_2339;
         this.var_2944 = this.windowHeaderLabel.marginLeft + 10;
         this.var_1771 = this.windowHeaderLabel.marginLeft;
         this.windowHeaderBackground = this.window.getChildByName("windowHeaderBackground") as Coreponent;
         this.scrollbar.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED,this.handleScrollbarPositionChangeEvent);
         this.scrollContainer.addEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED,this.method_936);
         this.scrollContainer.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleScrollContainerMouseWheelEvent);
         this.scrollContainer.mouseEnabled = true;
         var _loc3_:Container = this.contentContainer.getChildByName("slideShowContainer") as Container;
         if(_loc3_)
         {
            _loc3_.mouseEnabled = false;
            _loc3_.mouseChildren = false;
            this.imageSlideShow = _loc3_.getChildByName("imageSlideShow") as ImageSlideShow;
         }
      }
      
      private function method_5420(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(class_2502.const_2587));
      }
      
      private function method_3788(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(class_2502.const_2175));
      }
      
      protected function handleScrollbarPositionChangeEvent(param1:ScrollEvent) : void
      {
         var _loc2_:Number = Number(this.scrollbar.getScrollPositionInPercent());
         this.scrollContainer.setScrollPositionInPercent(_loc2_);
      }
      
      protected function method_936(param1:ScrollEvent) : void
      {
         this.scrollbar.updateBySizes(param1.viewSize,param1.contentSize);
      }
      
      private function handleScrollContainerMouseWheelEvent(param1:MouseEvent) : void
      {
         this.scrollbar.updateScrollPositionByScrollDelta(param1.delta);
      }
      
      protected function method_234(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(const_3159));
      }
      
      protected function method_4212(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(const_127));
      }
      
      public function method_1140() : void
      {
         if(this.imageSlideShow)
         {
            this.imageSlideShow.dispose();
         }
         this.method_331();
      }
      
      protected function method_4507() : void
      {
         this.method_691(this.var_1592,false);
         TweenLite.killDelayedCallsTo(this.method_3692);
         this.window.height = const_1701;
         this.window.alpha = 0;
         this.windowHeaderBackground.alpha = 0;
         TweenLite.to(this.var_1592,this.var_1486 + 0.1,{
            "width":const_1453,
            "height":const_1701,
            "marginTop":const_79,
            "ease":Sine.easeInOut,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_1592,false],
            "onComplete":this.method_5645
         });
         TweenLite.to(this.var_4113,this.var_1486,{
            "x":-7,
            "y":-2,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_3015,false]
         });
         TweenLite.to(this.var_3015,this.var_1486,{
            "alpha":0,
            "marginLeft":52,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_3015,false]
         });
         TweenLite.to(this.var_4627,this.var_1486,{
            "alpha":0,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_4627,false]
         });
         TweenLite.to(this.var_2070,this.var_1486,{
            "alpha":0,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_2070,false]
         });
         TweenLite.to(this.var_4885,this.var_1486,{
            "alpha":0,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_4885,false]
         });
      }
      
      protected function method_1000() : void
      {
         TweenLite.killTweensOf(this.var_3015);
         this.method_5645();
      }
      
      protected function method_5645() : void
      {
         var _loc1_:Number = Number(this.var_1973) * 0.15;
         TweenLite.to(this.var_4113,this.var_1973,{"alpha":0});
         TweenLite.to(this.var_1592,this.var_1973,{"autoAlpha":0});
         this.var_2166.alpha = 0;
         this.window.alpha = 0.3;
         this.contentContainer.alpha = 0;
         TweenLite.to(this.var_2166,this.var_1973,{
            "alpha":1,
            "delay":_loc1_
         });
         TweenLite.to(this.windowHeaderBackground,this.var_1973,{"alpha":1});
         TweenLite.to(this.window,this.var_1973 + 0.1,{
            "alpha":1,
            "height":const_1102,
            "ease":Sine.easeInOut,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.window,true],
            "onComplete":this.method_2969
         });
      }
      
      protected function method_2969() : void
      {
         dispatchEvent(new Event(const_1206));
         TweenLite.to(this.contentContainer,this.var_1973,{"alpha":1});
         this.method_1681();
      }
      
      private function method_6183(param1:Coreponent, param2:Boolean) : void
      {
         param1.forceRedraws([InvalidationType.POSITION,InvalidationType.SIZE],param2);
      }
      
      protected function method_691(param1:Sprite, param2:Boolean) : void
      {
         param1.mouseEnabled = param2;
         param1.mouseChildren = param2;
      }
      
      public function show(param1:uint) : void
      {
         this.var_1592.alpha = 0;
         this.method_691(this.var_1592,false);
         this.window.alpha = 0;
         this.method_691(this.window,false);
         switch(param1)
         {
            case class_595.const_2867:
               this.method_1045();
               break;
            case class_595.OPEN:
               this.method_1681();
         }
      }
      
      public function method_1681() : void
      {
         this.var_641 = class_595.OPEN;
         this.method_691(this.var_1592,false);
         this.method_691(this.window,true);
         this.window.visible = true;
         TweenLite.to(this.window,0.4,{"alpha":1});
      }
      
      public function method_1045() : void
      {
         this.var_641 = class_595.const_2867;
         TweenLite.killDelayedCallsTo(this.method_3692);
         TweenLite.delayedCall(this.var_516,this.method_3692);
         this.method_691(this.var_1592,true);
         this.method_691(this.window,false);
         this.var_1592.visible = true;
         this.var_1592.marginTop = const_1261;
         TweenLite.to(this.var_1592,0.5,{
            "alpha":1,
            "marginTop":const_2431
         });
         TweenMax.to(this.var_3015,1,{
            "repeat":-1,
            "yoyo":true,
            "glowFilter":{
               "color":15459009,
               "alpha":1,
               "blurX":20,
               "blurY":20
            }
         });
      }
      
      protected function method_3692() : void
      {
         TweenLite.killDelayedCallsTo(this.method_3692);
         this.method_691(this.var_1592,false);
         this.method_691(this.window,false);
         dispatchEvent(new Event(const_3159));
      }
      
      public function update(param1:class_2265, param2:Boolean = true) : void
      {
         var _loc3_:class_2514 = param1.content;
         this._title = _loc3_.title;
         this.var_2580.text = _loc3_.title;
         var _loc4_:String = class_1110.method_2482(_loc3_.message,class_2256.const_1764);
         this.var_4313.text = _loc4_;
         if(param2)
         {
            this.method_6241();
         }
      }
      
      public function method_4739(param1:Bitmap) : void
      {
         if(this.characterContainer == null)
         {
            return;
         }
         if(this.name_7)
         {
            this.characterContainer.removeChild(this.name_7);
         }
         this.name_7 = param1;
         this.characterContainer.addChild(this.name_7);
      }
      
      public function method_6373(param1:Bitmap) : void
      {
         if(this.var_4075 == null)
         {
            return;
         }
         if(this.var_3840)
         {
            this.method_331();
            this.var_4075.removeChild(this.var_3840);
         }
         this.var_3840 = param1;
         this.var_3840.scaleX = 0.99;
         this.var_3840.smoothing = true;
         this.var_3840.pixelSnapping = PixelSnapping.NEVER;
         this.var_4075.addChild(this.var_3840);
         this.method_6532();
      }
      
      public function method_5123(param1:Vector.<ImageSlideShowElement>, param2:Boolean = true, param3:Boolean = true) : void
      {
         this.imageSlideShow.playlist = param1;
         this.imageSlideShow.repeat = param2;
         if(param3)
         {
            this.imageSlideShow.start();
         }
      }
      
      protected function method_6532() : void
      {
         var _loc1_:Number = Number(this.var_3840.width) - Number(this.var_4075.width);
         this.var_3840.x = 0;
         TweenMax.to(this.var_3840,24,{
            "x":-_loc1_,
            "yoyo":true,
            "repeat":-1,
            "ease":Sine.easeInOut
         });
         var _loc2_:Number = Number(this.var_3840.height) - Number(this.var_4075.height);
         this.var_3840.y = 0;
         TweenMax.to(this.var_3840,24,{
            "y":-_loc2_,
            "yoyo":true,
            "repeat":-1,
            "ease":Sine.easeInOut
         });
      }
      
      protected function method_331() : void
      {
         TweenLite.killTweensOf(this.var_3840);
      }
      
      protected function method_5239() : void
      {
         TweenLite.killDelayedCallsTo(this.method_295);
         TweenLite.delayedCall(1.5,this.method_295);
      }
      
      protected function method_6241() : void
      {
         var _loc1_:String = class_88.getItem("gameentry_hintwindow_tip");
         this.var_3015.text = "";
         this.windowHeaderLabel.text = "";
         this.var_4883.updateInterval = 50;
         this.var_4883.stop();
         this.var_4883.text = _loc1_;
         this.var_4883.htmlColor = "#" + class_2256.const_2421.toString(16);
         this.var_4883.htmlColorRandom = "#" + class_2256.const_343.toString(16);
         this.var_4883.useHtml = class_2256.const_2339;
         this.var_4883.updateTargets = [{
            "target":this.var_3015,
            "property":"text"
         },{
            "target":this.windowHeaderLabel,
            "property":"text"
         }];
         this.var_4883.start();
         this.var_4883.start(this.method_5239);
      }
      
      protected function method_295() : void
      {
         this.var_3015.text = "";
         this.windowHeaderLabel.text = "";
         this.var_4883.text = this._title;
         this.var_4883.start();
      }
      
      protected function method_4743() : Point
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         switch(this.var_641)
         {
            case class_595.const_2867:
               _loc1_ = Number(this.var_1592.getExplicitX());
               _loc2_ = Number(this.var_1592.getExplicitY());
               break;
            case class_595.OPEN:
               _loc1_ = this.window.getExplicitX() + this.var_3072.getExplicitX();
               _loc2_ = this.window.getExplicitY() + this.var_3072.getExplicitY();
         }
         return new Point(_loc1_,_loc2_);
      }
      
      protected function dispose() : void
      {
         dispatchEvent(new Event(class_2502.const_1582));
         this.var_4883.dispose();
         this.var_3202.dispose();
      }
      
      public function method_2246(param1:Point) : void
      {
         switch(this.var_641)
         {
            case class_595.const_2867:
               this.method_3922(param1);
               break;
            case class_595.OPEN:
               this.method_3443(param1);
         }
      }
      
      protected function method_3922(param1:Point) : void
      {
         TweenLite.to(this.var_3015,0.4,{
            "autoAlpha":0,
            "y":-20
         });
         TweenLite.to(this.var_745,0.4,{
            "autoAlpha":0,
            "y":-20
         });
         TweenLite.to(this.var_4885,0.4,{
            "autoAlpha":0,
            "y":-20
         });
         TweenLite.to(this.var_8,0.4,{
            "autoAlpha":0,
            "y":-20,
            "onComplete":this.method_5050,
            "onCompleteParams":[param1,-8,-6]
         });
         TweenLite.to(this.var_4627,0.4,{
            "alpha":0,
            "x":this.var_4627.x + 12,
            "y":Number(this.var_4627.y) - 12,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_4627,false]
         });
         TweenLite.to(this.var_2070,0.4,{
            "alpha":0,
            "x":this.var_4627.x + 12,
            "y":this.var_4627.y + 12,
            "onUpdate":this.method_6183,
            "onUpdateParams":[this.var_2070,false]
         });
      }
      
      protected function method_3443(param1:Point) : void
      {
         TweenLite.to(this.contentContainer,0.25,{
            "autoAlpha":0,
            "onComplete":this.method_5050,
            "onCompleteParams":[param1,const_3048,const_365]
         });
         TweenLite.to(this.closeButton,0.25,{"autoAlpha":0});
         TweenLite.to(this.windowHeaderBackground,0.25,{"autoAlpha":0});
         TweenLite.to(this.var_2166,0.25,{"autoAlpha":0});
         TweenLite.to(this.windowHeaderLabel,0.25,{"autoAlpha":0});
      }
      
      protected function method_5050(param1:Point, param2:Number = 0, param3:Number = 0) : void
      {
         var _loc4_:Point = this.method_4743();
         _loc4_.x += param2;
         _loc4_.y += param3;
         var _loc5_:int = int(param1.x - _loc4_.x);
         var _loc6_:int = int(param1.y - _loc4_.y);
         TweenLite.to(this,0.5,{
            "x":_loc5_,
            "y":_loc6_,
            "delay":0.2,
            "onComplete":this.dispose,
            "ease":Quart.easeIn
         });
         TweenLite.to(this.var_3072,0.45,{
            "autoAlpha":0,
            "delay":0.2
         });
      }
   }
}
