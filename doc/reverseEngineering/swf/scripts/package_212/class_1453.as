package package_212
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_260.class_1659;
   import package_27.class_82;
   import package_38.class_447;
   import package_38.class_766;
   
   public class class_1453 extends class_1240
   {
       
      
      public function class_1453()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_766 = param1.getBody() as class_766;
         var _loc3_:Vector.<class_1659> = method_4097(_loc2_.contacts);
         sendNotification(class_1658.const_2135,_loc3_);
      }
      
      override protected function method_1323(param1:class_1659) : void
      {
         super.method_1323(param1);
         class_82.playSoundEffect(class_126.const_2808);
         var _loc2_:HighlightItemVO = new HighlightItemVO(GuiConstants.CONTACTLIST_WINDOW,GuiConstants.WINDOWS_ID,class_447.const_1799,0,10);
         var _loc3_:HighlightItemVO = new HighlightItemVO(GuiConstants.CONTACTLIST_WINDOW,FeaturesMenuConstants.MENU_ID,class_447.const_1799,0,10);
         facade.sendNotification(HighLightItemNotification.ADD_HIGHLIGHT,_loc2_);
         facade.sendNotification(HighLightItemNotification.ADD_HIGHLIGHT,_loc3_);
      }
      
      override protected function method_262() : void
      {
      }
   }
}
