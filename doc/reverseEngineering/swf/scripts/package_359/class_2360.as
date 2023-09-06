package package_359
{
   import flash.display.Shape;
   import net.bigpoint.darkorbit.map.common.class_80;
   import package_10.class_305;
   
   public class class_2360 extends Shape implements class_80
   {
       
      
      private var var_377:class_305;
      
      public function class_2360(param1:class_305)
      {
         super();
         this.var_377 = param1;
      }
      
      public function updateObj(param1:Number) : void
      {
         this.var_377.setTo(x,y,0);
      }
   }
}
