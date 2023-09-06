package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests
{
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.Slot;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_242.DragEvent;
   import package_38.class_598;
   import package_84.class_243;
   
   public class SendSlotBarConfigSetRequestCommand extends class_243
   {
       
      
      public function SendSlotBarConfigSetRequestCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc12_:* = null;
         var _loc2_:DragEvent = param1.getBody() as DragEvent;
         var _loc3_:Slot = this.menuMediator.slots2itemsMap[_loc2_.method_1419];
         var _loc5_:ItemVO;
         var _loc4_:SlotVO;
         if((_loc5_ = !!(_loc4_ = this.menuMediator.slotsItemsMap[_loc3_]) ? _loc4_.itemVO : this.menuMediator.categoryItemsMap[_loc2_.method_1419]) == null)
         {
            return;
         }
         var _loc6_:String = "";
         var _loc7_:int = 0;
         var _loc8_:String = "";
         var _loc9_:int = 0;
         var _loc10_:String = "";
         if(_loc4_)
         {
            _loc6_ = _loc4_.slotBarId;
            _loc7_ = _loc4_.id;
         }
         if(_loc2_.dropTarget)
         {
            _loc8_ = (_loc12_ = this.menuMediator.slotsItemsMap[_loc2_.dropTarget]).slotBarId;
            _loc9_ = _loc12_.id;
         }
         _loc10_ = _loc5_.id;
         var _loc11_:class_598 = new class_598(_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc11_);
         sendNotification(HighLightItemNotification.CLEANUP_ITEMS_CONTROL_HIGHLIGHTS);
      }
      
      private function get menuMediator() : ItemsControlMenuMediator
      {
         return facade.retrieveMediator(ItemsControlMenuMediator.NAME) as ItemsControlMenuMediator;
      }
      
      private function get menuProxy() : ItemsControlMenuProxy
      {
         return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
   }
}
