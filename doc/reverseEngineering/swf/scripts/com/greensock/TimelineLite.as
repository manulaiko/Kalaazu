package com.greensock
{
   import com.greensock.core.SimpleTimeline;
   import com.greensock.core.TweenCore;
   
   public class TimelineLite extends SimpleTimeline
   {
      
      public static const version:Number = 1.36;
      
      private static var _overwriteMode:int = OverwriteManager.enabled ? 0 : OverwriteManager.init(2);
       
      
      protected var _labels:Object;
      
      protected var _endCaps:Array;
      
      public function TimelineLite(param1:Object = null)
      {
         super(param1);
         this._endCaps = [];
         this._labels = {};
         this.autoRemoveChildren = Boolean(this.vars.autoRemoveChildren == true);
         _hasUpdate = Boolean(typeof this.vars.onUpdate == "function");
         if(this.vars.tweens is Array)
         {
            this.insertMultiple(this.vars.tweens,0,this.vars.align != null ? this.vars.align : "normal",!!this.vars.stagger ? Number(this.vars.stagger) : 0);
         }
      }
      
      override public function addChild(param1:TweenCore) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         if(!param1.gc && Boolean(param1.timeline))
         {
            param1.timeline.remove(param1,true);
         }
         param1.timeline = this;
         if(param1.gc)
         {
            param1.setEnabled(true,true);
         }
         setDirtyCache(true);
         var _loc2_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         var _loc3_:TweenCore = _lastChild != null ? _lastChild : this._endCaps[1];
         if(_loc3_ == null)
         {
            _loc2_ = _loc3_ = param1;
            var _loc6_:* = null;
            param1.prevNode = null;
            param1.nextNode = _loc6_;
         }
         else
         {
            _loc4_ = _loc3_;
            _loc5_ = param1.cachedStartTime;
            while(_loc4_ != null && _loc5_ <= _loc4_.cachedStartTime)
            {
               _loc4_ = _loc4_.prevNode;
            }
            if(_loc4_ == null)
            {
               _loc2_.prevNode = param1;
               param1.nextNode = _loc2_;
               param1.prevNode = null;
               _loc2_ = param1;
            }
            else
            {
               if(_loc4_.nextNode)
               {
                  _loc4_.nextNode.prevNode = param1;
               }
               else if(_loc4_ == _loc3_)
               {
                  _loc3_ = param1;
               }
               param1.prevNode = _loc4_;
               param1.nextNode = _loc4_.nextNode;
               _loc4_.nextNode = param1;
            }
         }
         if(this.gc)
         {
            this._endCaps[0] = _loc2_;
            this._endCaps[1] = _loc3_;
         }
         else
         {
            _firstChild = _loc2_;
            _lastChild = _loc3_;
         }
      }
      
      override public function remove(param1:TweenCore, param2:Boolean = false) : void
      {
         if(param1.gc)
         {
            return;
         }
         if(!param2)
         {
            param1.setEnabled(false,true);
         }
         var _loc3_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         var _loc4_:TweenCore = _lastChild != null ? _lastChild : this._endCaps[1];
         if(param1.nextNode)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         else if(_loc4_ == param1)
         {
            _loc4_ = param1.prevNode;
         }
         if(param1.prevNode)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(_loc3_ == param1)
         {
            _loc3_ = param1.nextNode;
         }
         if(this.gc)
         {
            this._endCaps[0] = _loc3_;
            this._endCaps[1] = _loc4_;
         }
         else
         {
            _firstChild = _loc3_;
            _lastChild = _loc4_;
         }
         setDirtyCache(true);
      }
      
      public function insert(param1:TweenCore, param2:* = 0) : void
      {
         if(typeof param2 == "string")
         {
            if(!(param2 in this._labels))
            {
               this.addLabel(param2,this.duration);
            }
            param2 = Number(this._labels[param2]);
         }
         param1.cachedStartTime = Number(param2) + param1.delay;
         this.addChild(param1);
      }
      
      public function append(param1:TweenCore, param2:Number = 0) : void
      {
         this.insert(param1,this.duration + param2);
      }
      
      public function prepend(param1:TweenCore, param2:Boolean = false) : void
      {
         this.shiftChildren(param1.totalDuration / param1.cachedTimeScale + param1.delay,param2,0);
         this.insert(param1,0);
      }
      
      public function insertMultiple(param1:Array, param2:* = 0, param3:String = "normal", param4:Number = 0) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:Number = Number(Number(param2) || false);
         var _loc8_:uint = param1.length;
         if(typeof param2 == "string")
         {
            if(!(param2 in this._labels))
            {
               this.addLabel(param2,this.duration);
            }
            _loc7_ = Number(this._labels[param2]);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc6_ = param1[_loc5_] as TweenCore;
            this.insert(_loc6_,_loc7_);
            if(param3 == "sequence")
            {
               _loc7_ = _loc6_.cachedStartTime + _loc6_.totalDuration / _loc6_.cachedTimeScale;
            }
            else if(param3 == "start")
            {
               _loc6_.cachedStartTime -= _loc6_.delay;
            }
            _loc7_ += param4;
            _loc5_++;
         }
      }
      
      public function appendMultiple(param1:Array, param2:Number = 0, param3:String = "normal", param4:Number = 0) : void
      {
         this.insertMultiple(param1,this.duration + param2,param3,param4);
      }
      
      public function prependMultiple(param1:Array, param2:String = "normal", param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc5_:TimelineLite = new TimelineLite({
            "tweens":param1,
            "align":param2,
            "stagger":param3
         });
         this.shiftChildren(_loc5_.duration,param4,0);
         this.insertMultiple(param1,0,param2,param3);
         _loc5_.kill();
      }
      
      public function addLabel(param1:String, param2:Number) : void
      {
         this._labels[param1] = param2;
      }
      
      public function removeLabel(param1:String) : Number
      {
         var _loc2_:Number = Number(this._labels[param1]);
         delete this._labels[param1];
         return _loc2_;
      }
      
      public function getLabelTime(param1:String) : Number
      {
         return param1 in this._labels ? Number(this._labels[param1]) : -1;
      }
      
      protected function parseTimeOrLabel(param1:*) : Number
      {
         if(typeof param1 == "string")
         {
            if(!(param1 in this._labels))
            {
               throw new Error("TimelineLite error: the " + param1 + " label was not found.");
            }
            return this.getLabelTime(String(param1));
         }
         return Number(param1);
      }
      
      public function stop() : void
      {
         this.paused = true;
      }
      
      public function gotoAndPlay(param1:*, param2:Boolean = true) : void
      {
         setTotalTime(this.parseTimeOrLabel(param1),param2);
         play();
      }
      
      public function gotoAndStop(param1:*, param2:Boolean = true) : void
      {
         setTotalTime(this.parseTimeOrLabel(param1),param2);
         this.paused = true;
      }
      
      public function goto(param1:*, param2:Boolean = true) : void
      {
         setTotalTime(this.parseTimeOrLabel(param1),param2);
      }
      
      override public function renderTime(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = false;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         if(this.gc)
         {
            this.setEnabled(true,false);
         }
         else if(!this.active && !this.cachedPaused)
         {
            this.active = true;
         }
         var _loc4_:Number = this.cacheIsDirty ? this.totalDuration : this.cachedTotalDuration;
         var _loc5_:Number = this.cachedTime;
         var _loc6_:Number = this.cachedStartTime;
         var _loc7_:Number = this.cachedTimeScale;
         var _loc13_:Boolean = this.cachedPaused;
         if(param1 >= _loc4_)
         {
            if(_rawPrevTime <= _loc4_ && _rawPrevTime != param1)
            {
               this.cachedTotalTime = this.cachedTime = _loc4_;
               this.forceChildrenToEnd(_loc4_,param2);
               _loc9_ = !this.hasPausedChild();
               _loc10_ = true;
               if(this.cachedDuration == 0 && _loc9_ && (param1 == 0 || _rawPrevTime < 0))
               {
                  param3 = true;
               }
            }
         }
         else if(param1 <= 0)
         {
            if(param1 < 0)
            {
               this.active = false;
               if(this.cachedDuration == 0 && _rawPrevTime > 0)
               {
                  param3 = true;
                  _loc9_ = true;
               }
            }
            if(_rawPrevTime >= 0 && _rawPrevTime != param1)
            {
               this.forceChildrenToBeginning(0,param2);
               this.cachedTotalTime = 0;
               this.cachedTime = 0;
               _loc10_ = true;
               if(this.cachedReversed)
               {
                  _loc9_ = true;
               }
            }
         }
         else
         {
            this.cachedTotalTime = this.cachedTime = param1;
         }
         _rawPrevTime = param1;
         if(this.cachedTime == _loc5_ && !param3)
         {
            return;
         }
         if(!this.initted)
         {
            this.initted = true;
         }
         if(_loc5_ == 0 && this.vars.onStart && this.cachedTime != 0 && !param2)
         {
            this.vars.onStart.apply(null,this.vars.onStartParams);
         }
         if(!_loc10_)
         {
            if(this.cachedTime - _loc5_ > 0)
            {
               _loc8_ = _firstChild;
               while(true)
               {
                  if(_loc8_)
                  {
                     _loc11_ = _loc8_.nextNode;
                     if(!(this.cachedPaused && !_loc13_))
                     {
                        continue;
                     }
                  }
               }
            }
            else
            {
               _loc8_ = _lastChild;
               while(_loc8_)
               {
                  _loc11_ = _loc8_.prevNode;
                  if(this.cachedPaused && !_loc13_)
                  {
                     break;
                  }
                  if(_loc8_.active || !_loc8_.cachedPaused && _loc8_.cachedStartTime <= _loc5_ && !_loc8_.gc)
                  {
                     if(!_loc8_.cachedReversed)
                     {
                        _loc8_.renderTime((this.cachedTime - _loc8_.cachedStartTime) * _loc8_.cachedTimeScale,param2,false);
                     }
                     else
                     {
                        _loc12_ = _loc8_.cacheIsDirty ? _loc8_.totalDuration : _loc8_.cachedTotalDuration;
                        _loc8_.renderTime(_loc12_ - (this.cachedTime - _loc8_.cachedStartTime) * _loc8_.cachedTimeScale,param2,false);
                     }
                  }
                  _loc8_ = _loc11_;
               }
            }
         }
         if(_hasUpdate && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc9_ && (_loc6_ == this.cachedStartTime || _loc7_ != this.cachedTimeScale))
         {
            complete(true,param2);
         }
      }
      
      protected function forceChildrenToBeginning(param1:Number, param2:Boolean = false) : Number
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc3_:TweenCore = _lastChild;
         var _loc6_:Boolean = this.cachedPaused;
         while(_loc3_)
         {
            _loc4_ = _loc3_.prevNode;
            if(this.cachedPaused && !_loc6_)
            {
               break;
            }
            if(_loc3_.active || !_loc3_.cachedPaused && !_loc3_.gc && (_loc3_.cachedTotalTime != 0 || _loc3_.cachedDuration == 0))
            {
               if(param1 == 0 && (_loc3_.cachedDuration != 0 || _loc3_.cachedStartTime == 0))
               {
                  _loc3_.renderTime(_loc3_.cachedReversed ? _loc3_.cachedTotalDuration : 0,param2,false);
               }
               else if(!_loc3_.cachedReversed)
               {
                  _loc3_.renderTime((param1 - _loc3_.cachedStartTime) * _loc3_.cachedTimeScale,param2,false);
               }
               else
               {
                  _loc5_ = _loc3_.cacheIsDirty ? _loc3_.totalDuration : _loc3_.cachedTotalDuration;
                  _loc3_.renderTime(_loc5_ - (param1 - _loc3_.cachedStartTime) * _loc3_.cachedTimeScale,param2,false);
               }
            }
            _loc3_ = _loc4_;
         }
         return param1;
      }
      
      protected function forceChildrenToEnd(param1:Number, param2:Boolean = false) : Number
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc3_:TweenCore = _firstChild;
         var _loc6_:Boolean = this.cachedPaused;
         while(_loc3_)
         {
            _loc4_ = _loc3_.nextNode;
            if(this.cachedPaused && !_loc6_)
            {
               break;
            }
            if(_loc3_.active || !_loc3_.cachedPaused && !_loc3_.gc && (_loc3_.cachedTotalTime != _loc3_.cachedTotalDuration || _loc3_.cachedDuration == 0))
            {
               if(param1 == this.cachedDuration && (_loc3_.cachedDuration != 0 || _loc3_.cachedStartTime == this.cachedDuration))
               {
                  _loc3_.renderTime(_loc3_.cachedReversed ? 0 : _loc3_.cachedTotalDuration,param2,false);
               }
               else if(!_loc3_.cachedReversed)
               {
                  _loc3_.renderTime((param1 - _loc3_.cachedStartTime) * _loc3_.cachedTimeScale,param2,false);
               }
               else
               {
                  _loc5_ = _loc3_.cacheIsDirty ? _loc3_.totalDuration : _loc3_.cachedTotalDuration;
                  _loc3_.renderTime(_loc5_ - (param1 - _loc3_.cachedStartTime) * _loc3_.cachedTimeScale,param2,false);
               }
            }
            _loc3_ = _loc4_;
         }
         return param1;
      }
      
      public function hasPausedChild() : Boolean
      {
         var _loc1_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         while(_loc1_)
         {
            if(_loc1_.cachedPaused || _loc1_ is TimelineLite && (_loc1_ as TimelineLite).hasPausedChild())
            {
               return true;
            }
            _loc1_ = _loc1_.nextNode;
         }
         return false;
      }
      
      public function getChildren(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true, param4:Number = -9999999999) : Array
      {
         var _loc5_:* = [];
         var _loc6_:Number = 0;
         var _loc7_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         while(_loc7_)
         {
            if(_loc7_.cachedStartTime >= param4)
            {
               if(_loc7_ is TweenLite)
               {
                  if(param2)
                  {
                     var _loc8_:*;
                     _loc5_[_loc8_ = _loc6_++] = _loc7_;
                  }
               }
               else
               {
                  if(param3)
                  {
                     _loc5_[_loc8_ = _loc6_++] = _loc7_;
                  }
                  if(param1)
                  {
                     _loc5_ = _loc5_.concat(TimelineLite(_loc7_).getChildren(true,param2,param3));
                  }
               }
            }
            _loc7_ = _loc7_.nextNode;
         }
         return _loc5_;
      }
      
      public function getTweensOf(param1:Object, param2:Boolean = true) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = this.getChildren(param2,true,false);
         var _loc4_:* = [];
         var _loc6_:uint = _loc3_.length;
         var _loc7_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if(TweenLite(_loc3_[_loc5_]).target == param1)
            {
               var _loc8_:*;
               _loc4_[_loc8_ = _loc7_++] = _loc3_[_loc5_];
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function shiftChildren(param1:Number, param2:Boolean = false, param3:Number = 0) : void
      {
         var _loc5_:* = null;
         var _loc4_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         while(_loc4_)
         {
            if(_loc4_.cachedStartTime >= param3)
            {
               _loc4_.cachedStartTime += param1;
            }
            _loc4_ = _loc4_.nextNode;
         }
         if(param2)
         {
            for(_loc5_ in this._labels)
            {
               if(this._labels[_loc5_] >= param3)
               {
                  this._labels[_loc5_] += param1;
               }
            }
         }
         this.setDirtyCache(true);
      }
      
      public function killTweensOf(param1:Object, param2:Boolean = true, param3:Object = null) : Boolean
      {
         var _loc6_:* = null;
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = this.getTweensOf(param1,param2)).length;
         while(--_loc5_ > -1)
         {
            _loc6_ = _loc4_[_loc5_];
            if(param3 != null)
            {
               _loc6_.killVars(param3);
            }
            if(param3 == null || _loc6_.cachedPT1 == null && _loc6_.initted)
            {
               _loc6_.setEnabled(false,false);
            }
         }
         return Boolean(_loc4_.length > 0);
      }
      
      override public function invalidate() : void
      {
         var _loc1_:TweenCore = _firstChild != null ? _firstChild : this._endCaps[0];
         while(_loc1_)
         {
            _loc1_.invalidate();
            _loc1_ = _loc1_.nextNode;
         }
      }
      
      public function clear(param1:Array = null) : void
      {
         if(param1 == null)
         {
            param1 = this.getChildren(false,true,true);
         }
         var _loc2_:int = param1.length;
         while(--_loc2_ > -1)
         {
            TweenCore(param1[_loc2_]).setEnabled(false,false);
         }
      }
      
      override public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:* = null;
         if(param1 == this.gc)
         {
            if(param1)
            {
               _firstChild = _loc3_ = this._endCaps[0];
               _lastChild = this._endCaps[1];
            }
            else
            {
               _loc3_ = _firstChild;
               this._endCaps = [_firstChild,_lastChild];
               var _loc5_:* = null;
               _lastChild = null;
               _firstChild = _loc5_;
            }
            while(_loc3_)
            {
               _loc3_.setEnabled(param1,true);
               _loc3_ = _loc3_.nextNode;
            }
         }
         return super.setEnabled(param1,param2);
      }
      
      public function get currentProgress() : Number
      {
         return this.cachedTime / this.duration;
      }
      
      public function set currentProgress(param1:Number) : void
      {
         setTotalTime(this.duration * param1,false);
      }
      
      override public function get duration() : Number
      {
         var _loc1_:Number = NaN;
         if(this.cacheIsDirty)
         {
            _loc1_ = this.totalDuration;
         }
         return this.cachedDuration;
      }
      
      override public function set duration(param1:Number) : void
      {
         if(this.duration != 0 && param1 != 0)
         {
            this.timeScale = this.duration / param1;
         }
      }
      
      override public function get totalDuration() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         if(this.cacheIsDirty)
         {
            _loc1_ = 0;
            _loc3_ = _firstChild != null ? _firstChild : this._endCaps[0];
            _loc4_ = -Infinity;
            while(_loc3_)
            {
               _loc5_ = _loc3_.nextNode;
               if(_loc3_.cachedStartTime < _loc4_)
               {
                  this.addChild(_loc3_);
                  _loc4_ = _loc3_.prevNode.cachedStartTime;
               }
               else
               {
                  _loc4_ = _loc3_.cachedStartTime;
               }
               if(_loc3_.cachedStartTime < 0)
               {
                  _loc1_ -= _loc3_.cachedStartTime;
                  this.shiftChildren(-_loc3_.cachedStartTime,false,-9999999999);
               }
               _loc2_ = _loc3_.cachedStartTime + _loc3_.totalDuration / _loc3_.cachedTimeScale;
               if(_loc2_ > _loc1_)
               {
                  _loc1_ = _loc2_;
               }
               _loc3_ = _loc5_;
            }
            this.cachedDuration = this.cachedTotalDuration = _loc1_;
            this.cacheIsDirty = false;
         }
         return this.cachedTotalDuration;
      }
      
      override public function set totalDuration(param1:Number) : void
      {
         if(this.totalDuration != 0 && param1 != 0)
         {
            this.timeScale = this.totalDuration / param1;
         }
      }
      
      public function get timeScale() : Number
      {
         return this.cachedTimeScale;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         var _loc2_:Number = Boolean(_pauseTime) || _pauseTime == 0 ? _pauseTime : this.timeline.cachedTotalTime;
         this.cachedStartTime = _loc2_ - (_loc2_ - this.cachedStartTime) * this.cachedTimeScale / param1;
         this.cachedTimeScale = param1;
         setDirtyCache(false);
      }
      
      public function get useFrames() : Boolean
      {
         var _loc1_:SimpleTimeline = this.timeline;
         while(_loc1_.timeline)
         {
            _loc1_ = _loc1_.timeline;
         }
         return Boolean(_loc1_ == TweenLite.rootFramesTimeline);
      }
      
      override public function get rawTime() : Number
      {
         if(this.cachedTotalTime != 0 && this.cachedTotalTime != this.cachedTotalDuration)
         {
            return this.cachedTotalTime;
         }
         return (this.timeline.rawTime - this.cachedStartTime) * this.cachedTimeScale;
      }
   }
}
