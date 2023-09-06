package package_381
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Expo;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.SpreadMethod;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_369.class_2117;
   import package_436.PlaneGeometry;
   import package_75.class_1856;
   
   public class class_2198 implements IDisposable
   {
      
      private static const const_722:PlaneGeometry = new PlaneGeometry(1,1,1,1);
      
      private static var var_3450:class_2117;
       
      
      private const TYPE:String = "radial";
      
      private const const_1529:Array = [0,1,0];
      
      private const const_1462:Array = [0,220,255];
      
      private const const_1123:Array = [4473924,16777215,13672553];
      
      private var _effect:class_1856;
      
      private var var_1811:Number = 80;
      
      private var var_484:Number = 0.6;
      
      private var var_126:Number = 1024;
      
      private var var_1333:class_2114;
      
      private var var_642:class_1776;
      
      public function class_2198(param1:class_1211, param2:class_1856)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         super();
         this._effect = param2;
         if(var_3450 == null)
         {
            _loc5_ = (_loc4_ = new Shape()).graphics;
            (_loc6_ = new Matrix()).createGradientBox(Number(this.var_126) << 1,Number(this.var_126) << 1,0,-Number(this.var_126),-Number(this.var_126));
            _loc5_.beginGradientFill("radial",this.const_1123,this.const_1529,this.const_1462,_loc6_,SpreadMethod.PAD);
            _loc5_.drawCircle(0,0,this.var_126);
            _loc5_.endFill();
            _loc7_ = _loc4_.getBounds(_loc4_);
            (_loc8_ = new BitmapData(_loc4_.width,_loc4_.height,true,0)).draw(_loc4_,new Matrix(1,0,0,1,-_loc7_.x,-_loc7_.y));
            var_3450 = new class_2117(_loc8_);
         }
         this.var_642 = new class_1776(var_3450);
         var _loc3_:ColorTransform = new ColorTransform(this.red,this.green,this.blue);
         this.var_642.colorTransform = _loc3_;
         this.var_1333 = new class_2114(const_722,this.var_642);
         class_1210.instance.method_3528.method_1616.addChild(this.var_1333);
         this.var_1333.moveTo(this._effect.position.x,this._effect.position.z,-Number(this._effect.position.y));
         this.play();
      }
      
      private function get red() : Number
      {
         return (Number(this._effect.method_5087) >> 16 & 255) / 255;
      }
      
      private function get green() : Number
      {
         return (Number(this._effect.method_5087) >> 8 & 255) / 255;
      }
      
      private function get blue() : Number
      {
         return (Number(this._effect.method_5087) & 255) / 255;
      }
      
      private function play() : void
      {
         this.var_642.alpha = this.var_484;
         this.var_1333.scaleX = this.var_1333.scaleZ = this.var_1811;
         if(this._effect.method_5290)
         {
            TweenMax.to(this.var_1333,this._effect.cycleTime,{
               "ease":Expo.easeOut,
               "scaleX":this._effect.method_5815,
               "scaleZ":this._effect.method_5815,
               "onComplete":this.method_901
            });
            TweenMax.to(this.var_642,this._effect.cycleTime,{
               "ease":Expo.easeOut,
               "alpha":0
            });
         }
         else
         {
            TweenLite.to(this.var_1333,this._effect.cycleTime,{
               "scaleX":this._effect.method_5815,
               "scaleZ":this._effect.method_5815,
               "onComplete":this.method_901
            });
            TweenMax.to(this.var_642,this._effect.cycleTime,{"alpha":0});
         }
      }
      
      private function method_901() : void
      {
         this.play();
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(this.var_1333);
         TweenLite.killTweensOf(this.var_642);
         if(this.var_1333.parent)
         {
            this.var_1333.parent.removeChild(this.var_1333);
         }
      }
   }
}
