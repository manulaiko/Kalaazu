package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1617 extends Condition
   {
       
      
      private var var_2745:int;
      
      public function class_1617()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         this.var_2745 = parseInt(param1[0]);
         _loc2_ = class_126.instance;
         _loc3_ = uint(class_126.instance.method_3780[this.var_2745]);
         var _loc4_:* = "q2_condition_undefined";
         if(this.var_2745 > 0)
         {
            _loc4_ += "_ore";
            var_3277 = method_6395("ore_" + this.var_2745 + ".png");
         }
         if(_target == 0)
         {
            _loc4_ += "_challenge";
         }
         else
         {
            var_106 = "/" + _target;
         }
         _description = class_88.getItem(_loc4_);
         _description = _description.replace(/%ore%/,_loc2_.method_6484[_loc3_]);
         _description = description.replace(/%count%/,_target);
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
   }
}
