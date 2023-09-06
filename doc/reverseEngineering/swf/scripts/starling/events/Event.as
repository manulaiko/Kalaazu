package starling.events
{
   import flash.utils.getQualifiedClassName;
   import starling.core.starling_internal;
   import starling.utils.formatString;
   
   public class Event
   {
      
      public static const ADDED:String = "added";
      
      public static const ADDED_TO_STAGE:String = "addedToStage";
      
      public static const ENTER_FRAME:String = "enterFrame";
      
      public static const REMOVED:String = "removed";
      
      public static const REMOVED_FROM_STAGE:String = "removedFromStage";
      
      public static const TRIGGERED:String = "triggered";
      
      public static const FLATTEN:String = "flatten";
      
      public static const RESIZE:String = "resize";
      
      public static const COMPLETE:String = "complete";
      
      public static const CONTEXT3D_CREATE:String = "context3DCreate";
      
      public static const ROOT_CREATED:String = "rootCreated";
      
      public static const REMOVE_FROM_JUGGLER:String = "removeFromJuggler";
      
      public static const TEXTURES_RESTORED:String = "texturesRestored";
      
      public static const CHANGE:String = "change";
      
      public static const CANCEL:String = "cancel";
      
      public static const SCROLL:String = "scroll";
      
      public static const OPEN:String = "open";
      
      public static const CLOSE:String = "close";
      
      public static const SELECT:String = "select";
      
      private static var sEventPool:Vector.<Event> = new Vector.<Event>(0);
       
      
      private var mTarget:EventDispatcher;
      
      private var mCurrentTarget:EventDispatcher;
      
      private var mType:String;
      
      private var mBubbles:Boolean;
      
      private var mStopsPropagation:Boolean;
      
      private var mStopsImmediatePropagation:Boolean;
      
      private var mData:Object;
      
      public function Event(param1:String, param2:Boolean = false, param3:Object = null)
      {
         super();
         this.mType = param1;
         this.mBubbles = param2;
         this.mData = param3;
      }
      
      starling_internal static function fromPool(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         if(false)
         {
            return sEventPool.pop().reset(param1,param2,param3);
         }
         return new Event(param1,param2,param3);
      }
      
      starling_internal static function toPool(param1:Event) : void
      {
         var _loc2_:* = null;
         param1.mCurrentTarget = null;
         param1.mData = param1.mTarget = _loc2_;
         sEventPool[sEventPool.length] = param1;
      }
      
      public function stopPropagation() : void
      {
         this.mStopsPropagation = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.mStopsImmediatePropagation = true;
         this.mStopsPropagation = true;
      }
      
      public function toString() : String
      {
         return formatString("[{0} type=\"{1}\" bubbles={2}]",getQualifiedClassName(this).split("::").pop(),this.mType,this.mBubbles);
      }
      
      public function get bubbles() : Boolean
      {
         return this.mBubbles;
      }
      
      public function get target() : EventDispatcher
      {
         return this.mTarget;
      }
      
      public function get currentTarget() : EventDispatcher
      {
         return this.mCurrentTarget;
      }
      
      public function get type() : String
      {
         return this.mType;
      }
      
      public function get data() : Object
      {
         return this.mData;
      }
      
      function setTarget(param1:EventDispatcher) : void
      {
         this.mTarget = param1;
      }
      
      function setCurrentTarget(param1:EventDispatcher) : void
      {
         this.mCurrentTarget = param1;
      }
      
      function setData(param1:Object) : void
      {
         this.mData = param1;
      }
      
      function get stopsPropagation() : Boolean
      {
         return this.mStopsPropagation;
      }
      
      function get stopsImmediatePropagation() : Boolean
      {
         return this.mStopsImmediatePropagation;
      }
      
      starling_internal function reset(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         this.mType = param1;
         this.mBubbles = param2;
         this.mData = param3;
         var _loc4_:* = null;
         this.mCurrentTarget = null;
         this.mTarget = _loc4_;
         this.mStopsPropagation = this.mStopsImmediatePropagation = false;
         return this;
      }
   }
}
