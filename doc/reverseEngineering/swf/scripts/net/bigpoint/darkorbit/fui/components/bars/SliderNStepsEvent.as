package net.bigpoint.darkorbit.fui.components.bars
{
   import flash.events.Event;
   
   public class SliderNStepsEvent extends Event
   {
      
      public static const SLIDER_VALUE_CHANGED:String = "SLIDER_VALUE_CHANGED";
       
      
      private var _value:int;
      
      private var _maxValue:int;
      
      public function SliderNStepsEvent(param1:String, param2:int, param3:int)
      {
         super(param1);
         this._value = param2;
         this._maxValue = param3;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get maxValue() : int
      {
         return this._maxValue;
      }
   }
}
