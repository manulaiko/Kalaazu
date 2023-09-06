package package_381
{
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_35.Effect;
   import package_75.class_370;
   
   public class class_2171 extends class_2160
   {
      
      private static const URL:String = "shield_infinity.zip";
       
      
      public function class_2171(param1:class_1211, param2:class_370)
      {
         super(param2,URL,param2.source.position);
         if(param2.type == Effect.const_925)
         {
            method_3722("cycle",disposeView);
         }
      }
   }
}
