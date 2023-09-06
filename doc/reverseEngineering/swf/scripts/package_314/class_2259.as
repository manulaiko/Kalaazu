package package_314
{
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import net.bigpoint.darkorbit.mvc.gui.highlights.controller.HighlightFactory;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import net.bigpoint.darkorbit.mvc.gui.highlights.view.FlashWindowHighlight;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_447;
   
   public class class_2259 extends SimpleCommand
   {
       
      
      public function class_2259()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super.execute(param1);
         var _loc2_:FeaturesMenuMediator = facade.retrieveMediator(FeaturesMenuMediator.NAME) as FeaturesMenuMediator;
         var _loc3_:FeatureBtn = _loc2_.getGameFeatureBtnById(GuiConstants.HELP_WINDOW);
         if(_loc3_)
         {
            _loc4_ = HighlightFactory.createHighlight(class_447.const_1799) as FlashWindowHighlight;
            _loc5_ = new HighlightItemVO(null,null,class_447.const_1799,0.5);
            _loc4_.decorateUiElement(_loc3_,_loc5_);
            _loc4_.remove();
         }
      }
   }
}
