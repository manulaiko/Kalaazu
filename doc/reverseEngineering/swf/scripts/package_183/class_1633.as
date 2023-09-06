package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1633 extends Condition
   {
       
      
      public function class_1633()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         if(param1.length == 1)
         {
            _description = class_88.getItem("q2_condition_VISIT_MAP");
         }
         _description = _description.replace(/%map%/,this.method_3383(param1));
      }
      
      private function method_3383(param1:Vector.<String>) : String
      {
         var _loc2_:class_126 = class_126.instance;
         var _loc3_:String = _loc2_.var_1524[param1.pop()];
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ += ", " + _loc2_.var_1524[param1[_loc5_]];
            _loc5_++;
         }
         return _loc3_;
      }
   }
}
