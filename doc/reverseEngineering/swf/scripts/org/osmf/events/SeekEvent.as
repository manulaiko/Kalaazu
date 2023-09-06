package org.osmf.events
{
   import flash.events.Event;
   
   public class SeekEvent extends Event
   {
      
      public static const SEEKING_CHANGE:String = "seekingChange";
       
      
      private var _seeking:Boolean = false;
      
      private var _time:Number;
      
      public function SeekEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Number = NaN)
      {
         super(param1,param2,param3);
         this._seeking = param4;
         this._time = param5;
      }
      
      public function get seeking() : Boolean
      {
         return this._seeking;
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      override public function clone() : Event
      {
         return new SeekEvent(type,bubbles,cancelable,this._seeking,this._time);
      }
   }
}
