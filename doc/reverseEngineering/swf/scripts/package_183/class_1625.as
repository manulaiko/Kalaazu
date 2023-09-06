package package_183
{
   import com.bigpoint.utils.class_122;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1625 extends Condition
   {
       
      
      private var var_888:int;
      
      public function class_1625()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         this.var_888 = parseInt(param1[0]);
         _description = class_88.getItem("q2_condition_undefined_" + class_126.instance.method_1595[this.var_888]);
      }
      
      override public function get method_1303() : String
      {
         return class_122.method_98(_current);
      }
   }
}
