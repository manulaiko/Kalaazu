package package_183
{
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1595 extends Condition
   {
       
      
      private var var_2712:Vector.<int>;
      
      public function class_1595()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.method_153(param1);
         this.var_2712 = new Vector.<int>();
         _loc2_ = "";
         for each(_loc3_ in param1)
         {
            if(_loc2_ != "")
            {
               _loc2_ += ", ";
            }
            _loc2_ += class_126.instance.var_1524[parseInt(_loc3_)];
         }
         _description = _description.replace(/%map%/,_loc2_);
      }
   }
}
