package package_183
{
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1636 extends Condition
   {
       
      
      private var var_4403:int;
      
      public function class_1636()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         this.var_4403 = parseInt(param1[0]);
         _description = _description.replace(/%map%/,class_126.instance.var_1524[this.var_4403]);
      }
   }
}
