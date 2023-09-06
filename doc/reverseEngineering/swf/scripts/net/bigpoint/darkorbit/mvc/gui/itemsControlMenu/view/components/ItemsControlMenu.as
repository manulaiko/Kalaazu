package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components
{
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.CategoryElement;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.MenuBar;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.TwoLevelsMenuBar;
   import package_11.class_39;
   import package_141.class_1895;
   import package_241.class_2500;
   
   public class ItemsControlMenu extends class_1895
   {
      
      private static const LINKAGE:String = "itemsControlMenu";
      
      private static const BARS_VPANEL:String = "barsVPanel";
       
      
      public var barsVPanel:class_2500;
      
      private var _categoryBar:TwoLevelsMenuBar;
      
      private var _standardSlotBar:MenuBar;
      
      private var _premiumSlotBar:MenuBar;
      
      private var _proActionBar:ProActionBar;
      
      public function ItemsControlMenu(param1:class_39)
      {
         super(param1,this.symbolLinkage);
         this.initBars();
      }
      
      override public function decorate() : void
      {
         method_4210(this.barsVPanel = new class_2500(method_4492(BARS_VPANEL)));
      }
      
      private function initBars() : void
      {
         this.barsVPanel.addItem(this._categoryBar = new TwoLevelsMenuBar(_swfFinisher),CategoryElement.MARGIN);
         this.barsVPanel.addItem(this._standardSlotBar = new MenuBar(_swfFinisher),CategoryElement.MARGIN);
         this.barsVPanel.addItem(this._proActionBar = new ProActionBar(_swfFinisher),CategoryElement.MARGIN);
         this.barsVPanel.addItem(this._premiumSlotBar = new MenuBar(_swfFinisher),CategoryElement.MARGIN);
         mouseEnabled = false;
         this.barsVPanel.mouseEnabled = false;
      }
      
      override public function updateLayout() : void
      {
      }
      
      public function get defaultHeight() : int
      {
         return this._categoryBar.height + this._standardSlotBar.height + this._premiumSlotBar.height;
      }
      
      override public function get symbolLinkage() : String
      {
         return LINKAGE;
      }
      
      public function get itemBar() : MenuBar
      {
         return this._categoryBar.secondLevelMenuBar;
      }
      
      public function get categoryBar() : MenuBar
      {
         return this._categoryBar;
      }
      
      public function get standardSlotBar() : MenuBar
      {
         return this._standardSlotBar;
      }
      
      public function get premiumSlotBar() : MenuBar
      {
         return this._premiumSlotBar;
      }
      
      public function get proActionBar() : ProActionBar
      {
         return this._proActionBar;
      }
   }
}
