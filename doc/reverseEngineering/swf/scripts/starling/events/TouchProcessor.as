package starling.events
{
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   
   public class TouchProcessor
   {
      
      private static var sUpdatedTouches:Vector.<Touch> = new Vector.<Touch>(0);
      
      private static var sHoveringTouchData:Vector.<Object> = new Vector.<Object>(0);
      
      private static var sHelperPoint:Point = new Point();
       
      
      private var mStage:Stage;
      
      private var mRoot:DisplayObject;
      
      private var mElapsedTime:Number;
      
      private var mTouchMarker:TouchMarker;
      
      private var mLastTaps:Vector.<Touch>;
      
      private var mShiftDown:Boolean = false;
      
      private var mCtrlDown:Boolean = false;
      
      private var mMultitapTime:Number = 0.3;
      
      private var mMultitapDistance:Number = 25;
      
      protected var mQueue:Vector.<Array>;
      
      protected var mCurrentTouches:Vector.<Touch>;
      
      public function TouchProcessor(param1:Stage)
      {
         super();
         this.mRoot = this.mStage = param1;
         this.mElapsedTime = 0;
         this.mCurrentTouches = new Vector.<Touch>(0);
         this.mQueue = new Vector.<Array>(0);
         this.mLastTaps = new Vector.<Touch>(0);
         this.mStage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         this.mStage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         this.monitorInterruptions(true);
      }
      
      public function dispose() : void
      {
         this.monitorInterruptions(false);
         this.mStage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         this.mStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         if(this.mTouchMarker)
         {
            this.mTouchMarker.dispose();
         }
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.mElapsedTime += param1;
         if(this.mLastTaps.length > 0)
         {
            _loc2_ = this.mLastTaps.length - 1;
            while(_loc2_ >= 0)
            {
               if(this.mElapsedTime - this.mLastTaps[_loc2_].timestamp > this.mMultitapTime)
               {
                  this.mLastTaps.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         while(this.mQueue.length > 0)
         {
            for each(_loc3_ in this.mCurrentTouches)
            {
               if(_loc3_.phase == TouchPhase.BEGAN || _loc3_.phase == TouchPhase.MOVED)
               {
                  _loc3_.phase = TouchPhase.STATIONARY;
               }
            }
            while(this.mQueue.length > 0 && !this.containsTouchWithID(sUpdatedTouches,this.mQueue[this.mQueue.length - 1][0]))
            {
               _loc4_ = this.mQueue.pop();
               _loc3_ = this.createOrUpdateTouch(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               sUpdatedTouches[sUpdatedTouches.length] = _loc3_;
            }
            this.processTouches(sUpdatedTouches,this.mShiftDown,this.mCtrlDown);
            _loc2_ = this.mCurrentTouches.length - 1;
            while(_loc2_ >= 0)
            {
               if(this.mCurrentTouches[_loc2_].phase == TouchPhase.ENDED)
               {
                  this.mCurrentTouches.splice(_loc2_,1);
               }
               _loc2_--;
            }
            sUpdatedTouches.length = 0;
         }
      }
      
      protected function processTouches(param1:Vector.<Touch>, param2:Boolean, param3:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         sHoveringTouchData.length = 0;
         var _loc4_:TouchEvent = new TouchEvent(TouchEvent.TOUCH,this.mCurrentTouches,param2,param3);
         for each(_loc5_ in param1)
         {
            if(_loc5_.phase == TouchPhase.HOVER && Boolean(_loc5_.target))
            {
               sHoveringTouchData[sHoveringTouchData.length] = {
                  "touch":_loc5_,
                  "target":_loc5_.target,
                  "bubbleChain":_loc5_.bubbleChain
               };
            }
            if(_loc5_.phase == TouchPhase.HOVER || _loc5_.phase == TouchPhase.BEGAN)
            {
               sHelperPoint.setTo(_loc5_.globalX,_loc5_.globalY);
               _loc5_.target = this.mRoot.hitTest(sHelperPoint,true);
            }
         }
         for each(_loc6_ in sHoveringTouchData)
         {
            if(_loc6_.touch.target != _loc6_.target)
            {
               _loc4_.dispatch(_loc6_.bubbleChain);
            }
         }
         for each(_loc5_ in param1)
         {
            _loc5_.dispatchEvent(_loc4_);
         }
      }
      
      public function enqueue(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : void
      {
         this.mQueue.unshift(arguments);
         if(this.mCtrlDown && this.simulateMultitouch && param1 == 0)
         {
            this.mTouchMarker.moveMarker(param3,param4,this.mShiftDown);
            this.mQueue.unshift([1,param2,this.mTouchMarker.mockX,this.mTouchMarker.mockY]);
         }
      }
      
      public function enqueueMouseLeftStage() : void
      {
         var _loc1_:Touch = this.getCurrentTouch(0);
         if(_loc1_ == null || _loc1_.phase != TouchPhase.HOVER)
         {
            return;
         }
         var _loc3_:Number = _loc1_.globalX;
         var _loc4_:Number = _loc1_.globalY;
         var _loc5_:Number = _loc1_.globalX;
         var _loc6_:Number = this.mStage.stageWidth - _loc5_;
         var _loc7_:Number = _loc1_.globalY;
         var _loc8_:Number = this.mStage.stageHeight - _loc7_;
         var _loc9_:Number;
         if((_loc9_ = Math.min(_loc5_,_loc6_,_loc7_,_loc8_)) == _loc5_)
         {
            _loc3_ = -1;
         }
         else if(_loc9_ == _loc6_)
         {
            _loc3_ = this.mStage.stageWidth + 1;
         }
         else if(_loc9_ == _loc7_)
         {
            _loc4_ = -1;
         }
         else
         {
            _loc4_ = this.mStage.stageHeight + 1;
         }
         this.enqueue(0,TouchPhase.HOVER,_loc3_,_loc4_);
      }
      
      private function createOrUpdateTouch(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : Touch
      {
         var _loc8_:Touch;
         if((_loc8_ = this.getCurrentTouch(param1)) == null)
         {
            _loc8_ = new Touch(param1);
            this.addCurrentTouch(_loc8_);
         }
         _loc8_.globalX = param3;
         _loc8_.globalY = param4;
         _loc8_.phase = param2;
         _loc8_.timestamp = this.mElapsedTime;
         _loc8_.pressure = param5;
         _loc8_.width = param6;
         _loc8_.height = param7;
         if(param2 == TouchPhase.BEGAN)
         {
            this.updateTapCount(_loc8_);
         }
         return _loc8_;
      }
      
      private function updateTapCount(param1:Touch) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc2_:* = null;
         var _loc3_:Number = this.mMultitapDistance * this.mMultitapDistance;
         for each(_loc4_ in this.mLastTaps)
         {
            if((_loc5_ = Math.pow(_loc4_.globalX - param1.globalX,2) + Math.pow(_loc4_.globalY - param1.globalY,2)) <= _loc3_)
            {
               _loc2_ = _loc4_;
               break;
            }
         }
         if(_loc2_)
         {
            param1.tapCount = _loc2_.tapCount + 1;
            this.mLastTaps.splice(this.mLastTaps.indexOf(_loc2_),1);
         }
         else
         {
            param1.tapCount = 1;
         }
         this.mLastTaps.push(param1.clone());
      }
      
      private function addCurrentTouch(param1:Touch) : void
      {
         var _loc2_:int = this.mCurrentTouches.length - 1;
         while(_loc2_ >= 0)
         {
            if(this.mCurrentTouches[_loc2_].id == param1.id)
            {
               this.mCurrentTouches.splice(_loc2_,1);
            }
            _loc2_--;
         }
         this.mCurrentTouches.push(param1);
      }
      
      private function getCurrentTouch(param1:int) : Touch
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.mCurrentTouches)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function containsTouchWithID(param1:Vector.<Touch>, param2:int) : Boolean
      {
         var _loc3_:* = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get simulateMultitouch() : Boolean
      {
         return this.mTouchMarker != null;
      }
      
      public function set simulateMultitouch(param1:Boolean) : void
      {
         if(this.simulateMultitouch == param1)
         {
            return;
         }
         if(param1)
         {
            this.mTouchMarker = new TouchMarker();
            this.mTouchMarker.visible = false;
            this.mStage.addChild(this.mTouchMarker);
         }
         else
         {
            this.mTouchMarker.removeFromParent(true);
            this.mTouchMarker = null;
         }
      }
      
      public function get multitapTime() : Number
      {
         return this.mMultitapTime;
      }
      
      public function set multitapTime(param1:Number) : void
      {
         this.mMultitapTime = param1;
      }
      
      public function get multitapDistance() : Number
      {
         return this.mMultitapDistance;
      }
      
      public function set multitapDistance(param1:Number) : void
      {
         this.mMultitapDistance = param1;
      }
      
      public function get root() : DisplayObject
      {
         return this.mRoot;
      }
      
      public function set root(param1:DisplayObject) : void
      {
         this.mRoot = param1;
      }
      
      public function get stage() : Stage
      {
         return this.mStage;
      }
      
      public function get numCurrentTouches() : int
      {
         return this.mCurrentTouches.length;
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.keyCode == 17 || param1.keyCode == 15)
         {
            _loc2_ = this.mCtrlDown;
            this.mCtrlDown = param1.type == KeyboardEvent.KEY_DOWN;
            if(this.simulateMultitouch && _loc2_ != this.mCtrlDown)
            {
               this.mTouchMarker.visible = this.mCtrlDown;
               this.mTouchMarker.moveCenter(this.mStage.stageWidth / 2,this.mStage.stageHeight / 2);
               _loc3_ = this.getCurrentTouch(0);
               _loc4_ = this.getCurrentTouch(1);
               if(_loc3_)
               {
                  this.mTouchMarker.moveMarker(_loc3_.globalX,_loc3_.globalY);
               }
               if(_loc2_ && _loc4_ && _loc4_.phase != TouchPhase.ENDED)
               {
                  this.mQueue.unshift([1,TouchPhase.ENDED,_loc4_.globalX,_loc4_.globalY]);
               }
               else if(this.mCtrlDown && Boolean(_loc3_))
               {
                  if(_loc3_.phase == TouchPhase.HOVER || _loc3_.phase == TouchPhase.ENDED)
                  {
                     this.mQueue.unshift([1,TouchPhase.HOVER,this.mTouchMarker.mockX,this.mTouchMarker.mockY]);
                  }
                  else
                  {
                     this.mQueue.unshift([1,TouchPhase.BEGAN,this.mTouchMarker.mockX,this.mTouchMarker.mockY]);
                  }
               }
            }
         }
         else if(param1.keyCode == 16)
         {
            this.mShiftDown = param1.type == KeyboardEvent.KEY_DOWN;
         }
      }
      
      private function monitorInterruptions(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            _loc2_ = getDefinitionByName("flash.name_169");
            _loc3_ = _loc2_["nativeApplication"];
            if(param1)
            {
               _loc3_.addEventListener("deactivate",this.onInterruption,false,0,true);
            }
            else
            {
               _loc3_.removeEventListener("deactivate",this.onInterruption);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function onInterruption(param1:Object) : void
      {
         var _loc2_:* = null;
         if(this.mCurrentTouches.length > 0)
         {
            for each(_loc2_ in this.mCurrentTouches)
            {
               if(_loc2_.phase == TouchPhase.BEGAN || _loc2_.phase == TouchPhase.MOVED || _loc2_.phase == TouchPhase.STATIONARY)
               {
                  _loc2_.phase = TouchPhase.ENDED;
               }
            }
            this.processTouches(this.mCurrentTouches,this.mShiftDown,this.mCtrlDown);
         }
         this.mCurrentTouches.length = 0;
         this.mQueue.length = 0;
      }
   }
}
