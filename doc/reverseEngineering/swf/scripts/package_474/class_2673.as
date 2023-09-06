package package_474
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.view.GuiMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_389.class_2257;
   import package_389.class_2502;
   import package_448.class_2504;
   import package_46.class_131;
   import package_9.class_50;
   
   public class class_2673 extends SimpleCommand
   {
       
      
      public function class_2673()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.execute(param1);
         var _loc2_:class_2504 = param1.getBody() as class_2504;
         var _loc3_:Boolean = Boolean(_loc2_.name_61.name_78);
         if(!_loc3_)
         {
            _loc6_ = (_loc5_ = facade.retrieveMediator(class_2257.NAME) as class_2257).method_874();
            _loc8_ = (_loc7_ = facade.retrieveMediator(GuiMediator.NAME) as GuiMediator).getWindowById(GuiConstants.REFINEMENT_WINDOW) as class_131;
            _loc9_ = class_50.getInstance().name_118;
            _loc10_ = _loc8_.featureWindowVO.size;
            _loc11_ = new class_73(class_50.method_1849() + (Number(_loc6_.width) >> 1),100);
            _loc12_ = ScreenScaleUtils.getPercentagePosFromRealPos(_loc9_,_loc11_,_loc10_);
            _loc8_.featureWindowVO.position.x = _loc12_.x;
            _loc8_.featureWindowVO.position.y = _loc12_.y;
            if(!_loc8_.maximized)
            {
               _loc8_.maximize(false);
            }
         }
         var _loc4_:class_2504 = param1.getBody() as class_2504;
         this.facade.removeCommand(_loc4_.method_3359);
      }
   }
}
