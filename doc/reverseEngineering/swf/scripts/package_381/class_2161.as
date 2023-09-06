package package_381
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_27.class_82;
   import package_36.class_399;
   
   public class class_2161 extends class_2160
   {
      
      private static const const_863:Number = 0.0025;
       
      
      private var _effect:class_399;
      
      public function class_2161(param1:class_1211, param2:class_399)
      {
         this._effect = param2;
         var _loc3_:String = "emp.zip";
         if(Boolean(param2.method_942) && Boolean(param2.method_4989))
         {
            _loc3_ = "emp_emperor_ultimate.zip";
         }
         else if(param2.method_942)
         {
            _loc3_ = "emp_ultimate.zip";
         }
         else if(param2.method_4989)
         {
            _loc3_ = "emp_emperor.zip";
         }
         super(param2,_loc3_,param2.source.position);
      }
      
      override protected function method_1460() : void
      {
         super.method_1460();
         var _loc1_:* = 0 * Number(const_863);
         view.scaleY = 0 * Number(const_863);
         view.scaleX = view.scaleZ = _loc1_;
         if(this._effect.method_942)
         {
            class_82.playSoundEffect(class_126.const_2529,false,false,this._effect.source.position.x,this._effect.source.position.y);
         }
         else
         {
            class_82.playSoundEffect(class_126.const_1932,false,false,this._effect.source.position.x,this._effect.source.position.y);
         }
      }
   }
}
