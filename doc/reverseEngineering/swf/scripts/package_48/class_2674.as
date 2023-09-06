package package_48
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_488.class_2713;
   import spark.components.Button;
   
   public class class_2674 extends Button
   {
      
      public static const const_2875:String = "filterButtonClicked";
       
      
      protected var _selected:Boolean;
      
      protected var var_3042:Boolean;
      
      public function class_2674()
      {
         super();
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         super.clickHandler(param1);
         dispatchEvent(new Event(const_2875,true));
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(this.method_4358)
         {
            this.method_4358.updateSelection(this._selected);
         }
      }
      
      private function get method_4358() : class_2713
      {
         return skin as class_2713;
      }
      
      public function get method_1399() : Boolean
      {
         return this.var_3042;
      }
      
      public function set method_1399(param1:Boolean) : void
      {
         this.var_3042 = param1;
      }
   }
}
