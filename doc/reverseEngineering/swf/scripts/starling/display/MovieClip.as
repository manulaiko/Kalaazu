package starling.display
{
   import flash.errors.IllegalOperationError;
   import flash.media.Sound;
   import starling.animation.IAnimatable;
   import starling.events.Event;
   import starling.textures.Texture;
   
   public class MovieClip extends Image implements IAnimatable
   {
       
      
      private var mTextures:Vector.<Texture>;
      
      private var mSounds:Vector.<Sound>;
      
      private var mDurations:Vector.<Number>;
      
      private var mStartTimes:Vector.<Number>;
      
      private var mDefaultFrameDuration:Number;
      
      private var mCurrentTime:Number;
      
      private var mCurrentFrame:int;
      
      private var mLoop:Boolean;
      
      private var mPlaying:Boolean;
      
      private var mMuted:Boolean;
      
      public function MovieClip(param1:Vector.<Texture>, param2:Number = 12)
      {
         if(param1.length > 0)
         {
            super(param1[0]);
            this.init(param1,param2);
            return;
         }
         throw new ArgumentError("Empty texture array");
      }
      
      private function init(param1:Vector.<Texture>, param2:Number) : void
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
         this.mTextures = param1.concat();
         this.mSounds = new Vector.<Sound>(_loc3_);
         this.mDurations = new Vector.<Number>(_loc3_);
         this.mStartTimes = new Vector.<Number>(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.mDurations[_loc4_] = this.mDefaultFrameDuration;
            this.mStartTimes[_loc4_] = _loc4_ * this.mDefaultFrameDuration;
            _loc4_++;
         }
      }
      
      public function addFrame(param1:Texture, param2:Sound = null, param3:Number = -1) : void
      {
         this.addFrameAt(this.numFrames,param1,param2,param3);
      }
      
      public function addFrameAt(param1:int, param2:Texture, param3:Sound = null, param4:Number = -1) : void
      {
         if(param1 < 0 || param1 > this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         if(param4 < 0)
         {
            param4 = this.mDefaultFrameDuration;
         }
         this.mTextures.splice(param1,0,param2);
         this.mSounds.splice(param1,0,param3);
         this.mDurations.splice(param1,0,param4);
         if(param1 > 0 && param1 == this.numFrames)
         {
            this.mStartTimes[param1] = this.mStartTimes[int(param1 - 1)] + this.mDurations[int(param1 - 1)];
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
         this.mTextures.splice(param1,1);
         this.mSounds.splice(param1,1);
         this.mDurations.splice(param1,1);
         this.updateStartTimes();
      }
      
      public function getFrameTexture(param1:int) : Texture
      {
         if(param1 < 0 || param1 >= this.numFrames)
         {
            throw new ArgumentError("Invalid frame id");
         }
         return this.mTextures[param1];
      }
      
      public function setFrameTexture(param1:int, param2:Texture) : void
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
         var _loc1_:int = this.numFrames;
         this.mStartTimes.length = 0;
         this.mStartTimes[0] = 0;
         var _loc2_:int = 1;
         while(_loc2_ < _loc1_)
         {
            this.mStartTimes[_loc2_] = this.mStartTimes[int(_loc2_ - 1)] + this.mDurations[int(_loc2_ - 1)];
            _loc2_++;
         }
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc9_:* = null;
         if(!this.mPlaying || param1 <= 0)
         {
            return;
         }
         var _loc3_:int = this.mCurrentFrame;
         var _loc4_:Number = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = hasEventListener(Event.COMPLETE);
         var _loc7_:Boolean = false;
         var _loc8_:Number = this.totalTime;
         if(this.mLoop && this.mCurrentTime >= _loc8_)
         {
            this.mCurrentTime = 0;
            this.mCurrentFrame = 0;
         }
         if(this.mCurrentTime < _loc8_)
         {
            this.mCurrentTime += param1;
            _loc2_ = this.mTextures.length - 1;
            while(this.mCurrentTime > this.mStartTimes[this.mCurrentFrame] + this.mDurations[this.mCurrentFrame])
            {
               if(this.mCurrentFrame == _loc2_)
               {
                  if(this.mLoop && !_loc6_)
                  {
                     this.mCurrentTime -= _loc8_;
                     this.mCurrentFrame = 0;
                  }
                  else
                  {
                     _loc5_ = true;
                     _loc4_ = this.mCurrentTime - _loc8_;
                     _loc7_ = _loc6_;
                     this.mCurrentFrame = _loc2_;
                     this.mCurrentTime = _loc8_;
                  }
               }
               else
               {
                  ++this.mCurrentFrame;
               }
               if((Boolean(_loc9_ = this.mSounds[this.mCurrentFrame])) && !this.mMuted)
               {
                  _loc9_.play();
               }
               if(_loc5_)
               {
                  break;
               }
            }
            if(this.mCurrentFrame == _loc2_ && this.mCurrentTime == _loc8_)
            {
               _loc7_ = _loc6_;
            }
         }
         if(this.mCurrentFrame != _loc3_)
         {
            texture = this.mTextures[this.mCurrentFrame];
         }
         if(_loc7_)
         {
            dispatchEventWith(Event.COMPLETE);
         }
         if(this.mLoop && _loc4_ > 0)
         {
            this.advanceTime(_loc4_);
         }
      }
      
      public function get totalTime() : Number
      {
         var _loc1_:int = this.mTextures.length;
         return this.mStartTimes[int(_loc1_ - 1)] + this.mDurations[int(_loc1_ - 1)];
      }
      
      public function get currentTime() : Number
      {
         return this.mCurrentTime;
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
      
      public function get muted() : Boolean
      {
         return this.mMuted;
      }
      
      public function set muted(param1:Boolean) : void
      {
         this.mMuted = param1;
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
         texture = this.mTextures[this.mCurrentFrame];
         if(!this.mMuted && Boolean(this.mSounds[this.mCurrentFrame]))
         {
            this.mSounds[this.mCurrentFrame].play();
         }
      }
      
      public function get fps() : Number
      {
         return 1 / this.mDefaultFrameDuration;
      }
      
      public function set fps(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         if(param1 <= 0)
         {
            throw new ArgumentError("Invalid fps: " + param1);
         }
         var _loc2_:Number = 1 / param1;
         var _loc3_:Number = _loc2_ / this.mDefaultFrameDuration;
         this.mCurrentTime *= _loc3_;
         this.mDefaultFrameDuration = _loc2_;
         var _loc4_:int = 0;
         while(_loc4_ < this.numFrames)
         {
            _loc5_ = this.mDurations[_loc4_] * _loc3_;
            this.mDurations[_loc4_] = _loc5_;
            _loc4_++;
         }
         this.updateStartTimes();
      }
      
      public function get isPlaying() : Boolean
      {
         if(this.mPlaying)
         {
            return this.mLoop || this.mCurrentTime < this.totalTime;
         }
         return false;
      }
      
      public function get isComplete() : Boolean
      {
         return !this.mLoop && this.mCurrentTime >= this.totalTime;
      }
   }
}
