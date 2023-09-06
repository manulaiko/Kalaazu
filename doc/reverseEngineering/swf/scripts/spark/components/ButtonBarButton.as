package spark.components
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class ButtonBarButton extends ToggleButton implements IItemRenderer
   {
       
      
      private var _allowDeselection:Boolean = true;
      
      private var _showsCaret:Boolean = false;
      
      private var _itemIndex:int;
      
      private var _label:String = "";
      
      public function ButtonBarButton()
      {
         super();
      }
      
      public function get allowDeselection() : Boolean
      {
         return this._allowDeselection;
      }
      
      public function set allowDeselection(param1:Boolean) : void
      {
         this._allowDeselection = param1;
      }
      
      public function get showsCaret() : Boolean
      {
         return this._showsCaret;
      }
      
      public function set showsCaret(param1:Boolean) : void
      {
         if(param1 == this._showsCaret)
         {
            return;
         }
         this._showsCaret = param1;
         mx_internal::drawFocusAnyway = true;
         drawFocus(param1);
      }
      
      public function get dragging() : Boolean
      {
         return false;
      }
      
      public function set dragging(param1:Boolean) : void
      {
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return content;
      }
      
      public function set data(param1:Object) : void
      {
         content = param1;
         dispatchEvent(new Event("dataChange"));
      }
      
      public function get itemIndex() : int
      {
         return this._itemIndex;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._itemIndex = param1;
      }
      
      override public function get label() : String
      {
         return this._label;
      }
      
      override public function set label(param1:String) : void
      {
         if(param1 != this._label)
         {
            this._label = param1;
            if(labelDisplay)
            {
               labelDisplay.text = this._label;
            }
         }
      }
      
      override protected function buttonReleased() : void
      {
         if(selected && !this.allowDeselection)
         {
            return;
         }
         super.buttonReleased();
      }
   }
}
