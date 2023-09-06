package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1581 extends Condition
   {
       
      
      private var var_36:int;
      
      private var var_87:int;
      
      public function class_1581()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<String> = param1;
         this.var_36 = parseInt(_loc2_.shift());
         this.var_87 = parseInt(_loc2_.shift());
         var _loc3_:* = "undefined_" + class_126.instance.method_1595[this.var_36];
         _loc4_ = "";
         if(this.var_87 > 0)
         {
            _loc3_ += "_spec";
            if(this.var_36 == 1)
            {
               _loc4_ = class_126.instance.method_6283[this.var_87];
            }
            else if(this.var_36 == 2)
            {
               _loc4_ = class_126.instance.var_2195[this.var_87];
            }
         }
         if(_target == 0)
         {
            _loc3_ += "_challenge";
         }
         else
         {
            var_106 = "/" + _target;
         }
         _description = class_88.getItem("q2_condition_" + _loc3_);
         _description = description.replace(/%type%/,_loc4_);
         _description = description.replace(/%count%/,_target);
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
   }
}
