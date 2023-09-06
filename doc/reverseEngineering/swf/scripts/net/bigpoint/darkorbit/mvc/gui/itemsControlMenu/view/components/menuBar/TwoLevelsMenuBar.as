package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar
{
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   import package_11.class_39;
   
   public class TwoLevelsMenuBar extends MenuBar
   {
      
      private static const ARROW_OFFSET:int = 15;
       
      
      private var _secondLevelMenuBar:MenuBar;
      
      public function TwoLevelsMenuBar(param1:class_39)
      {
         super(param1);
      }
      
      override public function decorate() : void
      {
         super.decorate();
         method_4210(this._secondLevelMenuBar = new MenuBar(_swfFinisher));
      }
      
      override public function updateLayout() : void
      {
         super.updateLayout();
         this._secondLevelMenuBar.y = -this._secondLevelMenuBar.height - 1;
      }
      
      override public function get topOffset() : int
      {
         return SlotAndItemBarElement.DEFAULT_SIZE + const_2211;
      }
      
      override public function get boundsHeight() : int
      {
         return 2 * (SlotAndItemBarElement.DEFAULT_SIZE + const_2211) + const_2211;
      }
      
      override public function get boundsWidth() : int
      {
         return super.boundsWidth + ARROW_OFFSET;
      }
      
      public function get secondLevelMenuBar() : MenuBar
      {
         return this._secondLevelMenuBar;
      }
   }
}
