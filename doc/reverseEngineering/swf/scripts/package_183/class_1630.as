package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1630 extends Condition
   {
       
      
      private var var_1041:int;
      
      public function class_1630()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         this.var_1041 = parseInt(param1[0]);
         var _loc2_:* = "q2_condition_undefined";
         if(_target == 0)
         {
            _loc2_ += "_none";
         }
         else
         {
            var_106 = "/" + _target;
         }
         if(name_62)
         {
            _loc2_ += "_challenge";
         }
         _description = class_88.getItem(_loc2_);
         _description = description.replace(/%npc%/,class_126.instance.method_1789[this.var_1041]);
         _description = description.replace(/%count%/,_target);
         var_3277 = method_6395(class_126.instance.method_3582[this.var_1041] + "_icon.png");
      }
      
      override public function get method_1303() : String
      {
         if(_target == 0)
         {
            return "";
         }
         return String(_current);
      }
   }
}
