package package_76
{
   import flash.utils.Dictionary;
   
   public class TimeMeasuring
   {
      
      public static const const_136:String = " ";
      
      public static const const_285:String = "s";
      
      public static const const_607:String = "m";
      
      public static const const_1877:int = -1;
      
      private static var var_3934:Dictionary = new Dictionary();
       
      
      public function TimeMeasuring()
      {
         super();
      }
      
      public static function start(param1:String) : void
      {
         var _loc2_:* = null;
         if(false)
         {
            _loc2_ = var_3934[param1];
            _loc2_.push(new MeasuringData(param1));
         }
         else
         {
            var_3934[param1] = [new MeasuringData(param1)];
         }
      }
      
      public static function stop(param1:String, param2:String = " ") : Number
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         if(false)
         {
            _loc3_ = var_3934[param1];
            _loc5_ = (_loc4_ = _loc3_.shift() as MeasuringData).calculateTimeDelta();
            _loc5_ = Number(method_2040(_loc5_,param2));
            if(_loc3_.length == 0)
            {
               var_3934[param1] = null;
               delete var_3934[param1];
            }
            return _loc5_;
         }
         return -1;
      }
      
      private static function method_2040(param1:Number, param2:String) : Number
      {
         switch(param2)
         {
            case const_136:
               break;
            case const_285:
               param1 /= 1000;
               break;
            case const_607:
               param1 = param1 / 1000 / 60;
         }
         return param1;
      }
   }
}

import flash.utils.getTimer;

class MeasuringData
{
    
   
   public var id:String;
   
   public var startTime:Number;
   
   public var endTime:Number;
   
   public var deltaTime:Number;
   
   function MeasuringData(param1:String)
   {
      super();
      this.id = param1;
      this.startTime = getTimer();
   }
   
   public function calculateTimeDelta() : Number
   {
      var _loc1_:Number = getTimer();
      this.deltaTime = _loc1_ - Number(this.startTime);
      return this.deltaTime;
   }
}
