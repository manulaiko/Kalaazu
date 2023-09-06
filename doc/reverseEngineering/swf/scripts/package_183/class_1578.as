package package_183
{
   import com.bigpoint.utils.class_129;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_1578 extends Condition
   {
       
      
      public function class_1578()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         _target /= 1000;
         if(_target == 0)
         {
            _description = class_88.getItem("q2_condition_undefined_challenge");
         }
      }
      
      override public function get method_1303() : String
      {
         return class_129.method_1101(int(Number(_current) / 1000));
      }
   }
}
