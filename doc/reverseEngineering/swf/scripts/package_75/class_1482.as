package package_75
{
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_22.class_339;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1482 extends class_348
   {
       
      
      private var var_174:Boolean;
      
      public function class_1482(param1:class_86, param2:Boolean)
      {
         this.var_174 = param2;
         super(class_338.const_1034,param1,const_2311,new class_339(class_338.const_1034,"speed-buff-effect"));
      }
      
      public function get method_668() : Boolean
      {
         return this.var_174;
      }
   }
}
