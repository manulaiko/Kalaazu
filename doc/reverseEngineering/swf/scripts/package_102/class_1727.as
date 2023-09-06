package package_102
{
   import flash.display.BitmapData;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import net.bigpoint.darkorbit.mvc.display.class_1705;
   import package_266.class_1713;
   
   public class class_1727 extends class_1719 implements class_1705
   {
       
      
      private var mTextures:Vector.<BitmapData>;
      
      private var mSounds:Vector.<Sound>;
      
      private var mDurations:Vector.<Number>;
      
      private var mStartTimes:Vector.<Number>;
      
      private var mDefaultFrameDuration:Number = 0.03333333333333333;
      
      private var mTotalTime:Number;
      
      private var mCurrentTime:Number;
      
      private var mCurrentFrame:int;
      
      private var mLoop:Boolean;
      
      private var mPlaying:Boolean;
      
      private var var_1057:Boolean = false;
      
      private var var_1832:int = 0;
      
      public function class_1727(param1:class_1713, param2:String = "", param3:Number = 30)
      {
         super();
         this.init(param1.atlas.getTextures(param1.texture as BitmapData,param2),isNaN(param3) ? Number(this.fps) : param3);
         addEventListener(Event.ADDED_TO_STAGE,this.method_396);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_267);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         while(Boolean(this.mTextures) && this.mTextures.length > 0)
         {
            this.mTextures.pop().dispose();
         }
         removeEventListener(Event.ENTER_FRAME,this.render);
      }
      
      private function method_396(param1:Event) : void
      {
         if(!this.var_1057)
         {
            addEventListener(Event.ENTER_FRAME,this.render);
         }
      }
      
      private function method_267(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.render);
      }
      
      private function render(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         this.advanceTime((_loc2_ - Number(this.var_1832)) / 1000);
         this.var_1832 = _loc2_;
      }
      
      public function init(param1:Vector.<BitmapData>, param2:Number) : void
      {
         if(param2 <= 0)
         {
            throw new ArgumentError("Invalid fps: " + param2);
         }
         var _loc3_:int = param1.length;
         this.mDefaultFrameDuration = 1 / param2;
         this.mLoop = true;
         this.mPlaying = true;
         this.mCurrentTime = 0;
         this.mCurrentFrame = 0;
         this.mTotalTime = Number(this.mDefaultFrameDuration) * _loc3_;
         this.mTextures = param1.concat();
         this.mSounds = new Vector.<Sound>(_loc3_);
         this.mDurations = new Vector.<Number>(_loc3_);
         this.mStartTimes = new Vector.<Number>(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.mDurations[_loc4_] = this.mDefaultFrameDuration;
            this.mStartTimes[_loc4_] = _loc4_ * Number(this.mDefaultFrameDuration);
            _loc4_++;
         }
         if(param1.length > 0)
         {
            bitmapData = this.mTextures[0];
         }
      }
      
      public function addFrame(param1:BitmapData, param2:Sound = null, param3:Number = -1) : void
      {
         this.addFrameAt(this.numFrames,param1,param2,param3);
      }
      
      public function addFrameAt(param1:int, param2:BitmapData, param3:Sound = null, param4:Number = -1) : void
      {
         if(param1 < 0 || param1 > this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         if(param4 < 0)
         {
            param4 = Number(this.mDefaultFrameDuration);
         }
         this.mTextures.splice(param1,0,param2);
         this.mSounds.splice(param1,0,param3);
         this.mDurations.splice(param1,0,param4);
         this.mTotalTime += param4;
         if(param1 > 0 && param1 == this.numFrames)
         {
            this.mStartTimes[param1] = this.mStartTimes[param1 - 1] + this.mDurations[param1 - 1];
         }
         else
         {
            this.updateStartTimes();
         }
      }
      
      public function removeFrameAt(param1:int) : void
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         if(this.numFrames == 1)
         {
            throw new IllegalOperationError("Movie clip must not be empty");
         }
         this.mTotalTime -= this.getFrameDuration(param1);
         this.mTextures.splice(param1,1);
         this.mSounds.splice(param1,1);
         this.mDurations.splice(param1,1);
         this.updateStartTimes();
      }
      
      public function getFrameTexture(param1:int) : BitmapData
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         return this.mTextures[param1];
      }
      
      public function setFrameTexture(param1:int, param2:BitmapData) : void
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         this.mTextures[param1] = param2;
      }
      
      public function getFrameSound(param1:int) : Sound
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         return this.mSounds[param1];
      }
      
      public function setFrameSound(param1:int, param2:Sound) : void
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         this.mSounds[param1] = param2;
      }
      
      public function getFrameDuration(param1:int) : Number
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         return this.mDurations[param1];
      }
      
      public function setFrameDuration(param1:int, param2:Number) : void
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         this.mTotalTime -= this.getFrameDuration(param1);
         this.mTotalTime += param2;
         this.mDurations[param1] = param2;
         this.updateStartTimes();
      }
      
      public function play() : void
      {
         this.mPlaying = true;
      }
      
      public function pause() : void
      {
         this.mPlaying = false;
      }
      
      public function stop() : void
      {
         this.mPlaying = false;
         this.currentFrame = 0;
      }
      
      private function updateStartTimes() : void
      {
         var _loc1_:int = int(this.numFrames);
         this.mStartTimes.length = 0;
         this.mStartTimes[0] = 0;
         var _loc2_:int = 1;
         while(_loc2_ < _loc1_)
         {
            this.mStartTimes[_loc2_] = this.mStartTimes[_loc2_ - 1] + this.mDurations[_loc2_ - 1];
            _loc2_++;
         }
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         var _loc3_:int = int(this.mCurrentFrame);
         if(Boolean(this.mLoop) && this.mCurrentTime == this.mTotalTime)
         {
            this.mCurrentTime = 0;
            this.mCurrentFrame = 0;
         }
         if(!this.mPlaying || param1 == 0 || this.mCurrentTime == this.mTotalTime)
         {
            return;
         }
         this.mCurrentTime += param1;
         _loc2_ = this.mTextures.length - 1;
         while(this.mCurrentTime >= this.mStartTimes[this.mCurrentFrame] + this.mDurations[this.mCurrentFrame])
         {
            if(this.mCurrentFrame == _loc2_)
            {
               if(hasEventListener(Event.COMPLETE))
               {
                  _loc4_ = Number(this.mCurrentTime) - Number(this.mTotalTime);
                  this.mCurrentTime = this.mTotalTime;
                  dispatchEvent(new Event(Event.COMPLETE));
                  this.advanceTime(_loc4_);
                  return;
               }
               if(!this.mLoop)
               {
                  this.mCurrentTime = this.mTotalTime;
                  break;
               }
               this.mCurrentTime -= this.mTotalTime;
               this.mCurrentFrame = 0;
            }
            else
            {
               ++this.mCurrentFrame;
               if(_loc5_ = this.mSounds[this.mCurrentFrame])
               {
                  _loc5_.play();
               }
            }
         }
         if(this.mCurrentFrame != _loc3_)
         {
            bitmapData = this.mTextures[this.mCurrentFrame];
         }
      }
      
      public function get isComplete() : Boolean
      {
         return !this.mLoop && this.mCurrentTime >= this.mTotalTime;
      }
      
      public function get totalTime() : Number
      {
         return this.mTotalTime;
      }
      
      public function get numFrames() : int
      {
         return this.mTextures.length;
      }
      
      public function get loop() : Boolean
      {
         return this.mLoop;
      }
      
      public function set loop(param1:Boolean) : void
      {
         this.mLoop = param1;
      }
      
      public function get currentFrame() : int
      {
         return this.mCurrentFrame;
      }
      
      public function set currentFrame(param1:int) : void
      {
         this.mCurrentFrame = param1;
         this.mCurrentTime = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            this.mCurrentTime += this.getFrameDuration(_loc2_);
            _loc2_++;
         }
         bitmapData = this.mTextures[this.mCurrentFrame];
         if(this.mSounds[this.mCurrentFrame])
         {
            this.mSounds[this.mCurrentFrame].play();
         }
      }
      
      public function get fps() : Number
      {
         return 1 / Number(this.mDefaultFrameDuration);
      }
      
      public function set fps(param1:Number) : void
      {
         if(param1 <= 0)
         {
            throw new ArgumentError("Invalid fps: " + param1);
         }
         var _loc2_:Number = 1 / param1;
         var _loc3_:Number = _loc2_ / Number(this.mDefaultFrameDuration);
         this.mCurrentTime *= _loc3_;
         this.mDefaultFrameDuration = _loc2_;
         var _loc4_:int = 0;
         while(_loc4_ < this.numFrames)
         {
            this.setFrameDuration(_loc4_,Number(this.getFrameDuration(_loc4_)) * _loc3_);
            _loc4_++;
         }
      }
      
      public function get isPlaying() : Boolean
      {
         if(this.mPlaying)
         {
            return Boolean(this.mLoop) || this.mCurrentTime < this.mTotalTime;
         }
         return false;
      }
      
      public function set freezed(param1:Boolean) : void
      {
         if(this.var_1057 != param1)
         {
            this.var_1057 = param1;
            if(this.var_1057)
            {
               removeEventListener(Event.ENTER_FRAME,this.render);
            }
            else if(stage)
            {
               addEventListener(Event.ENTER_FRAME,this.render);
            }
         }
      }
   }
}
