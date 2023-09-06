package org.flintparticles.common.utils
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import package_461.class_2553;
   
   public class class_2554 extends EventDispatcher
   {
      
      private static var _instance:class_2554;
       
      
      private var _shape:Shape;
      
      private var _time:Number;
      
      private var _running:Boolean = false;
      
      public function class_2554()
      {
         super();
         this._shape = new Shape();
      }
      
      public static function get instance() : class_2554
      {
         if(_instance == null)
         {
            _instance = new class_2554();
         }
         return _instance;
      }
      
      private function startTimer() : void
      {
         this._shape.addEventListener(Event.ENTER_FRAME,this.method_458,false,0,true);
         this._time = getTimer();
         this._running = true;
      }
      
      private function method_1026() : void
      {
         this._shape.removeEventListener(Event.ENTER_FRAME,this.method_458);
         this._running = false;
      }
      
      private function method_458(param1:Event) : void
      {
         var _loc2_:int = int(this._time);
         this._time = getTimer();
         var _loc3_:Number = (Number(this._time) - _loc2_) * 0.001;
         dispatchEvent(new class_2553(class_2553.UPDATE,_loc3_));
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(!this._running && Boolean(hasEventListener(class_2553.UPDATE)))
         {
            this.startTimer();
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(Boolean(this._running) && !hasEventListener(class_2553.UPDATE))
         {
            this.method_1026();
         }
      }
   }
}
