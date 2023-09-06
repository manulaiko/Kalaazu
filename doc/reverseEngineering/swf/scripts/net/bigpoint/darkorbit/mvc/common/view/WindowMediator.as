package net.bigpoint.darkorbit.mvc.common.view
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import net.bigpoint.darkorbit.mvc.companyhierarchy.view.CompanyHierarchyWindowMediator;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_146.QuestGiverWindowMediator;
   import package_31.class_92;
   import package_49.class_139;
   import package_55.class_151;
   import package_59.BattleStationWindowViewMediator;
   import package_59.class_159;
   import package_80.QuestProxy;
   import spark.components.SkinnableContainer;
   
   public class WindowMediator extends class_92 implements IMediator
   {
      
      public static const NAME:String = "WindowMediator";
       
      
      private var windowManager:class_57;
      
      public function WindowMediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
         this.windowManager = class_57.getInstance();
         this.windowManager.init(this.windowContainer);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GuiNotifications.CLOSE_WINDOW_BY_TYPE,GuiNotifications.OPEN_QUEST_WINDOW,GuiNotifications.OPEN_BATTLE_STATION_WINDOW,GuiNotifications.OPEN_COMPANY_HIERARCHY_WINDOW,GuiNotifications.CLOSE_QUEST_WINDOW,GuiNotifications.CLOSE_ALL_FLEX_WINDOWS,GuiNotifications.UPDATE_WINDOWS_POSITIONS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc3_:String = param1.getName();
         _loc4_ = param1.getBody();
         switch(_loc3_)
         {
            case GuiNotifications.CLOSE_WINDOW_BY_TYPE:
               this.windowManager.method_2624(String(_loc4_));
               sendNotification(GuiNotifications.NOTIFY_WINDOW_TYPE_CLOSED + String(_loc4_));
               break;
            case GuiNotifications.CREATE_POP_UP:
               _loc5_ = _loc4_.popUpType;
               this.windowManager.createWindow(_loc5_);
               break;
            case GuiNotifications.OPEN_QUEST_WINDOW:
               facade.removeMediator(QuestGiverWindowMediator.NAME);
               _loc6_ = _loc4_ as int;
               _loc7_ = class_139(this.windowManager.createWindow(class_57.const_2173));
               (_loc8_ = new QuestGiverWindowMediator(_loc7_)).method_3123 = _loc6_;
               facade.registerMediator(_loc8_);
               if(_loc4_ != null)
               {
                  if(_loc12_ = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy)
                  {
                     _loc12_.method_179();
                     break;
                  }
                  break;
               }
               break;
            case GuiNotifications.OPEN_BATTLE_STATION_WINDOW:
               if(facade.hasMediator(BattleStationWindowViewMediator.NAME))
               {
                  facade.removeMediator(BattleStationWindowViewMediator.NAME);
               }
               (_loc9_ = class_159(this.windowManager.createWindow(class_57.const_394,class_57.const_729))).method_5156(_loc4_ as String);
               _loc10_ = new BattleStationWindowViewMediator(_loc9_);
               facade.registerMediator(_loc10_);
               break;
            case GuiNotifications.OPEN_COMPANY_HIERARCHY_WINDOW:
               if(facade.hasMediator(CompanyHierarchyWindowMediator.NAME))
               {
                  facade.removeMediator(CompanyHierarchyWindowMediator.NAME);
               }
               _loc11_ = class_151(this.windowManager.createWindow(class_57.const_3096));
               facade.registerMediator(new CompanyHierarchyWindowMediator(_loc11_));
               break;
            case GuiNotifications.CLOSE_QUEST_WINDOW:
               this.windowManager.method_2624(class_57.const_2173);
               sendNotification(NaN);
               facade.removeMediator(QuestGiverWindowMediator.NAME);
               break;
            case GuiNotifications.CLOSE_ALL_FLEX_WINDOWS:
               this.windowManager.method_1325();
               break;
            case GuiNotifications.UPDATE_WINDOWS_POSITIONS:
               this.updateWindowsPositions();
         }
      }
      
      private function updateWindowsPositions() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for(_loc1_ in this.windowManager.method_971)
         {
            _loc2_ = this.windowManager.method_971[_loc1_] as DOWindow;
            _loc3_ = new class_73(_loc2_.x,_loc2_.y);
            if(_loc2_)
            {
               _loc4_ = ScreenScaleUtils.getScalePosition(name_47.method_6170.beforeResize,new class_73(name_47.stageWidth,name_47.stageHeight),_loc3_,new class_73(_loc2_.width,_loc2_.height));
               _loc4_ = ScreenScaleUtils.correctOutsideViewportPosition(new Rectangle(_loc4_.x,_loc4_.y,_loc2_.width,_loc2_.height),new class_73(name_47.stageWidth,name_47.stageHeight));
            }
            _loc2_.x = _loc4_.x;
            _loc2_.y = _loc4_.y;
         }
      }
      
      protected function get windowContainer() : SkinnableContainer
      {
         return viewComponent as SkinnableContainer;
      }
   }
}
