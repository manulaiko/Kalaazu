package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   
   public class class_1599 extends Condition
   {
       
      
      private var var_3645:int;
      
      public function class_1599()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         this.var_3645 = parseInt(param1[0]);
         _description = class_88.getItem("q2_condition_undefined");
         var _loc2_:int = 0;
         if(this.var_3645 == 1)
         {
            _loc2_ = 0;
         }
         var _loc3_:String = this.method_1056.method_3731[_loc2_] || this.method_1056.method_3731[0];
         _description = _description.replace(/%QUESTGIVER_NAME%/,_loc3_);
         if(this.var_3645 > 0)
         {
            var_3277 = method_6395("homestation_questgiver");
         }
      }
      
      private function get method_1056() : class_126
      {
         return class_126.getInstance();
      }
   }
}
