package net.bigpoint.darkorbit.mvc.gui.abstract.controller
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenMax;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.AbstractMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
   import net.bigpoint.darkorbit.mvc.gui.abstract.view.AbstractMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   import package_103.class_2007;
   import package_103.class_273;
   import package_104.class_277;
   import package_104.class_278;
   import package_141.class_2008;
   import package_84.class_243;
   
   public class MenuPositionsAbstractCommand extends class_243
   {
       
      
      public function MenuPositionsAbstractCommand()
      {
         super();
      }
      
      protected function get stageWidth() : int
      {
         return name_47.stageWidth;
      }
      
      protected function get stageHeight() : int
      {
         return name_47.stageHeight;
      }
      
      protected function get stageRectangle() : Rectangle
      {
         return new Rectangle(0,0,this.stageWidth,this.stageHeight);
      }
      
      protected function setInitBarPosition(param1:class_2008) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:AbstractMenuBarVO = this.menuMediator.menuBarsMap[param1] as AbstractMenuBarVO;
         if(_loc2_)
         {
            _loc3_ = class_2007.method_3824(_loc2_.layoutId);
            param1.var_4606.method_4587(_loc3_);
            _loc4_ = ScreenScaleUtils.getRealPosFromPercentagePos(name_47.name_118,new class_73(param1.realWidth,param1.realHeight),_loc2_.position);
            this.setBarPositionAndLayout(param1,_loc4_.x,_loc4_.y,_loc3_);
         }
      }
      
      protected function updateBarPosition(param1:class_2008) : void
      {
         var _loc3_:* = null;
         var _loc2_:AbstractMenuBarVO = this.menuMediator.menuBarsMap[param1] as AbstractMenuBarVO;
         if(_loc2_)
         {
            _loc3_ = ScreenScaleUtils.getRealPosFromPercentagePos(name_47.name_118,new class_73(param1.realWidth,param1.realHeight),_loc2_.position);
            param1.x = int(_loc3_.x);
            param1.y = int(_loc3_.y);
         }
      }
      
      protected function resetBarPosition(param1:class_2008, param2:class_73) : void
      {
         this.setBarPositionAndLayout(param1,param2.x,param2.y,class_2007.method_3824(class_278.ID));
         var _loc3_:class_73 = ScreenScaleUtils.getPercentagePosFromRealPos(name_47.name_118,param2,new class_73(param1.realWidth,param1.realHeight));
         this.updateBarPosAndLayout(param1,_loc3_,class_278.ID);
      }
      
      protected function updateBarPosAndLayout(param1:class_2008, param2:class_73 = null, param3:String = null) : void
      {
         var _loc4_:AbstractMenuBarVO;
         if(_loc4_ = this.menuMediator.menuBarsMap[param1] as AbstractMenuBarVO)
         {
            this.menuMediator.menuBarsMap[param1] = this.menuProxy.updateBarPosAndLayout(_loc4_.id,param2.x,param2.y,param3);
         }
      }
      
      protected function updateBarStickOffset(param1:class_2008, param2:class_73) : void
      {
         var _loc3_:SlotBarVO = this.menuMediator.menuBarsMap[param1] as SlotBarVO;
         if(_loc3_)
         {
            this.menuMediator.menuBarsMap[param1] = this.menuProxy.updateStickyOffset(_loc3_.id,param2.x,param2.y);
         }
      }
      
      protected function setBarPositionAndLayout(param1:class_2008, param2:int, param3:int, param4:class_273) : void
      {
         param1.x = param2;
         param1.y = param3;
         if(param4.id == class_277.ID)
         {
            param4.yOffset = 2;
         }
         param1.var_4606.method_4587(param4,false,false,class_126.const_532);
         var _loc5_:Point = param4.method_1821(SlotAndItemBarElement.DEFAULT_SIZE,param1.var_4606.items.length);
         param1.updateOnListLayoutChange(_loc5_,false);
      }
      
      protected function checkBoundsAndSavePositions() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Boolean = true;
         for each(_loc2_ in this.menuMediator.menuBars)
         {
            if(!this.stageRectangle.containsRect(_loc2_.method_335))
            {
               _loc3_ = Math.max(_loc2_.leftOffset,Math.min(_loc2_.x,this.stageWidth - Number(_loc2_.method_335.width) + _loc2_.leftOffset));
               _loc4_ = Math.max(_loc2_.topOffset,Math.min(_loc2_.y,this.stageHeight - Number(_loc2_.method_335.height) + _loc2_.topOffset));
               _loc1_ = false;
               TweenMax.to(_loc2_,0.3,{
                  "x":_loc3_,
                  "y":_loc4_,
                  "onComplete":this.savePosition,
                  "onCompleteParams":[_loc2_,true]
               });
            }
            this.savePosition(_loc2_);
         }
         sendNotification(GuiNotifications.SAVE_BARS_SETTINGS,_loc1_);
      }
      
      protected function savePosition(param1:class_2008, param2:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:AbstractMenuBarVO = this.menuMediator.menuBarsMap[param1] as AbstractMenuBarVO;
         if(_loc3_)
         {
            _loc4_ = _loc3_.id;
            _loc5_ = ScreenScaleUtils.getPercentagePosFromRealPos(name_47.name_118,new class_73(param1.x,param1.y),new class_73(param1.realWidth,param1.realHeight));
            this.menuMediator.menuBarsMap[param1] = this.menuProxy.updateBarPosAndLayout(_loc4_,_loc5_.x,_loc5_.y,param1.var_4606.layout.id);
            if(param2)
            {
               sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
            }
         }
      }
      
      protected function get menuProxy() : AbstractMenuProxy
      {
         throw new Error("incorrect access to menuProxy in MenuPositionsAbstractCommand");
      }
      
      protected function get menuMediator() : AbstractMenuMediator
      {
         throw new Error("incorrect access to menuMediator in MenuPositionsAbstractCommand");
      }
   }
}
