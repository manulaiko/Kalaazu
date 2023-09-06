package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Expo;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.MenuBar;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons.ProActionBarToggleButton;
   import package_103.class_273;
   import package_104.class_275;
   import package_104.class_276;
   import package_104.class_278;
   import package_104.class_280;
   import package_11.class_39;
   import package_17.class_62;
   
   public class ProActionBar extends MenuBar
   {
      
      private static var _dragButtonBasePositionX:Number = -32;
      
      private static var _rotateButtonBasePositionX:Number = -10;
       
      
      public var proActionBarButton:ProActionBarToggleButton;
      
      private var _barVisibility:Boolean = true;
      
      public function ProActionBar(param1:class_39)
      {
         super(param1);
         this.proActionBarButton.visible = false;
      }
      
      override public function decorate() : void
      {
         super.decorate();
         method_4210(this.proActionBarButton = new ProActionBarToggleButton(_swfFinisher));
         this.proActionBarButton.view.height = 0;
         this.proActionBarButton.view.width = 0;
         _dragButtonBasePositionX = dragButton.x;
         _rotateButtonBasePositionX = rotateButton.x;
      }
      
      override public function updateOnListLayoutChange(param1:Point, param2:Boolean = true) : void
      {
         if(!param2)
         {
            if(this._barVisibility)
            {
               this.show(true);
            }
            else
            {
               this.hide(true);
            }
         }
         else
         {
            super.updateOnListLayoutChange(param1,true);
         }
         this.setButtonPos();
      }
      
      override public function showItems(param1:Array, param2:int, param3:int = 50, param4:Boolean = false, param5:SlotBarVO = null, param6:class_273 = null) : void
      {
         super.showItems(param1,param2,param3,param4,param5,param6);
         if(param5)
         {
            if(param5.id == ItemsControlMenuConstants.PRO_ACTION_BAR)
            {
               if(this._barVisibility != param5.isVisible)
               {
                  class_62.getInstance().sendNotification(ItemsControlMenuNotifications.TOGGLE_PRO_ACTION_BUTTON);
               }
            }
         }
      }
      
      private function setButtonPos() : void
      {
         if(this.proActionBarButton.alpha == 0)
         {
            TweenMax.to(this.proActionBarButton,0.5,{"alpha":0.5});
         }
         rotateButton.width = dragButton.width;
         dragButton.x = _dragButtonBasePositionX;
         rotateButton.x = _rotateButtonBasePositionX;
         var _loc1_:Point = new Point();
         switch(var_4606.layout.id)
         {
            case class_280.ID:
               _loc1_.x = 0 + Number(this.proActionBarButton.view.width) / 2 + 0 - 0.5;
               _loc1_.y = SlotAndItemBarElement.DEFAULT_SIZE + Number(this.proActionBarButton.view.height) / 2;
               break;
            case class_275.ID:
               _loc1_.x = SlotAndItemBarElement.DEFAULT_SIZE + Number(this.proActionBarButton.view.width) / 2 + 0 - 0.5;
               _loc1_.y = 0 + Number(this.proActionBarButton.view.height) / 2;
               break;
            case class_276.ID:
               _loc1_.x = Number(this.proActionBarButton.view.width) / 2 + 0 - 0.5;
               _loc1_.y = 0 + Number(this.proActionBarButton.view.height) / 2;
               break;
            case class_278.ID:
               _loc1_.x = 0 + Number(this.proActionBarButton.view.width) / 2 + 0 - 0.5;
               _loc1_.y = Number(this.proActionBarButton.view.height) / 2;
               dragButton.x = 0 - 0;
               rotateButton.x = 0 - 0;
         }
         TweenMax.to(this.proActionBarButton.view,0.5,{
            "x":_loc1_.x,
            "y":_loc1_.y,
            "ease":Expo.easeOut
         });
      }
      
      private function show(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(false)
         {
            _loc2_ = int(var_4606.items.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               (_loc5_ = var_4606.items[_loc3_]).x = Number(this.proActionBarButton.view.x) - Number(this.proActionBarButton.view.width) / 2 - 0 + 0.5;
               _loc5_.y = Number(this.proActionBarButton.view.y) - Number(this.proActionBarButton.view.height) / 2 - 0 + 0.5;
               _loc3_++;
            }
            TweenLite.to(this.proActionBarButton,0.5,{"alpha":0.8});
            _loc4_ = int(var_4606.items.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = var_4606.items[_loc3_];
               _loc6_ = var_4606.layout.method_1821(SlotAndItemBarElement.DEFAULT_SIZE,_loc3_);
               _loc5_.visible = true;
               TweenLite.to(_loc5_,param1 ? 0 : 0.5,{
                  "alpha":1,
                  "x":_loc6_.x,
                  "y":_loc6_.y,
                  "ease":Expo.easeOut
               });
               _loc3_++;
            }
         }
      }
      
      private function hide(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(false)
         {
            TweenLite.to(this.proActionBarButton,0.5,{"alpha":0.5});
            _loc2_ = int(var_4606.items.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = var_4606.items[_loc3_];
               TweenLite.to(_loc4_,param1 ? 0 : 0.5,{
                  "alpha":0,
                  "x":Number(this.proActionBarButton.view.x) - Number(this.proActionBarButton.view.width) / 2 - 0 + 0.5,
                  "y":Number(this.proActionBarButton.view.y) - Number(this.proActionBarButton.view.height) / 2,
                  "ease":Expo.easeOut,
                  "onComplete":this.turnOffVisibility,
                  "onCompleteParams":[_loc4_]
               });
               _loc3_++;
            }
         }
      }
      
      private function turnOffVisibility(param1:DisplayObject) : void
      {
         param1.visible = false;
      }
      
      public function set barVisibility(param1:Boolean) : void
      {
         this._barVisibility = param1;
         if(param1)
         {
            this.show(false);
         }
         else
         {
            this.hide(false);
         }
      }
   }
}
