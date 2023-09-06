package package_349
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.display.BlendMode;
   import flash.display.GradientType;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import net.bigpoint.darkorbit.class_18;
   
   public class class_1972 extends Sprite
   {
      
      private static const const_201:Array = [new GlowFilter(16763904,1,3,3,10,3)];
       
      
      private var var_4675:TextField;
      
      private var _gradient:Shape;
      
      private var var_1517:TimelineMax;
      
      public function class_1972()
      {
         this._gradient = new Shape();
         super();
         visible = false;
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      private function setup() : void
      {
         this.var_4675 = new TextField();
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.font = class_18.const_2241;
         _loc1_.italic = true;
         _loc1_.bold = true;
         _loc1_.color = 16763904;
         _loc1_.size = 72;
         this.var_4675.embedFonts = class_18.var_3994;
         this.var_4675.defaultTextFormat = _loc1_;
         this.var_4675.antiAliasType = AntiAliasType.ADVANCED;
         this.var_4675.autoSize = TextFieldAutoSize.LEFT;
         this.var_4675.blendMode = BlendMode.ALPHA;
         this.var_4675.selectable = false;
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(800,100,0);
         this._gradient.graphics.beginGradientFill(GradientType.LINEAR,[16772459,16213011],[1,1],[0,255],_loc2_);
         this._gradient.graphics.drawRect(0,0,1,100);
         this._gradient.blendMode = BlendMode.LAYER;
         filters = const_201;
         addChild(this._gradient);
         addChild(this.var_4675);
         cacheAsBitmap = true;
         this.var_1517 = new TimelineMax();
         this.var_1517.append(TweenLite.to(this,0.3,{"glowFilter":{
            "blurX":30,
            "blurY":30,
            "strength":0.1
         }}));
      }
      
      public function method_567(param1:String) : void
      {
         if(!this.var_4675)
         {
            this.setup();
         }
         TweenLite.killTweensOf(this,true,{
            "autoAlpha":true,
            "transformAroundCenter":true,
            "scaleX":true,
            "scaleY":true
         });
         this.var_4675.text = param1;
         this._gradient.width = this.var_4675.width;
         this._gradient.height = this.var_4675.height;
         scaleY = 1;
         scaleX = 1;
         TweenLite.to(this,0.3,{"autoAlpha":1});
         this.var_1517.restart();
      }
      
      public function method_3536() : void
      {
         if(parent)
         {
            if(!this.var_4675)
            {
               this.setup();
            }
            TweenLite.to(this,0.5,{
               "autoAlpha":0,
               "transformAroundCenter":{
                  "scaleX":3,
                  "scaleY":3
               },
               "ease":Back.easeInOut
            });
         }
      }
   }
}
