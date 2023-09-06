package fl.events
{
   import flash.events.Event;
   
   public class ScrollEvent extends Event
   {
      
      public static const SCROLL:String = "scroll";
       
      
      private var _direction:String;
      
      private var _position:Number;
      
      private var _delta:Number;
      
      public function ScrollEvent(param1:String, param2:Number, param3:Number)
      {
         super(ScrollEvent.SCROLL,false,false);
         _direction = param1;
         _delta = param2;
         _position = param3;
      }
      
      public function get position() : Number
      {
         return _position;
      }
      
      public function get direction() : String
      {
         return _direction;
      }
      
      public function get delta() : Number
      {
         return _delta;
      }
      
      override public function toString() : String
      {
         return formatToString("ScrollEvent","type","bubbles","cancelable","direction","delta","position");
      }
      
      override public function clone() : Event
      {
         return new ScrollEvent(_direction,_delta,_position);
      }
   }
}
