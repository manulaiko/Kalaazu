package package_287
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.map.class_87;
   import package_195.class_1203;
   import package_22.class_198;
   import package_75.class_349;
   
   public class class_1735 extends class_1203
   {
      
      private static const const_2012:Array = [new GlowFilter(0,1,2,2,50,3)];
      
      private static const TEXTFIELD:TextField = new TextField();
      
      private static const TEXTFORMAT:TextFormat = new TextFormat(!true ? "Tahoma" : null,24,0,true);
       
      
      private var _effect:class_349;
      
      private var _bitmapData:BitmapData;
      
      private var var_444:Bitmap;
      
      public function class_1735(param1:class_87, param2:class_349)
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         super(param1,param2.source.position);
         this._effect = param2;
         var _loc3_:int = int(class_198.var_3139[param2.method_390]);
         _loc4_ = TEXTFIELD;
         var _loc5_:TextFormat;
         (_loc5_ = TEXTFORMAT).color = _loc3_;
         if(param2.method_5516 > 0)
         {
            _loc6_ = "";
            if(param2.method_515)
            {
               _loc6_ = "+";
            }
            _loc4_.text = _loc6_ + class_122.method_98(param2.method_5516);
         }
         else if(param2.method_5516 == 0)
         {
            if(param2.method_4902)
            {
               _loc4_.text = class_88.getItem("shot_miss");
            }
            else
            {
               _loc4_.text = "0";
            }
         }
         else
         {
            _loc4_.text = class_88.getItem("shot_hit");
         }
         _loc4_.setTextFormat(_loc5_);
         _loc4_.filters = const_2012;
         _loc4_.autoSize = TextFieldAutoSize.LEFT;
         this._bitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         this._bitmapData.draw(_loc4_);
         this.var_444 = new Bitmap(this._bitmapData);
         this.var_444.scaleX = 0.3;
         this.var_444.scaleY = 0.3;
         addChild(this.var_444);
         TweenLite.to(this.var_444,1,{
            "y":Number(this.var_444.y) - 100,
            "scaleX":1,
            "scaleY":1,
            "x":-Number(this.var_444.width)
         });
         TweenLite.to(this.var_444,1,{
            "delay":0.5,
            "alpha":0,
            "onComplete":this.disposeView
         });
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(this.var_444);
         TweenLite.killDelayedCallsTo(this.var_444);
         this._bitmapData.dispose();
         super.disposeView(param1);
      }
   }
}
