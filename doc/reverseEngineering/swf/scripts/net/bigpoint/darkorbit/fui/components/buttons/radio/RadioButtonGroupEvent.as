package net.bigpoint.darkorbit.fui.components.buttons.radio
{
   import flash.events.Event;
   
   public class RadioButtonGroupEvent extends Event
   {
      
      public static const EVENT_SELECTION_CHANGED:String = "selectionChanged";
       
      
      private var _group:RadioButtonGroup;
      
      public function RadioButtonGroupEvent(param1:RadioButtonGroup)
      {
         super(EVENT_SELECTION_CHANGED);
         this._group = param1;
      }
      
      public function get group() : RadioButtonGroup
      {
         return this._group;
      }
      
      public function get selectedRadioButton() : RadioButton
      {
         return this._group.getSelectedRadionButton();
      }
   }
}
