package package_426
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_359.class_2364;
   
   public class class_2371 extends Sprite implements class_2366, class_80, IDisposable
   {
       
      
      private var var_2385:Number;
      
      private var var_4192:Number;
      
      private var var_4939:uint;
      
      private var var_127:class_2082;
      
      private var var_98:Number;
      
      private var _target:MovieClip;
      
      private var _data:Object;
      
      public function class_2371()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         this.var_127 = param2;
         this._data = param3;
         this.var_2385 = Math.random() * 10;
         this.var_4192 = Math.random() * 10;
         this.var_4939 = this.method_6413();
         var _loc4_:class_2364;
         if(_loc4_ = class_2364(this.var_127.method_4434(String(this._data.xml.@target))))
         {
            this._target = _loc4_.asset as MovieClip;
            if(this._target)
            {
               this.var_98 = this._target.y;
               this.method_5381();
            }
         }
         else
         {
            TweenLite.killTweensOf(this._target);
            this._target = null;
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc4_:Number = 0;
         if(this._target == null)
         {
            return;
         }
         this.var_2385 += 0.1;
         this.var_4192 += 0.03;
         var _loc2_:Number = Math.cos(this.var_4192) * 1.5;
         var _loc3_:Number = Math.sin(this.var_2385) * 2.8;
         this._target.y = this.var_98 + _loc3_ - _loc2_;
         if(this.var_4939 > 0)
         {
            --this.var_4939;
         }
         else if(this.var_4939 == 0)
         {
            if(this._target.currentFrame == 1)
            {
               _loc4_ = 2;
               this.var_4939 = this.method_2080();
            }
            else if(this._target..currentFrame == 2)
            {
               _loc4_ = 1;
               this.var_4939 = this.method_6413();
            }
            this._target.gotoAndStop(_loc4_);
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this._target)
         {
            TweenLite.killTweensOf(this._target);
         }
      }
      
      private function method_5381() : void
      {
         TweenMax.to(this._target,0.2,{
            "delay":1 + Math.random() * 3,
            "colorMatrixFilter":{
               "amount":1.3,
               "contrast":1.7,
               "brightness":1.5
            },
            "onComplete":this.method_1799
         });
      }
      
      private function method_1799() : void
      {
         TweenMax.to(this._target,0.8,{
            "colorMatrixFilter":{
               "amount":1,
               "contrast":1,
               "brightness":1
            },
            "onComplete":this.method_5381
         });
      }
      
      private function method_6413() : uint
      {
         return 10 + uint(Math.random() * 120);
      }
      
      private function method_2080() : uint
      {
         return 3 + uint(Math.random() * 10);
      }
   }
}
