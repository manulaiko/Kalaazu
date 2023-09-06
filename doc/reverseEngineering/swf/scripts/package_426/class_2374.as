package package_426
{
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_359.class_2364;
   import package_45.class_125;
   
   public class class_2374 implements class_2366
   {
       
      
      private var var_127:class_2082;
      
      private var var_176:class_306;
      
      public function class_2374()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         this.var_176 = param1;
         this.var_127 = param2;
         this.method_1319();
         param1.state.changed.add(this.method_1319);
      }
      
      private function method_1319() : void
      {
         var _loc2_:* = null;
         var _loc1_:class_2364 = this.var_127.method_4434("healthStation") as class_2364;
         if(_loc1_)
         {
            _loc2_ = _loc1_.asset as MovieClip;
            if(this.var_176.state.value == class_125.const_661)
            {
               _loc2_.cross.alpha = 1;
               _loc2_.topLight.alpha = 1;
               _loc2_.botLight.alpha = 1;
               _loc2_.rightLight.alpha = 1;
               _loc2_.leftLight.alpha = 1;
               _loc2_.yellowCross.alpha = 0;
            }
            else
            {
               _loc2_.cross.alpha = 0;
               _loc2_.topLight.alpha = 0;
               _loc2_.botLight.alpha = 0;
               _loc2_.rightLight.alpha = 0;
               _loc2_.leftLight.alpha = 0;
               _loc2_.yellowCross.alpha = 1;
            }
         }
      }
   }
}
