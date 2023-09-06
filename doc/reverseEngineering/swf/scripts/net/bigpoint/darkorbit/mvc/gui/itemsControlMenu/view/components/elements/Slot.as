package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.gui.BitmapFont;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   import package_11.class_39;
   import package_141.class_1895;
   import package_242.IDraggable;
   import package_242.IDropable;
   
   public class Slot extends class_1895 implements IDropable
   {
      
      public static const MARGIN:int = 2;
      
      private static const LINKAGE:String = "slot";
      
      private static const EMPTY:String = "empty";
      
      private static const EQUIPPED:String = "equipped";
      
      private static const BACKGROUND:String = "background";
      
      private static const BRIGHT_BACKGROUND:String = "brightBackground";
      
      private static const ITEM_CONTAINER:String = "itemContainer";
      
      private static const DRAG_ACCEPT_STATE:String = "dragAcceptState";
      
      private static const SLOT_NR_FONT_CONTAINER:String = "slotNrFontContainer";
       
      
      public var background:Sprite;
      
      public var brightBackground:Sprite;
      
      public var itemContainer:Sprite;
      
      public var dragAcceptState:Sprite;
      
      public var slotNrFont:BitmapFont;
      
      public var slotNrFontContainer:Sprite;
      
      private var _state:String = "empty";
      
      public function Slot(param1:class_39, param2:int)
      {
         super(param1,this.symbolLinkage);
         this.updateLayout();
         alpha = 0.3;
         method_4622(false,this.dragAcceptState,0);
         method_4622(false,this.brightBackground,0);
         this.slotNrFont.setText(String(param2));
         TweenMax.to(this.slotNrFont,0,{"colorMatrixFilter":{"colorize":ItemsControlMenuConstants.STYLE_BLUE_BRIGHT}});
         alpha = 0.5;
         this.background.mouseChildren = false;
         this.background.mouseEnabled = false;
         mouseEnabled = false;
      }
      
      override public function decorate() : void
      {
         method_4210(this.background = method_4492(BACKGROUND));
         method_4210(this.brightBackground = method_4492(BRIGHT_BACKGROUND));
         method_4210(this.itemContainer = method_4492(ITEM_CONTAINER));
         method_4210(this.dragAcceptState = method_4492(DRAG_ACCEPT_STATE));
         method_4210(this.slotNrFontContainer = method_4492(SLOT_NR_FONT_CONTAINER));
         this.slotNrFontContainer.addChild(this.slotNrFont = new BitmapFont());
      }
      
      public function set itemElement(param1:SlotAndItemBarElement) : void
      {
         clear(this.itemContainer);
         this.itemContainer.addChild(param1);
         alpha = 1;
         this._state = EQUIPPED;
      }
      
      public function isDraggingItemAcceptable(param1:IDraggable) : Boolean
      {
         return param1.data is ItemVO;
      }
      
      public function setAcceptedDragItem(param1:IDraggable) : void
      {
      }
      
      public function showAcceptableState(param1:IDraggable) : void
      {
         method_4622(true,this.dragAcceptState);
      }
      
      public function hideAcceptableState(param1:IDraggable) : void
      {
         method_4622(false,this.dragAcceptState);
      }
      
      override public function updateLayout() : void
      {
      }
      
      override public function get symbolLinkage() : String
      {
         return LINKAGE;
      }
      
      public function set highlighted(param1:Boolean) : void
      {
         method_4622(param1,this.brightBackground);
         if(this._state == EMPTY)
         {
            TweenLite.to(this,0.3,{"alpha":(param1 ? 1 : 0.3)});
         }
      }
      
      public function get asDisplayObject() : DisplayObject
      {
         return this;
      }
   }
}
