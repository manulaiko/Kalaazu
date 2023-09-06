package package_199
{
   import away3d.animators.class_2119;
   import flash.events.Event;
   
   public class class_2434 extends Event
   {
      
      public static const START:String = "start";
      
      public static const STOP:String = "stop";
      
      public static const const_1722:String = "cycle_complete";
       
      
      private var _animator:class_2119;
      
      public function class_2434(param1:String, param2:class_2119)
      {
         super(param1,false,false);
         this._animator = param2;
      }
      
      public function get animator() : class_2119
      {
         return this._animator;
      }
      
      override public function clone() : Event
      {
         return new class_2434(type,this._animator);
      }
   }
}
