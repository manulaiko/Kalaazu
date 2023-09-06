package package_381
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_27.class_82;
   import package_75.class_2352;
   import package_75.class_2353;
   import package_9.class_50;
   
   public class class_2203 implements IDisposable
   {
       
      
      private var var_3737:Rectangle;
      
      private var var_1331:Rectangle;
      
      private var var_1023:Number;
      
      private var var_3217:uint = 6;
      
      private var soundID:uint = 18;
      
      private var var_3288:Vector.<class_2353>;
      
      private var var_3625:class_50;
      
      private var _effect:class_2352;
      
      public function class_2203(param1:class_1211, param2:class_2352)
      {
         super();
         this._effect = param2;
         this.method_3715();
      }
      
      protected function method_3715() : void
      {
         this.var_3737 = this._effect.method_3288;
         this.var_1331 = this._effect.method_652;
         this.var_1023 = this._effect.method_5111;
         if(this.var_1331 == null)
         {
            this.var_1331 = new Rectangle(0,0,150,150);
         }
         if(this.var_1023 <= 0)
         {
            this.var_1023 = 5;
         }
         this.var_3625 = class_50.getInstance();
         this.method_30();
      }
      
      private function method_30() : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:* = 0;
         var _loc18_:* = null;
         var _loc19_:Number = NaN;
         this.var_3288 = new Vector.<class_2353>();
         var _loc1_:uint = uint(this.var_1331.width);
         var _loc2_:uint = uint(this.var_1331.height);
         var _loc3_:uint = Math.floor(this.var_3737.x);
         var _loc4_:uint = Math.floor(this.var_3737.y);
         var _loc5_:uint = Math.abs(Number(this.var_3737.width) - Number(this.var_3737.x));
         var _loc6_:uint = Math.abs(Number(this.var_3737.height) - Number(this.var_3737.y));
         var _loc7_:uint = Math.ceil(_loc5_ / _loc1_);
         var _loc8_:uint = Math.ceil(_loc6_ / _loc2_);
         var _loc9_:Number = 0;
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc7_)
            {
               _loc12_ = _loc11_ * _loc1_;
               _loc13_ = _loc10_ * _loc2_;
               _loc14_ = _loc12_ + 1;
               _loc15_ = _loc13_ + 1;
               _loc16_ = _loc3_ + _loc14_;
               _loc17_ = _loc4_ + _loc15_;
               _loc18_ = new class_73(_loc16_ + this._effect.method_1278.x,_loc17_ + this._effect.method_1278.y);
               _loc19_ = Number(this.var_1023) * Math.random();
               TweenLite.delayedCall(_loc19_,this.method_3005,[_loc18_,_loc9_]);
               _loc9_++;
               _loc11_++;
            }
            _loc10_++;
         }
      }
      
      protected function method_3005(param1:class_73, param2:Number) : void
      {
         if(param2 == 0)
         {
            class_82.playSoundEffect(this.soundID,false,false,-1,-1,false);
         }
         this._effect.method_3146(param1);
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_3288 = null;
         TweenLite.killDelayedCallsTo(this.method_3005);
      }
   }
}
