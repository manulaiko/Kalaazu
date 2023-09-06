package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_1643 extends Condition
   {
       
      
      private var var_3871:int;
      
      public function class_1643()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         this.var_3871 = int(param1[0]);
         if(this.var_3871 > 2)
         {
            _description = class_88.getItem("q2_condition_undefined_size").replace(/%count%/,this.var_3871);
         }
         else
         {
            _description = class_88.getItem("q2_condition_undefined");
         }
      }
   }
}
