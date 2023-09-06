package mx.preloaders
{
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.Timer;
   import mx.core.RSLItem;
   import mx.core.RSLListLoader;
   import mx.core.ResourceModuleRSLItem;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.RSLEvent;
   
   public class Preloader extends Sprite
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var displayClass:IPreloaderDisplay = null;
      
      private var timer:Timer;
      
      private var showDisplay:Boolean;
      
      private var rslListLoader:RSLListLoader;
      
      private var resourceModuleListLoader:RSLListLoader;
      
      private var rslDone:Boolean = false;
      
      private var loadingRSLs:Boolean = false;
      
      private var waitingToLoadResourceModules:Boolean = false;
      
      private var sentDocFrameReady:Boolean = false;
      
      private var app:IEventDispatcher = null;
      
      private var applicationDomain:ApplicationDomain = null;
      
      private var waitedAFrame:Boolean = false;
      
      public function Preloader()
      {
         super();
      }
      
      public function initialize(param1:Boolean, param2:Class, param3:uint, param4:Number, param5:Object, param6:String, param7:Number, param8:Number, param9:Array = null, param10:Array = null, param11:Array = null, param12:Array = null, param13:ApplicationDomain = null) : void
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         if((param9 != null || param10 != null) && param11 != null)
         {
            throw new Error("RSLs may only be specified by using libs and sizes or rslList, not both.");
         }
         this.applicationDomain = param13;
         root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         if(Boolean(param9) && param9.length > 0)
         {
            if(param11 == null)
            {
               param11 = [];
            }
            _loc14_ = param9.length;
            _loc15_ = 0;
            while(_loc15_ < _loc14_)
            {
               _loc17_ = new RSLItem(param9[_loc15_]);
               param11.push(_loc17_);
               _loc15_++;
            }
         }
         var _loc16_:* = [];
         if(Boolean(param12) && param12.length > 0)
         {
            _loc14_ = param12.length;
            _loc15_ = 0;
            while(_loc15_ < _loc14_)
            {
               _loc18_ = new ResourceModuleRSLItem(param12[_loc15_],param13);
               _loc16_.push(_loc18_);
               _loc15_++;
            }
         }
         this.rslListLoader = new RSLListLoader(param11);
         if(_loc16_.length)
         {
            this.resourceModuleListLoader = new RSLListLoader(_loc16_);
         }
         this.showDisplay = param1;
         this.timer = new Timer(10);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
         if(param1)
         {
            this.displayClass = new param2();
            this.displayClass.addEventListener(Event.COMPLETE,this.displayClassCompleteHandler);
            addChild(DisplayObject(this.displayClass));
            this.displayClass.backgroundColor = param3;
            this.displayClass.backgroundAlpha = param4;
            this.displayClass.backgroundImage = param5;
            this.displayClass.backgroundSize = param6;
            this.displayClass.stageWidth = param7;
            this.displayClass.stageHeight = param8;
            this.displayClass.initialize();
            this.displayClass.preloader = this;
            this.addEventListener(Event.ENTER_FRAME,this.waitAFrame);
         }
         if(this.rslListLoader.getItemCount() > 0)
         {
            this.rslListLoader.load(this.mx_internal::rslProgressHandler,this.mx_internal::rslCompleteHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler);
            this.loadingRSLs = true;
         }
         else if(Boolean(this.resourceModuleListLoader) && this.resourceModuleListLoader.getItemCount() > 0)
         {
            if(param13.hasDefinition("mx.resources::ResourceManager"))
            {
               this.rslListLoader = this.resourceModuleListLoader;
               this.rslListLoader.load(this.mx_internal::rslProgressHandler,this.mx_internal::rslCompleteHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler);
            }
            else
            {
               this.waitingToLoadResourceModules = true;
               this.rslDone = true;
            }
         }
         else
         {
            this.rslDone = true;
         }
      }
      
      public function registerApplication(param1:IEventDispatcher) : void
      {
         param1.addEventListener("validatePropertiesComplete",this.appProgressHandler);
         param1.addEventListener("validateSizeComplete",this.appProgressHandler);
         param1.addEventListener("validateDisplayListComplete",this.appProgressHandler);
         param1.addEventListener(FlexEvent.CREATION_COMPLETE,this.appCreationCompleteHandler);
         this.app = param1;
      }
      
      private function getByteValues() : Object
      {
         var _loc6_:int = 0;
         var _loc1_:LoaderInfo = root.loaderInfo;
         var _loc2_:int = _loc1_.bytesLoaded;
         var _loc3_:int = _loc1_.bytesTotal;
         var _loc4_:int = !!this.rslListLoader ? this.rslListLoader.getItemCount() : 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ += this.rslListLoader.getItem(_loc5_).loaded;
            _loc6_ = this.rslListLoader.getItem(_loc5_).total;
            _loc3_ += _loc6_;
            _loc5_++;
         }
         return {
            "loaded":_loc2_,
            "total":_loc3_
         };
      }
      
      private function dispatchAppEndEvent(param1:Object = null) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.INIT_COMPLETE));
         if(!this.showDisplay)
         {
            this.displayClassCompleteHandler(null);
         }
      }
      
      mx_internal function rslProgressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:int = this.rslListLoader.getIndex();
         var _loc3_:RSLItem = this.rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_PROGRESS)).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
         _loc4_.bytesLoaded = param1.bytesLoaded;
         _loc4_.bytesTotal = param1.bytesTotal;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = this.rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         dispatchEvent(_loc4_);
      }
      
      mx_internal function rslCompleteHandler(param1:Event) : void
      {
         var _loc2_:int = this.rslListLoader.getIndex();
         var _loc3_:RSLItem = this.rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_COMPLETE)).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
         _loc4_.bytesLoaded = _loc3_.total;
         _loc4_.bytesTotal = _loc3_.total;
         _loc4_.loaderInfo = param1.target as LoaderInfo;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = this.rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         dispatchEvent(_loc4_);
         if(this.loadingRSLs && this.resourceModuleListLoader && _loc2_ + 1 == _loc4_.rslTotal)
         {
            this.loadingRSLs = false;
            this.waitingToLoadResourceModules = true;
         }
         this.rslDone = _loc2_ + 1 == _loc4_.rslTotal;
      }
      
      mx_internal function rslErrorHandler(param1:ErrorEvent) : void
      {
         var _loc2_:int = this.rslListLoader.getIndex();
         var _loc3_:RSLItem = this.rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_ERROR)).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
         _loc4_.bytesLoaded = 0;
         _loc4_.bytesTotal = 0;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = this.rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         _loc4_.errorText = decodeURI(param1.text);
         dispatchEvent(_loc4_);
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         if(!root)
         {
            return;
         }
         var _loc2_:Object = this.getByteValues();
         var _loc3_:int = int(_loc2_.loaded);
         var _loc4_:int = int(_loc2_.total);
         dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,false,_loc3_,_loc4_));
         if(this.waitingToLoadResourceModules)
         {
            if(this.applicationDomain.hasDefinition("mx.resources::ResourceManager"))
            {
               this.waitingToLoadResourceModules = false;
               this.rslListLoader = this.resourceModuleListLoader;
               this.rslDone = false;
               this.rslListLoader.load(this.mx_internal::rslProgressHandler,this.mx_internal::rslCompleteHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler);
            }
         }
         if(this.rslDone && (_loc3_ >= _loc4_ && _loc4_ > 0 || _loc4_ == 0 && _loc3_ > 0 || root is MovieClip && MovieClip(root).totalFrames > 2 && MovieClip(root).framesLoaded >= 2))
         {
            if(!this.sentDocFrameReady)
            {
               if(this.showDisplay && !this.waitedAFrame)
               {
                  return;
               }
               this.sentDocFrameReady = true;
               dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DOC_FRAME_READY));
               return;
            }
            if(this.waitingToLoadResourceModules)
            {
               if(this.applicationDomain.hasDefinition("mx.resources::ResourceManager"))
               {
                  this.waitingToLoadResourceModules = false;
                  this.rslListLoader = this.resourceModuleListLoader;
                  this.rslDone = false;
                  this.rslListLoader.load(this.mx_internal::rslProgressHandler,this.mx_internal::rslCompleteHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler,this.mx_internal::rslErrorHandler);
                  return;
               }
            }
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.reset();
            dispatchEvent(new Event(Event.COMPLETE));
            dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      private function displayClassCompleteHandler(param1:Event) : void
      {
         if(this.displayClass)
         {
            this.displayClass.removeEventListener(Event.COMPLETE,this.displayClassCompleteHandler);
         }
         if(root)
         {
            root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         }
         if(this.app)
         {
            this.app.removeEventListener("validatePropertiesComplete",this.appProgressHandler);
            this.app.removeEventListener("validateSizeComplete",this.appProgressHandler);
            this.app.removeEventListener("validateDisplayListComplete",this.appProgressHandler);
            this.app.removeEventListener(FlexEvent.CREATION_COMPLETE,this.appCreationCompleteHandler);
            this.app = null;
         }
         dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DONE));
      }
      
      private function appCreationCompleteHandler(param1:FlexEvent) : void
      {
         this.dispatchAppEndEvent();
      }
      
      private function appProgressHandler(param1:Event) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
      }
      
      private function waitAFrame(param1:Event) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.waitAFrame);
         this.waitedAFrame = true;
      }
   }
}
