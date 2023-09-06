package starling.events
{
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   
   public class TouchEvent extends Event
   {
      
      public static const TOUCH:String = "touch";
      
      private static var sTouches:Vector.<Touch> = new Vector.<Touch>(0);
       
      
      private var mShiftKey:Boolean;
      
      private var mCtrlKey:Boolean;
      
      private var mTimestamp:Number;
      
      private var mVisitedObjects:Vector.<EventDispatcher>;
      
      public function TouchEvent(param1:String, param2:Vector.<Touch>, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true)
      {
         super(param1,param5,param2);
         this.mShiftKey = param3;
         this.mCtrlKey = param4;
         this.mTimestamp = -1;
         this.mVisitedObjects = new Vector.<EventDispatcher>(0);
         var _loc6_:int = param2.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(param2[_loc7_].timestamp > this.mTimestamp)
            {
               this.mTimestamp = param2[_loc7_].timestamp;
            }
            _loc7_++;
         }
      }
      
      public function getTouches(param1:DisplayObject, param2:String = null, param3:Vector.<Touch> = null) : Vector.<Touch>
      {
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(param3 == null)
         {
            param3 = new Vector.<Touch>(0);
         }
         var _loc4_:Vector.<Touch>;
         var _loc5_:int = (_loc4_ = data as Vector.<Touch>).length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc8_ = (_loc7_ = _loc4_[_loc6_]).isTouching(param1);
            _loc9_ = param2 == null || param2 == _loc7_.phase;
            if(_loc8_ && _loc9_)
            {
               param3[param3.length] = _loc7_;
            }
            _loc6_++;
         }
         return param3;
      }
      
      public function getTouch(param1:DisplayObject, param2:String = null, param3:int = -1) : Touch
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         this.getTouches(param1,param2,sTouches);
         var _loc4_:int;
         if((_loc4_ = 0) > 0)
         {
            _loc5_ = null;
            if(param3 < 0)
            {
               _loc5_ = sTouches[0];
            }
            else
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  if(sTouches[_loc6_].id == param3)
                  {
                     _loc5_ = sTouches[_loc6_];
                     break;
                  }
                  _loc6_++;
               }
            }
            sTouches.length = 0;
            return _loc5_;
         }
         return null;
      }
      
      public function interactsWith(param1:DisplayObject) : Boolean
      {
         var _loc2_:Boolean = false;
         this.getTouches(param1,null,sTouches);
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            if(sTouches[_loc3_].phase != TouchPhase.ENDED)
            {
               _loc2_ = true;
               break;
            }
            _loc3_--;
         }
         sTouches.length = 0;
         return _loc2_;
      }
      
      function dispatch(param1:Vector.<EventDispatcher>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         if(Boolean(param1) && Boolean(param1.length))
         {
            _loc2_ = bubbles ? param1.length : 1;
            _loc3_ = target;
            setTarget(param1[0] as EventDispatcher);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = param1[_loc4_] as EventDispatcher;
               if(this.mVisitedObjects.indexOf(_loc5_) == -1)
               {
                  _loc6_ = _loc5_.invokeEvent(this);
                  this.mVisitedObjects[this.mVisitedObjects.length] = _loc5_;
                  if(_loc6_)
                  {
                     break;
                  }
               }
               _loc4_++;
            }
            setTarget(_loc3_);
         }
      }
      
      public function get timestamp() : Number
      {
         return this.mTimestamp;
      }
      
      public function get touches() : Vector.<Touch>
      {
         return (data as Vector.<Touch>).concat();
      }
      
      public function get shiftKey() : Boolean
      {
         return this.mShiftKey;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.mCtrlKey;
      }
   }
}
