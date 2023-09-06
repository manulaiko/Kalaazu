package package_75
{
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_101.class_1176;
   import package_113.class_404;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1885 extends class_348
   {
       
      
      private var var_286:class_404;
      
      public function class_1885(param1:class_86)
      {
         super(class_338.const_1745,param1);
         this.var_286 = new class_404("infiltration");
      }
      
      override public function activate() : Boolean
      {
         source.addTrait(this.var_286);
         var _loc1_:class_1176 = source.method_1954(class_1176) as class_1176;
         if(_loc1_)
         {
            _loc1_.method_1328();
         }
         return super.activate();
      }
      
      override public function deactivate() : void
      {
         this.removeTrait();
         var _loc1_:class_1176 = source.method_1954(class_1176) as class_1176;
         if(_loc1_)
         {
            setTimeout(_loc1_.method_1328,1);
         }
         super.deactivate();
      }
      
      private function removeTrait() : void
      {
         source.removeTrait(this.var_286);
      }
   }
}
