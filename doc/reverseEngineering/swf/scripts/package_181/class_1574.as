package package_181
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   class class_1574
   {
      
      private static var var_538:Object;
      
      private static var deltaTime:int = 0;
      
      private static var var_4741:int = -1;
      
      private static var stage:Stage;
      
      private static var var_4277:Boolean;
       
      
      function class_1574()
      {
         super();
      }
      
      public static function method_3266(param1:Stage) : void
      {
         if(stage == null)
         {
            stage = param1;
         }
      }
      
      static function method_4272() : void
      {
         var_538 = new Vector.<class_1104>();
      }
      
      private static function handleEnterFrame(param1:Event) : void
      {
         var _loc4_:* = null;
         if(false)
         {
            stage.removeEventListener(Event.ENTER_FRAME,handleEnterFrame);
            var_4277 = false;
            return;
         }
         var _loc2_:int = getTimer();
         deltaTime = _loc2_ - Number(var_4741);
         var_4741 = _loc2_;
         var _loc3_:int = 0;
         while(_loc3_ < var_538.length)
         {
            if(Boolean((_loc4_ = var_538[_loc3_] as class_1104).remove) || _loc4_.parent == null)
            {
               var_538.splice(_loc3_,1);
               _loc3_--;
               if(Boolean(_loc4_.var_2352) && _loc4_.parent == null)
               {
                  _loc4_.method_2225();
               }
            }
            else
            {
               _loc4_.update(deltaTime);
            }
            _loc3_++;
         }
      }
      
      static function method_3612(param1:class_1104) : void
      {
         var _loc2_:* = null;
         if(var_538 == null)
         {
            method_4272();
         }
         for each(_loc2_ in var_538)
         {
            if(_loc2_ == param1)
            {
               return;
            }
         }
         var_538.push(param1);
      }
      
      static function method_2859() : void
      {
         if(!var_4277)
         {
            var_4741 = getTimer();
            stage.addEventListener(Event.ENTER_FRAME,handleEnterFrame);
            var_4277 = true;
         }
      }
   }
}
