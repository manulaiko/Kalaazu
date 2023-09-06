package package_183
{
   import com.bigpoint.utils.class_129;
   
   public class class_1622 extends Condition
   {
       
      
      private var var_1063:String;
      
      public function class_1622()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         _target /= 1000;
         _current /= 1000;
         this.var_1063 = class_129.method_1101(_target);
         _description = _description.replace(/%TIME%/,this.var_1063);
      }
      
      override public function get method_1303() : String
      {
         return class_129.method_1101(Math.round(Number(_current) / 1000));
      }
   }
}
