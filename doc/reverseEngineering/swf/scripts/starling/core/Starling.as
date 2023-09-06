package starling.core
{
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.Stage3D;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DTriangleFace;
   import flash.display3D.Program3D;
   import flash.errors.IllegalOperationError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TouchEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Mouse;
   import flash.ui.Multitouch;
   import flash.ui.MultitouchInputMode;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import starling.animation.Juggler;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.events.Event;
   import starling.events.EventDispatcher;
   import starling.events.KeyboardEvent;
   import starling.events.ResizeEvent;
   import starling.events.TouchPhase;
   import starling.events.TouchProcessor;
   import starling.utils.HAlign;
   import starling.utils.SystemUtil;
   import starling.utils.VAlign;
   import starling.utils.execute;
   
   public class Starling extends EventDispatcher
   {
      
      public static const VERSION:String = "1.5.1";
      
      private static const PROGRAM_DATA_NAME:String = "Starling.programs";
      
      private static var sCurrent:Starling;
      
      private static var sHandleLostContext:Boolean;
      
      private static var sContextData:Dictionary = new Dictionary(true);
      
      private static var sAll:Vector.<Starling> = new Vector.<Starling>(0);
       
      
      private var mStage3D:Stage3D;
      
      private var mStage:starling.display.Stage;
      
      private var mRootClass:Class;
      
      private var mRoot:DisplayObject;
      
      private var mJuggler:Juggler;
      
      private var mSupport:RenderSupport;
      
      private var mTouchProcessor:TouchProcessor;
      
      private var mAntiAliasing:int;
      
      private var mSimulateMultitouch:Boolean;
      
      private var mEnableErrorChecking:Boolean;
      
      private var mLastFrameTimestamp:Number;
      
      private var mLeftMouseDown:Boolean;
      
      private var mStatsDisplay:StatsDisplay;
      
      private var mShareContext:Boolean;
      
      private var mProfile:String;
      
      private var mContext:Context3D;
      
      private var mStarted:Boolean;
      
      private var mRendering:Boolean;
      
      private var mSupportHighResolutions:Boolean;
      
      private var mViewPort:Rectangle;
      
      private var mPreviousViewPort:Rectangle;
      
      private var mClippedViewPort:Rectangle;
      
      private var mNativeStage:flash.display.Stage;
      
      private var mNativeOverlay:Sprite;
      
      private var mNativeStageContentScaleFactor:Number;
      
      public function Starling(param1:Class, param2:flash.display.Stage, param3:Rectangle = null, param4:Stage3D = null, param5:String = "auto", param6:Object = "baselineConstrained")
      {
         var _loc7_:* = null;
         super();
         if(param2 == null)
         {
            throw new ArgumentError("Stage must not be null");
         }
         if(param1 == null)
         {
            throw new ArgumentError("Root class must not be null");
         }
         if(param3 == null)
         {
            param3 = new Rectangle(0,0,param2.stageWidth,param2.stageHeight);
         }
         if(param4 == null)
         {
            param4 = param2.stage3Ds[0];
         }
         SystemUtil.initialize();
         sAll.push(this);
         this.makeCurrent();
         this.mRootClass = param1;
         this.mViewPort = param3;
         this.mPreviousViewPort = new Rectangle();
         this.mStage3D = param4;
         this.mStage = new starling.display.Stage(param3.width,param3.height,param2.color);
         this.mNativeOverlay = new Sprite();
         this.mNativeStage = param2;
         this.mNativeStage.addChild(this.mNativeOverlay);
         this.mNativeStageContentScaleFactor = 1;
         this.mTouchProcessor = new TouchProcessor(this.mStage);
         this.mJuggler = new Juggler();
         this.mAntiAliasing = 0;
         this.mSimulateMultitouch = false;
         this.mEnableErrorChecking = false;
         this.mSupportHighResolutions = false;
         this.mLastFrameTimestamp = getTimer() / 1000;
         this.mSupport = new RenderSupport();
         sContextData[param4] = new Dictionary();
         sContextData[param4][PROGRAM_DATA_NAME] = new Dictionary();
         param2.scaleMode = StageScaleMode.NO_SCALE;
         param2.align = StageAlign.TOP_LEFT;
         for each(_loc7_ in this.touchEventTypes)
         {
            param2.addEventListener(_loc7_,this.onTouch,false,0,true);
         }
         param2.addEventListener(flash.events.Event.ENTER_FRAME,this.onEnterFrame,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.onKey,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_UP,this.onKey,false,0,true);
         param2.addEventListener(flash.events.Event.RESIZE,this.onResize,false,0,true);
         param2.addEventListener(flash.events.Event.MOUSE_LEAVE,this.onMouseLeave,false,0,true);
         this.mStage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,this.onContextCreated,false,10,true);
         this.mStage3D.addEventListener(ErrorEvent.ERROR,this.onStage3DError,false,10,true);
         if(Boolean(this.mStage3D.context3D) && this.mStage3D.context3D.driverInfo != "Disposed")
         {
            if(param6 == "auto" || param6 is Array)
            {
               throw new ArgumentError("When sharing the context3D, the actual profile has to be supplied");
            }
            this.mProfile = param6 as String;
            this.mShareContext = true;
            setTimeout(this.initialize,1);
         }
         else
         {
            this.mShareContext = false;
            this.requestContext3D(param4,param5,param6);
         }
      }
      
      public static function get current() : Starling
      {
         return sCurrent;
      }
      
      public static function get all() : Vector.<Starling>
      {
         return sAll;
      }
      
      public static function get context() : Context3D
      {
         return !!sCurrent ? sCurrent.context : null;
      }
      
      public static function get juggler() : Juggler
      {
         return !!sCurrent ? sCurrent.juggler : null;
      }
      
      public static function get contentScaleFactor() : Number
      {
         return !!sCurrent ? 0 : 1;
      }
      
      public static function get multitouchEnabled() : Boolean
      {
         return true;
      }
      
      public static function set multitouchEnabled(param1:Boolean) : void
      {
         if(sCurrent)
         {
            throw new IllegalOperationError("\'multitouchEnabled\' must be set before Starling instance is created");
         }
         Multitouch.inputMode = param1 ? "null" : MultitouchInputMode.NONE;
      }
      
      public static function get handleLostContext() : Boolean
      {
         return sHandleLostContext;
      }
      
      public static function set handleLostContext(param1:Boolean) : void
      {
         if(sCurrent)
         {
            throw new IllegalOperationError("\'handleLostContext\' must be set before Starling instance is created");
         }
         sHandleLostContext = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.stop(true);
         this.mNativeStage.removeEventListener(flash.events.Event.ENTER_FRAME,this.onEnterFrame,false);
         this.mNativeStage.removeEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.onKey,false);
         this.mNativeStage.removeEventListener(flash.events.KeyboardEvent.KEY_UP,this.onKey,false);
         this.mNativeStage.removeEventListener(flash.events.Event.RESIZE,this.onResize,false);
         this.mNativeStage.removeEventListener(flash.events.Event.MOUSE_LEAVE,this.onMouseLeave,false);
         this.mNativeStage.removeChild(this.mNativeOverlay);
         this.mStage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,this.onContextCreated,false);
         this.mStage3D.removeEventListener(ErrorEvent.ERROR,this.onStage3DError,false);
         for each(_loc1_ in this.touchEventTypes)
         {
            this.mNativeStage.removeEventListener(_loc1_,this.onTouch,false);
         }
         if(this.mStage)
         {
            this.mStage.dispose();
         }
         if(this.mSupport)
         {
            this.mSupport.dispose();
         }
         if(this.mTouchProcessor)
         {
            this.mTouchProcessor.dispose();
         }
         if(sCurrent == this)
         {
            sCurrent = null;
         }
         if(Boolean(this.mContext) && !this.mShareContext)
         {
            if(this.mContext.dispose.length == 0)
            {
               execute(this.mContext.dispose);
            }
            else
            {
               execute(this.mContext.dispose,false);
            }
         }
         var _loc2_:int = sAll.indexOf(this);
         if(_loc2_ != -1)
         {
            sAll.splice(_loc2_,1);
         }
      }
      
      public function requestContext3D(param1:Stage3D, param2:String, param3:Object) : void
      {
         var profiles:Array = null;
         var currentProfile:String = null;
         var requestNextProfile:Function = null;
         var onCreated:Function = null;
         var onError:Function = null;
         var stage3D:Stage3D = param1;
         var renderMode:String = param2;
         var profile:Object = param3;
         requestNextProfile = function():void
         {
            currentProfile = profiles.shift();
            try
            {
               execute(mStage3D.requestContext3D,renderMode,currentProfile);
            }
            catch(error:Error)
            {
               if(false)
               {
                  throw error;
               }
               setTimeout(requestNextProfile,1);
            }
         };
         onCreated = function(param1:Event):void
         {
            mProfile = currentProfile;
            onFinished();
         };
         onError = function(param1:Event):void
         {
            if(true)
            {
               param1.stopImmediatePropagation();
               setTimeout(requestNextProfile,1);
            }
            else
            {
               onFinished();
            }
         };
         var onFinished:Function = function():void
         {
            mStage3D.removeEventListener(Event.CONTEXT3D_CREATE,onCreated);
            mStage3D.removeEventListener(ErrorEvent.ERROR,onError);
         };
         if(profile == "auto")
         {
            profiles = ["baselineExtended","baseline","baselineConstrained"];
         }
         else if(profile is String)
         {
            profiles = [profile as String];
         }
         else
         {
            if(!(profile is Array))
            {
               throw new ArgumentError("Profile must be of type \'String\' or \'Array\'");
            }
            profiles = profile as Array;
         }
         this.mStage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,onCreated,false,100);
         this.mStage3D.addEventListener(ErrorEvent.ERROR,onError,false,100);
         requestNextProfile();
      }
      
      private function initialize() : void
      {
         this.makeCurrent();
         this.initializeGraphicsAPI();
         this.initializeRoot();
         this.mTouchProcessor.simulateMultitouch = this.mSimulateMultitouch;
         this.mLastFrameTimestamp = getTimer() / 1000;
      }
      
      private function initializeGraphicsAPI() : void
      {
         this.mContext = this.mStage3D.context3D;
         this.mContext.enableErrorChecking = this.mEnableErrorChecking;
         this.contextData[PROGRAM_DATA_NAME] = new Dictionary();
         if(this.mProfile == null)
         {
            this.mProfile = this.mContext["profile"];
         }
         this.updateViewPort(true);
         dispatchEventWith(flash.events.Event.CONTEXT3D_CREATE,false,this.mContext);
      }
      
      private function initializeRoot() : void
      {
         if(this.mRoot == null)
         {
            this.mRoot = new this.mRootClass() as DisplayObject;
            if(this.mRoot == null)
            {
               throw new Error("Invalid root class: " + this.mRootClass);
            }
            this.mStage.addChildAt(this.mRoot,0);
            dispatchEventWith(starling.events.Event.ROOT_CREATED,false,this.mRoot);
         }
      }
      
      public function nextFrame() : void
      {
         var _loc1_:Number = getTimer() / 1000;
         var _loc2_:Number = _loc1_ - this.mLastFrameTimestamp;
         this.mLastFrameTimestamp = _loc1_;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         this.advanceTime(_loc2_);
         this.render();
      }
      
      public function advanceTime(param1:Number) : void
      {
         if(!this.contextValid)
         {
            return;
         }
         this.makeCurrent();
         this.mTouchProcessor.advanceTime(param1);
         this.mStage.advanceTime(param1);
         this.mJuggler.advanceTime(param1);
      }
      
      public function render() : void
      {
         if(!this.contextValid)
         {
            return;
         }
         this.makeCurrent();
         this.updateViewPort();
         this.updateNativeOverlay();
         this.mSupport.nextFrame();
         var _loc1_:Number = this.mViewPort.width / this.mStage.stageWidth;
         var _loc2_:Number = this.mViewPort.height / this.mStage.stageHeight;
         this.mContext.setDepthTest(false,Context3DCompareMode.ALWAYS);
         this.mContext.setCulling(Context3DTriangleFace.NONE);
         this.mSupport.renderTarget = null;
         this.mSupport.setOrthographicProjection(this.mViewPort.x < 0 ? -this.mViewPort.x / _loc1_ : 0,this.mViewPort.y < 0 ? -this.mViewPort.y / _loc2_ : 0,this.mClippedViewPort.width / _loc1_,this.mClippedViewPort.height / _loc2_);
         if(!this.mShareContext)
         {
            RenderSupport.clear(this.mStage.color,1);
         }
         this.mStage.render(this.mSupport,1);
         this.mSupport.finishQuadBatch();
         if(this.mStatsDisplay)
         {
            this.mStatsDisplay.drawCount = this.mSupport.drawCount;
         }
         if(!this.mShareContext)
         {
            this.mContext.present();
         }
      }
      
      private function updateViewPort(param1:Boolean = false) : void
      {
         if(param1 || this.mPreviousViewPort.width != this.mViewPort.width || this.mPreviousViewPort.height != this.mViewPort.height || this.mPreviousViewPort.x != this.mViewPort.x || this.mPreviousViewPort.y != this.mViewPort.y)
         {
            this.mPreviousViewPort.setTo(this.mViewPort.x,this.mViewPort.y,this.mViewPort.width,this.mViewPort.height);
            this.mClippedViewPort = this.mViewPort.intersection(new Rectangle(0,0,this.mNativeStage.stageWidth,this.mNativeStage.stageHeight));
            if(!this.mShareContext)
            {
               if(this.mProfile == "baselineConstrained")
               {
                  this.configureBackBuffer(32,32,this.mAntiAliasing,false);
               }
               this.mStage3D.x = this.mClippedViewPort.x;
               this.mStage3D.y = this.mClippedViewPort.y;
               this.configureBackBuffer(this.mClippedViewPort.width,this.mClippedViewPort.height,this.mAntiAliasing,false,this.mSupportHighResolutions);
               if(this.mSupportHighResolutions && "contentsScaleFactor" in this.mNativeStage)
               {
                  this.mNativeStageContentScaleFactor = this.mNativeStage["contentsScaleFactor"];
               }
               else
               {
                  this.mNativeStageContentScaleFactor = 1;
               }
            }
         }
      }
      
      private function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false) : void
      {
         var _loc6_:Function = this.mContext.configureBackBuffer;
         var _loc7_:Array = [param1,param2,param3,param4];
         if(_loc6_.length > 4)
         {
            _loc7_.push(param5);
         }
         _loc6_.apply(this.mContext,_loc7_);
      }
      
      private function updateNativeOverlay() : void
      {
         this.mNativeOverlay.x = this.mViewPort.x;
         this.mNativeOverlay.y = this.mViewPort.y;
         this.mNativeOverlay.scaleX = this.mViewPort.width / this.mStage.stageWidth;
         this.mNativeOverlay.scaleY = this.mViewPort.height / this.mStage.stageHeight;
      }
      
      private function showFatalError(param1:String) : void
      {
         var _loc2_:TextField = new TextField();
         var _loc3_:TextFormat = new TextFormat("Verdana",12,16777215);
         _loc3_.align = TextFormatAlign.CENTER;
         _loc2_.defaultTextFormat = _loc3_;
         _loc2_.wordWrap = true;
         _loc2_.width = this.mStage.stageWidth * 0.75;
         _loc2_.autoSize = TextFieldAutoSize.CENTER;
         _loc2_.text = param1;
         _loc2_.x = (this.mStage.stageWidth - _loc2_.width) / 2;
         _loc2_.y = (this.mStage.stageHeight - _loc2_.height) / 2;
         _loc2_.background = true;
         _loc2_.backgroundColor = 4456448;
         this.updateNativeOverlay();
         this.nativeOverlay.addChild(_loc2_);
      }
      
      public function makeCurrent() : void
      {
         sCurrent = this;
      }
      
      public function start() : void
      {
         this.mRendering = true;
         this.mStarted = true;
         this.mLastFrameTimestamp = getTimer() / 1000;
      }
      
      public function stop(param1:Boolean = false) : void
      {
         this.mStarted = false;
         this.mRendering = !param1;
      }
      
      private function onStage3DError(param1:ErrorEvent) : void
      {
         var _loc2_:* = null;
         if(param1.errorID == 3702)
         {
            _loc2_ = false ? "renderMode" : "wmode";
            this.showFatalError("Context3D not available! Possible reasons: wrong " + _loc2_ + " or missing device support.");
         }
         else
         {
            this.showFatalError("Stage3D error: " + param1.text);
         }
      }
      
      private function onContextCreated(param1:flash.events.Event) : void
      {
         if(Boolean(this.mContext))
         {
            this.stop();
            param1.stopImmediatePropagation();
            this.showFatalError("Fatal error: The application lost the device context!");
         }
         else
         {
            this.initialize();
         }
      }
      
      private function onEnterFrame(param1:flash.events.Event) : void
      {
         if(!this.mShareContext)
         {
            if(this.mStarted)
            {
               this.nextFrame();
            }
            else if(this.mRendering)
            {
               this.render();
            }
         }
      }
      
      private function onKey(param1:flash.events.KeyboardEvent) : void
      {
         if(!this.mStarted)
         {
            return;
         }
         var _loc2_:starling.events.KeyboardEvent = new starling.events.KeyboardEvent(param1.type,param1.charCode,param1.keyCode,param1.keyLocation,param1.ctrlKey,param1.altKey,param1.shiftKey);
         this.makeCurrent();
         this.mStage.broadcastEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      private function onResize(param1:flash.events.Event) : void
      {
         var stageWidth:int = 0;
         var stageHeight:int = 0;
         var dispatchResizeEvent:Function = null;
         var event:flash.events.Event = param1;
         dispatchResizeEvent = function():void
         {
            makeCurrent();
            removeEventListener(Event.CONTEXT3D_CREATE,dispatchResizeEvent);
            mStage.dispatchEvent(new ResizeEvent(Event.RESIZE,stageWidth,stageHeight));
         };
         stageWidth = int(event.target.stageWidth);
         stageHeight = int(event.target.stageHeight);
         if(this.contextValid)
         {
            dispatchResizeEvent();
         }
         else
         {
            addEventListener(flash.events.Event.CONTEXT3D_CREATE,dispatchResizeEvent);
         }
      }
      
      private function onMouseLeave(param1:flash.events.Event) : void
      {
         this.mTouchProcessor.enqueueMouseLeftStage();
      }
      
      private function onTouch(param1:flash.events.Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(!this.mStarted)
         {
            return;
         }
         var _loc6_:Number = 1;
         var _loc7_:Number = 1;
         var _loc8_:Number = 1;
         if(param1 is MouseEvent)
         {
            _loc2_ = (_loc9_ = param1 as MouseEvent).stageX;
            _loc3_ = _loc9_.stageY;
            _loc4_ = 0;
            if(param1.type == MouseEvent.MOUSE_DOWN)
            {
               this.mLeftMouseDown = true;
            }
            else if(param1.type == MouseEvent.MOUSE_UP)
            {
               this.mLeftMouseDown = false;
            }
         }
         else
         {
            _loc10_ = param1 as TouchEvent;
            if(false && _loc10_.isPrimaryTouchPoint)
            {
               return;
            }
            _loc2_ = _loc10_.stageX;
            _loc3_ = _loc10_.stageY;
            _loc4_ = _loc10_.touchPointID;
            _loc6_ = _loc10_.pressure;
            _loc7_ = _loc10_.sizeX;
            _loc8_ = _loc10_.sizeY;
         }
         switch(param1.type)
         {
            case TouchEvent.TOUCH_BEGIN:
               _loc5_ = "null";
               break;
            case TouchEvent.TOUCH_MOVE:
               _loc5_ = "null";
               break;
            case TouchEvent.TOUCH_END:
               _loc5_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc5_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc5_ = "null";
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc5_ = this.mLeftMouseDown ? "null" : TouchPhase.HOVER;
         }
         _loc2_ = this.mStage.stageWidth * (_loc2_ - this.mViewPort.x) / this.mViewPort.width;
         _loc3_ = this.mStage.stageHeight * (_loc3_ - this.mViewPort.y) / this.mViewPort.height;
         this.mTouchProcessor.enqueue(_loc4_,_loc5_,_loc2_,_loc3_,_loc6_,_loc7_,_loc8_);
         if(param1.type == MouseEvent.MOUSE_UP)
         {
            this.mTouchProcessor.enqueue(_loc4_,TouchPhase.HOVER,_loc2_,_loc3_);
         }
      }
      
      private function get touchEventTypes() : Array
      {
         var _loc1_:* = [];
         if(multitouchEnabled)
         {
            _loc1_.push(TouchEvent.TOUCH_BEGIN,TouchEvent.TOUCH_MOVE,TouchEvent.TOUCH_END);
         }
         if(!multitouchEnabled || false)
         {
            _loc1_.push(MouseEvent.MOUSE_DOWN,MouseEvent.MOUSE_MOVE,MouseEvent.MOUSE_UP);
         }
         return _loc1_;
      }
      
      public function registerProgram(param1:String, param2:ByteArray, param3:ByteArray) : Program3D
      {
         this.deleteProgram(param1);
         var _loc4_:Program3D;
         (_loc4_ = this.mContext.createProgram()).upload(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function registerProgramFromSource(param1:String, param2:String, param3:String) : Program3D
      {
         this.deleteProgram(param1);
         var _loc4_:Program3D = RenderSupport.assembleAgal(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function deleteProgram(param1:String) : void
      {
         var _loc2_:Program3D = this.getProgram(param1);
         if(_loc2_)
         {
            _loc2_.dispose();
            delete this.programs[param1];
         }
      }
      
      public function getProgram(param1:String) : Program3D
      {
         return this.programs[param1] as Program3D;
      }
      
      public function hasProgram(param1:String) : Boolean
      {
         return param1 in this.programs;
      }
      
      private function get programs() : Dictionary
      {
         return this.contextData[PROGRAM_DATA_NAME];
      }
      
      public function get isStarted() : Boolean
      {
         return this.mStarted;
      }
      
      public function get juggler() : Juggler
      {
         return this.mJuggler;
      }
      
      public function get context() : Context3D
      {
         return this.mContext;
      }
      
      public function get contextData() : Dictionary
      {
         return sContextData[this.mStage3D] as Dictionary;
      }
      
      public function get backBufferWidth() : int
      {
         return this.mClippedViewPort.width;
      }
      
      public function get backBufferHeight() : int
      {
         return this.mClippedViewPort.height;
      }
      
      public function get simulateMultitouch() : Boolean
      {
         return this.mSimulateMultitouch;
      }
      
      public function set simulateMultitouch(param1:Boolean) : void
      {
         this.mSimulateMultitouch = param1;
         if(this.mContext)
         {
            this.mTouchProcessor.simulateMultitouch = param1;
         }
      }
      
      public function get enableErrorChecking() : Boolean
      {
         return this.mEnableErrorChecking;
      }
      
      public function set enableErrorChecking(param1:Boolean) : void
      {
         this.mEnableErrorChecking = param1;
         if(this.mContext)
         {
            this.mContext.enableErrorChecking = param1;
         }
      }
      
      public function get antiAliasing() : int
      {
         return this.mAntiAliasing;
      }
      
      public function set antiAliasing(param1:int) : void
      {
         if(this.mAntiAliasing != param1)
         {
            this.mAntiAliasing = param1;
            if(this.contextValid)
            {
               this.updateViewPort(true);
            }
         }
      }
      
      public function get viewPort() : Rectangle
      {
         return this.mViewPort;
      }
      
      public function set viewPort(param1:Rectangle) : void
      {
         this.mViewPort = param1.clone();
      }
      
      public function get contentScaleFactor() : Number
      {
         return this.mViewPort.width * this.mNativeStageContentScaleFactor / this.mStage.stageWidth;
      }
      
      public function get nativeOverlay() : Sprite
      {
         return this.mNativeOverlay;
      }
      
      public function get showStats() : Boolean
      {
         return Boolean(this.mStatsDisplay) && Boolean(this.mStatsDisplay.parent);
      }
      
      public function set showStats(param1:Boolean) : void
      {
         if(param1 == this.showStats)
         {
            return;
         }
         if(param1)
         {
            if(this.mStatsDisplay)
            {
               this.mStage.addChild(this.mStatsDisplay);
            }
            else
            {
               this.showStatsAt();
            }
         }
         else
         {
            this.mStatsDisplay.removeFromParent();
         }
      }
      
      public function showStatsAt(param1:String = "left", param2:String = "top", param3:Number = 1) : void
      {
         var onRootCreated:Function = null;
         var stageWidth:int = 0;
         var stageHeight:int = 0;
         var hAlign:String = param1;
         var vAlign:String = param2;
         var scale:Number = param3;
         onRootCreated = function():void
         {
            showStatsAt(hAlign,vAlign,scale);
            removeEventListener(Event.ROOT_CREATED,onRootCreated);
         };
         if(this.mContext == null)
         {
            addEventListener(starling.events.Event.ROOT_CREATED,onRootCreated);
         }
         else
         {
            if(this.mStatsDisplay == null)
            {
               this.mStatsDisplay = new StatsDisplay();
               this.mStatsDisplay.touchable = false;
               this.mStage.addChild(this.mStatsDisplay);
            }
            stageWidth = this.mStage.stageWidth;
            stageHeight = this.mStage.stageHeight;
            this.mStatsDisplay.scaleX = this.mStatsDisplay.scaleY = scale;
            if(hAlign == HAlign.LEFT)
            {
               this.mStatsDisplay.x = 0;
            }
            else if(hAlign == HAlign.RIGHT)
            {
               this.mStatsDisplay.x = stageWidth - this.mStatsDisplay.width;
            }
            else
            {
               this.mStatsDisplay.x = int((stageWidth - this.mStatsDisplay.width) / 2);
            }
            if(vAlign == VAlign.TOP)
            {
               this.mStatsDisplay.y = 0;
            }
            else if(vAlign == VAlign.BOTTOM)
            {
               this.mStatsDisplay.y = stageHeight - this.mStatsDisplay.height;
            }
            else
            {
               this.mStatsDisplay.y = int((stageHeight - this.mStatsDisplay.height) / 2);
            }
         }
      }
      
      public function get stage() : starling.display.Stage
      {
         return this.mStage;
      }
      
      public function get stage3D() : Stage3D
      {
         return this.mStage3D;
      }
      
      public function get nativeStage() : flash.display.Stage
      {
         return this.mNativeStage;
      }
      
      public function get root() : DisplayObject
      {
         return this.mRoot;
      }
      
      public function get shareContext() : Boolean
      {
         return this.mShareContext;
      }
      
      public function set shareContext(param1:Boolean) : void
      {
         this.mShareContext = param1;
      }
      
      public function get profile() : String
      {
         return this.mProfile;
      }
      
      public function get supportHighResolutions() : Boolean
      {
         return this.mSupportHighResolutions;
      }
      
      public function set supportHighResolutions(param1:Boolean) : void
      {
         if(this.mSupportHighResolutions != param1)
         {
            this.mSupportHighResolutions = param1;
            if(this.contextValid)
            {
               this.updateViewPort(true);
            }
         }
      }
      
      public function get touchProcessor() : TouchProcessor
      {
         return this.mTouchProcessor;
      }
      
      public function set touchProcessor(param1:TouchProcessor) : void
      {
         if(param1 != this.mTouchProcessor)
         {
            this.mTouchProcessor.dispose();
            this.mTouchProcessor = param1;
         }
      }
      
      public function get contextValid() : Boolean
      {
         return Boolean(this.mContext) && this.mContext.driverInfo != "Disposed";
      }
   }
}
