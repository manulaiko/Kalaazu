package package_183
{
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import package_38.class_117;
   
   public class class_1596 extends Condition
   {
       
      
      public function class_1596()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         var _loc2_:String = !!param1[0] ? param1[0] : "";
         _description = _description.replace(/%TYPE%/,TextUtils.getTranslationByType(_loc2_,class_117.const_2693));
         var_106 = "/" + _target;
      }
      
      override public function get method_1303() : String
      {
         return _current.toString();
      }
   }
}
