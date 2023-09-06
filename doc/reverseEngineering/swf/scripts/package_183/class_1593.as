package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_1593 extends Condition
   {
       
      
      public function class_1593()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         if(_target == 0)
         {
            _description = class_88.getItem("q2_condition_undefined_challenge");
         }
         else
         {
            var_106 = "/" + _target;
            _description = _description.replace(/%count%/,_target);
         }
         var_3277 = method_6395("cargo_box");
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
   }
}
