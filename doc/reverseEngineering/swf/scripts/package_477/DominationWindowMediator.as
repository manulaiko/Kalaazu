package package_477
{
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.fui.system.utils.BindingsUtils;
   import net.bigpoint.darkorbit.fui.system.utils.FuiComponentSelectorUtil;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_31.class_92;
   import package_317.DominationNotificationNames;
   import package_317.class_2515;
   import package_393.class_2268;
   import package_46.class_131;
   import package_489.class_2715;
   import package_70.SimpleWindowEvent;
   
   public class DominationWindowMediator extends class_92
   {
      
      public static const NAME:String = "DominationWindowMediator";
       
      
      private var var_2509:Sprite;
      
      private var _itemList:ItemList;
      
      private var var_2118:Label;
      
      private var var_3342:Label;
      
      private var var_4320:Label;
      
      public function DominationWindowMediator(param1:class_131)
      {
         super(NAME,param1);
         param1.setSize(274,320);
         this.method_5246();
         this.addListeners();
         method_2176(DominationNotificationNames.UPDATE_VIEW,this.update);
      }
      
      private function addListeners() : void
      {
         this.window.addEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function method_5246() : void
      {
         this.var_2509 = this.window.method_2321().getChildByName(class_2515.const_1643) as Sprite;
         this._itemList = this.var_2509.getChildByName(class_2515.ITEMLIST) as ItemList;
         this._itemList.itemDataAssigner = class_2715;
         var _loc1_:Sprite = this.var_2509.getChildByName(class_2515.const_1811) as Sprite;
         var _loc2_:ScrollContainer = _loc1_.getChildByName(class_2515.const_832) as ScrollContainer;
         var _loc3_:Scrollbar = _loc1_.getChildByName(class_2515.const_8) as Scrollbar;
         BindingsUtils.bindScrollComponents(_loc2_,_loc3_);
         var _loc5_:Label;
         var _loc4_:Container;
         (_loc5_ = (_loc4_ = _loc2_.getChildByName(class_2515.const_534) as Container).getChildByName(class_2515.const_3245) as Label).text = class_2515.const_1114;
         var _loc6_:Coreponent = FuiComponentSelectorUtil.selectComponent("statusContainer.mmoStatusContainer.company_img",this.var_2509);
         var _loc7_:Coreponent = FuiComponentSelectorUtil.selectComponent("statusContainer.eicStatusContainer.company_img",this.var_2509);
         var _loc8_:Coreponent = FuiComponentSelectorUtil.selectComponent("statusContainer.vruStatusContainer.company_img",this.var_2509);
         _loc6_.setSkinState("mmo");
         _loc7_.setSkinState("eic");
         _loc8_.setSkinState("vru");
         this.var_2118 = FuiComponentSelectorUtil.selectComponent("statusContainer.mmoStatusContainer.score",this.var_2509) as Label;
         this.var_3342 = FuiComponentSelectorUtil.selectComponent("statusContainer.eicStatusContainer.score",this.var_2509) as Label;
         this.var_4320 = FuiComponentSelectorUtil.selectComponent("statusContainer.vruStatusContainer.score",this.var_2509) as Label;
      }
      
      private function update(param1:INotification) : void
      {
         var _loc2_:class_2268 = param1.getBody() as class_2268;
         this._itemList.list = new VectorCollection(_loc2_.list);
         this.method_3439(this.var_2118,_loc2_.method_644.mmo);
         this.method_3439(this.var_3342,_loc2_.method_644.eic);
         this.method_3439(this.var_4320,_loc2_.method_644.vru);
      }
      
      private function method_3439(param1:Label, param2:int) : void
      {
         param1.text = param2.toString();
         var _loc3_:* = param2 >= class_2515.const_1228;
         param1.registeredTextStyleName = _loc3_ ? "null" : class_2515.const_2370;
         param1.filters = _loc3_ ? class_2515.const_96 : class_2515.const_2328;
      }
      
      private function get window() : class_131
      {
         return getViewComponent() as class_131;
      }
      
      private function method_2519(param1:SimpleWindowEvent) : void
      {
         facade.removeMediator(this.getMediatorName());
      }
      
      override public function onRemove() : void
      {
         this.method_25();
         sendNotification(DominationNotificationNames.CLEANUP);
         super.onRemove();
      }
      
      private function method_25() : void
      {
         var _loc1_:Sprite = this.var_2509.getChildByName(class_2515.const_1811) as Sprite;
         var _loc2_:ScrollContainer = _loc1_.getChildByName(class_2515.const_832) as ScrollContainer;
         var _loc3_:Scrollbar = _loc1_.getChildByName(class_2515.const_8) as Scrollbar;
         BindingsUtils.unbindScrollComponents(_loc2_,_loc3_);
         this.window.removeEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
   }
}
