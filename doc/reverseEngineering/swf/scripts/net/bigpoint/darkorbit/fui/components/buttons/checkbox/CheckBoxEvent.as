package net.bigpoint.darkorbit.fui.components.buttons.checkbox
{
   import flash.events.Event;
   
   public class CheckBoxEvent extends Event
   {
      
      public static const EVENT_SELECTION_CHANGED:String = "selectionChanged";
       
      
      private var _selection:Boolean;
      
      public function CheckBoxEvent(param1:Boolean)
      {
         super(EVENT_SELECTION_CHANGED);
         this._selection = param1;
      }
      
      public function get selected() : Boolean
      {
         return this._selection;
      }
   }
}
