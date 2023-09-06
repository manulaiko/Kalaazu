package package_238
{
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_30.class_179;
   import package_33.class_93;
   import package_38.class_799;
   
   public class class_1411 extends class_1410
   {
       
      
      public function class_1411()
      {
         super();
      }
      
      public static function run(param1:class_799) : void
      {
         var _loc2_:int = int(param1.var_3889);
         var _loc3_:int = int(param1.var_3657);
         var _loc4_:int = int(param1.var_4723);
         var _loc5_:int = int(param1.var_1898);
         var _loc6_:Array = [_loc4_,_loc3_,_loc5_];
         var _loc7_:class_58;
         if(!(_loc7_ = var_574.method_4489()).method_2814())
         {
            _loc7_.method_3927(_loc6_);
            _loc7_.method_4691(_loc2_);
         }
         else
         {
            _loc7_.method_2694(GuiConstants.INVASION_WINDOW,class_93.const_2114,class_179.var_3137,_loc4_);
            _loc7_.method_2694(GuiConstants.INVASION_WINDOW,class_93.const_2114,class_179.var_1920,_loc3_);
            _loc7_.method_2694(GuiConstants.INVASION_WINDOW,class_93.const_2114,class_179.var_3670,_loc5_);
            _loc7_.method_4691(_loc2_);
         }
      }
   }
}
