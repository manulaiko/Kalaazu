package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.menuBar.actionButtons
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_142.class_2501;
   
   public class BuyButton extends class_2501
   {
      
      public static const BUY_MODE_TOOGLE:String = "buyModeToogle";
       
      
      public function BuyButton(param1:DisplayObjectContainer)
      {
         super(param1);
         this.decorate();
      }
      
      override public function decorate() : void
      {
         super.decorate();
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         toggle();
         dispatchEvent(new Event(BUY_MODE_TOOGLE,true));
      }
      
      override public function set selected(param1:Boolean) : void
      {
         method_4622(var_582,selectedState);
         method_4622(!var_582,background);
      }
   }
}
