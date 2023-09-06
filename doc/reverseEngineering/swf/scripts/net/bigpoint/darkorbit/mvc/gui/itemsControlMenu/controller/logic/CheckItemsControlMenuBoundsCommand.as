package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.logic
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
   import net.bigpoint.darkorbit.mvc.gui.abstract.controller.MenuPositionsAbstractCommand;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.AbstractMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.abstract.view.AbstractMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.MenuBarsMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.MenuBar;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_141.class_2008;
   
   public class CheckItemsControlMenuBoundsCommand extends MenuPositionsAbstractCommand
   {
       
      
      public function CheckItemsControlMenuBoundsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         checkBoundsAndSavePositions();
      }
      
      override protected function savePosition(param1:class_2008, param2:Boolean = false) : void
      {
         this.updateSlotBarsStickyOffsets();
         super.savePosition(param1,param2);
      }
      
      private function updateSlotBarsStickyOffsets() : void
      {
         var _loc1_:MenuBar = this.menuMediator.getMenuBarById(ItemsControlMenuConstants.CATEGORY_BAR) as MenuBar;
         var _loc2_:MenuBar = this.menuMediator.getMenuBarById(ItemsControlMenuConstants.STANDARD_SLOT_BAR) as MenuBar;
         var _loc3_:MenuBar = this.menuMediator.getMenuBarById(ItemsControlMenuConstants.PREMIUM_SLOT_BAR) as MenuBar;
         var _loc4_:MenuBar = this.menuMediator.getMenuBarById(ItemsControlMenuConstants.PRO_ACTION_BAR) as MenuBar;
         this.calculateAndUpdateBarStickyOffset(_loc2_,_loc1_);
         this.calculateAndUpdateBarStickyOffset(_loc4_,_loc1_);
         if(_loc3_)
         {
            this.calculateAndUpdateBarStickyOffset(_loc3_,_loc1_);
         }
      }
      
      private function calculateAndUpdateBarStickyOffset(param1:MenuBar, param2:MenuBar) : void
      {
         var _loc3_:class_73 = new class_73(param1.boundsWidth,param1.boundsHeight);
         var _loc4_:class_73 = ScreenScaleUtils.getStickedBarOffset(new class_73(param1.x,param1.y),_loc3_,new class_73(param2.x,param2.y),new class_73(param2.boundsWidth,param2.boundsHeight));
         updateBarStickOffset(param1,_loc4_ || new class_73());
      }
      
      override protected function get menuProxy() : AbstractMenuProxy
      {
         return retrieveProxy(ItemsControlMenuProxy.NAME) as AbstractMenuProxy;
      }
      
      override protected function get menuMediator() : AbstractMenuMediator
      {
         return retrieveMediator(MenuBarsMediator.NAME) as AbstractMenuMediator;
      }
   }
}
