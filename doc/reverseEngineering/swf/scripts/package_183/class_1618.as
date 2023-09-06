package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1618 extends Condition
   {
       
      
      private var var_1041:int;
      
      public function class_1618()
      {
         super();
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         this.var_1041 = parseInt(param1[0]);
         if(Boolean(name_62) && _target > 0)
         {
            var_106 = "/" + _target;
            var_1427 = true;
         }
         else
         {
            var_1427 = false;
            _description = class_88.getItem("q2_condition_undefined_challenge");
         }
         _description = _description.replace(/%npc%/,class_126.instance.method_1789[this.var_1041]);
         var_3277 = method_6395(class_126.instance.method_3582[this.var_1041] + "_icon.png");
      }
   }
}
