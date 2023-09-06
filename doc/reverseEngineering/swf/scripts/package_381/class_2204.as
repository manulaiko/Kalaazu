package package_381
{
   import com.greensock.TweenMax;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_10.class_305;
   import package_355.class_2329;
   import package_36.class_409;
   
   public class class_2204 implements IDisposable
   {
      
      private static const const_3176:String = "beam_chain_bolt.zip";
      
      private static const const_1912:String = "chain_bolt_corners.zip";
       
      
      private var _mapView:class_1211;
      
      private var _effect:class_409;
      
      private var var_298:class_2329;
      
      private var var_208:Vector.<class_2160>;
      
      public function class_2204(param1:class_1211, param2:class_409)
      {
         this.var_208 = new Vector.<class_2160>();
         super();
         this._mapView = param1;
         this._effect = param2;
         this.var_298 = new class_2329(this._effect.method_1610,this._effect.attacker);
         this.method_30();
      }
      
      private function method_30() : void
      {
         var _loc1_:int = int(this.var_298.name_79.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            TweenMax.delayedCall(_loc2_ * 0.2,this.method_1437,[_loc2_]);
            _loc2_++;
         }
      }
      
      private function method_1437(param1:int) : void
      {
         var _loc2_:class_305 = param1 <= 0 ? this._effect.attacker.position : this.var_298.name_79[param1 - 1];
         var _loc3_:class_305 = this.var_298.name_79[param1];
         var _loc4_:class_2190 = new class_2190(this._effect,const_3176,_loc2_,_loc3_,0.1,true);
         var _loc5_:class_2160 = new class_2160(this._effect,const_1912,_loc3_);
         this.var_208.push(_loc4_);
         this.var_208.push(_loc5_);
         TweenMax.delayedCall(3,this.disposeView);
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         var _loc2_:int = int(this.var_208.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_208[_loc3_].disposeView();
            _loc3_++;
         }
      }
   }
}
