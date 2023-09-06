package package_124
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_37.class_170;
   import package_38.class_523;
   import package_38.class_830;
   import package_46.class_131;
   import package_52.class_143;
   
   public class class_1384 extends class_170
   {
       
      
      public function class_1384()
      {
         super();
      }
      
      public static function run(param1:class_830) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.type.type == class_523.const_184)
         {
            if(param1.var_731 > 0)
            {
               _loc2_ = false;
               _loc3_ = var_574.method_4489().method_468(GuiConstants.CURCUBITOR_COUNTDOWN_STATUS_WINDOW);
               if(_loc3_ == null)
               {
                  _loc3_ = var_574.method_4489().createWindow(GuiConstants.CURCUBITOR_COUNTDOWN_STATUS_WINDOW) as class_131;
               }
               else if(!_loc3_.maximized)
               {
                  _loc2_ = true;
               }
               if((_loc4_ = class_57.getInstance().method_4369(class_57.const_2498) as class_143) == null)
               {
                  _loc4_ = class_57.getInstance().method_1604(class_57.const_2498,_loc3_) as class_143;
               }
               _loc4_.countDownLabel.text = class_88.getItem("label_countdownHalloweenNpcs").replace("%AMOUNT%",param1.var_731).replace("%TOTAL%",param1.var_717);
               if(!_loc2_)
               {
                  var_574.guiManager.method_1875(GuiConstants.CURCUBITOR_COUNTDOWN_STATUS_WINDOW);
               }
            }
            else
            {
               class_57.getInstance().method_2624(class_57.const_2498);
            }
         }
      }
   }
}
