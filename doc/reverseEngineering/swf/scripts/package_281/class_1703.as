package package_281
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import package_195.*;
   
   public class class_1703 extends class_1203
   {
       
      
      private var var_176:class_319;
      
      public function class_1703(param1:class_87, param2:class_319)
      {
         var method_3528:class_87 = param1;
         var trait:class_319 = param2;
         super(method_3528,trait.owner.position);
         this.var_176 = trait;
         with(graphics)
         {
            lineStyle(2,16711680,1);
            beginFill(1123020,0.3);
            drawCircle(0,0,trait.clickRadius);
            endFill();
         }
      }
      
      override public function updateObj(param1:Number) : void
      {
         var _loc2_:class_73 = this.var_176.method_1974(_mapView);
         x = _loc2_.x;
         y = _loc2_.y;
      }
   }
}
