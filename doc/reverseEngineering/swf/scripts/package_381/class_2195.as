package package_381
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_10.class_305;
   import package_27.class_82;
   import package_75.class_1489;
   
   public class class_2195
   {
       
      
      private var var_1659:Vector.<String>;
      
      private var _position:class_305;
      
      private var _effect:class_1489;
      
      public function class_2195(param1:class_1211, param2:class_1489)
      {
         super();
         this._effect = param2;
         var _loc3_:class_1489 = param2 as class_1489;
         this.var_1659 = _loc3_.patterns.concat();
         this._position = new class_305(param2.x,param2.y);
         this.method_3520();
      }
      
      private function method_3520() : void
      {
         var _loc1_:* = null;
         if(this.var_1659.length > 0)
         {
            _loc1_ = new class_2160(this._effect,this.var_1659.pop() + ".zip",this._position);
            _loc1_.completed.addOnce(this.method_3520);
            _loc1_.scale = 2;
            class_82.playSoundEffect(class_126.const_1374);
         }
      }
   }
}
