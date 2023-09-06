package mx.preloaders
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.RSLEvent;
   import mx.graphics.RectangularDropShadow;
   import mx.managers.ISystemManager;
   
   public class SparkDownloadProgressBar extends Sprite implements IPreloaderDisplay
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const DEFAULT_COLOR:uint = 13421772;
      
      private static const DEFAULT_COLOR_VALUE:uint = 204;
       
      
      private var _barWidth:Number;
      
      private var _bgSprite:Sprite;
      
      private var _barSprite:Sprite;
      
      private var _barFrameSprite:Sprite;
      
      private var _startTime:int;
      
      private var _showingDisplay:Boolean = false;
      
      private var _downloadComplete:Boolean = false;
      
      private var _displayStartCount:uint = 0;
      
      private var _initProgressCount:uint = 0;
      
      protected var initProgressTotal:uint = 6;
      
      private var _visible:Boolean = false;
      
      private var _backgroundAlpha:Number = 1;
      
      private var _backgroundColor:uint;
      
      private var _backgroundImage:Object;
      
      private var _backgroundSize:String = "";
      
      private var _preloader:Sprite;
      
      private var _stageHeight:Number = 375;
      
      private var _stageWidth:Number = 500;
      
      private var lastBarWidth:Number = 0;
      
      public function SparkDownloadProgressBar()
      {
         super();
      }
      
      override public function get visible() : Boolean
      {
         return this._visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(!this._visible && param1)
         {
            this.show();
         }
         else if(this._visible && !param1)
         {
            this.hide();
         }
         this._visible = param1;
      }
      
      public function get backgroundAlpha() : Number
      {
         if(!isNaN(this._backgroundAlpha))
         {
            return this._backgroundAlpha;
         }
         return 1;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
         this._backgroundAlpha = param1;
      }
      
      public function get backgroundColor() : uint
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         this._backgroundColor = param1;
      }
      
      public function get backgroundImage() : Object
      {
         return this._backgroundImage;
      }
      
      public function set backgroundImage(param1:Object) : void
      {
         this._backgroundImage = param1;
      }
      
      public function get backgroundSize() : String
      {
         return this._backgroundSize;
      }
      
      public function set backgroundSize(param1:String) : void
      {
         this._backgroundSize = param1;
      }
      
      public function set preloader(param1:Sprite) : void
      {
         this._preloader = param1;
         param1.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         param1.addEventListener(Event.COMPLETE,this.completeHandler);
         param1.addEventListener(RSLEvent.RSL_PROGRESS,this.rslProgressHandler);
         param1.addEventListener(RSLEvent.RSL_COMPLETE,this.rslCompleteHandler);
         param1.addEventListener(RSLEvent.RSL_ERROR,this.rslErrorHandler);
         param1.addEventListener(FlexEvent.INIT_PROGRESS,this.initProgressHandler);
         param1.addEventListener(FlexEvent.INIT_COMPLETE,this.initCompleteHandler);
      }
      
      public function get stageHeight() : Number
      {
         return this._stageHeight;
      }
      
      public function set stageHeight(param1:Number) : void
      {
         this._stageHeight = param1;
      }
      
      public function get stageWidth() : Number
      {
         return this._stageWidth;
      }
      
      public function set stageWidth(param1:Number) : void
      {
         this._stageWidth = param1;
      }
      
      public function initialize() : void
      {
         this._startTime = getTimer();
      }
      
      protected function createChildren() : void
      {
         var _loc8_:* = null;
         var _loc1_:Graphics = graphics;
         if(this.backgroundColor != 4294967295)
         {
            _loc1_.beginFill(this.backgroundColor,this.backgroundAlpha);
            _loc1_.drawRect(0,0,this.stageWidth,this.stageHeight);
         }
         if(this.backgroundImage != null)
         {
            this.loadBackgroundImage(this.backgroundImage);
         }
         var _loc2_:Number = Math.min(this.stageWidth - 10,207);
         var _loc4_:Number = Math.round((this.stageWidth - _loc2_) / 2);
         var _loc5_:Number = Math.round((this.stageHeight - 19) / 2);
         this._barWidth = _loc2_ - 10;
         this._bgSprite = new Sprite();
         this._barFrameSprite = new Sprite();
         this._barSprite = new Sprite();
         addChild(this._bgSprite);
         addChild(this._barFrameSprite);
         addChild(this._barSprite);
         var _loc9_:* = _loc4_ + 5;
         this._barSprite.x = _loc4_ + 5;
         this._barFrameSprite.x = _loc9_;
         _loc9_ = _loc5_ + 5;
         this._barSprite.y = _loc5_ + 5;
         this._barFrameSprite.y = _loc9_;
         _loc1_ = this._bgSprite.graphics;
         _loc1_.lineStyle(1,6513507);
         _loc1_.beginFill(15263976);
         _loc1_.drawRect(_loc4_,_loc5_,_loc2_,19);
         _loc1_.endFill();
         _loc1_.lineStyle();
         _loc1_ = graphics;
         var _loc6_:RectangularDropShadow;
         (_loc6_ = new RectangularDropShadow()).color = 0;
         _loc6_.angle = 90;
         _loc6_.alpha = 0.6;
         _loc6_.distance = 2;
         _loc6_.drawShadow(_loc1_,_loc4_,_loc5_,_loc2_,19);
         var _loc7_:uint;
         if((_loc7_ = this.getPreloaderChromeColor()) != DEFAULT_COLOR)
         {
            (_loc8_ = new ColorTransform()).redOffset = ((_loc7_ & 16711680) >> 16) - DEFAULT_COLOR_VALUE;
            _loc8_.greenOffset = ((_loc7_ & 65280) >> 8) - DEFAULT_COLOR_VALUE;
            _loc8_.blueOffset = (_loc7_ & 255) - DEFAULT_COLOR_VALUE;
            this._bgSprite.transform.colorTransform = _loc8_;
            this._barFrameSprite.transform.colorTransform = _loc8_;
            this._barSprite.transform.colorTransform = _loc8_;
         }
      }
      
      private function getPreloaderChromeColor() : uint
      {
         var _loc1_:* = null;
         _loc1_ = parent.parent as ISystemManager;
         var _loc2_:Object = !!_loc1_ ? _loc1_.info()["preloaderChromeColor"] : null;
         var _loc3_:String = _loc2_ as String;
         if(Boolean(_loc3_) && _loc3_.charAt(0) == "#")
         {
            _loc3_ = "0x" + _loc3_.substring(1);
         }
         return !!_loc3_ ? uint(_loc3_) : DEFAULT_COLOR;
      }
      
      protected function setDownloadProgress(param1:Number, param2:Number) : void
      {
         if(!this._barFrameSprite)
         {
            return;
         }
         var _loc3_:* = [16777215,16777215];
         var _loc4_:* = [0.12,0.8];
         var _loc5_:* = [11119017,12434877];
         var _loc6_:* = [1,1];
         var _loc7_:* = [0,255];
         var _loc8_:Number = Math.round(this._barWidth * Math.min(param1 / param2,1));
         var _loc10_:Graphics = this._barFrameSprite.graphics;
         var _loc11_:Matrix = new Matrix();
         _loc8_ = Math.max(_loc8_,this.lastBarWidth);
         this.lastBarWidth = _loc8_;
         _loc11_.createGradientBox(_loc8_,9,90);
         _loc10_.clear();
         _loc10_.lineStyle(1);
         _loc10_.lineGradientStyle("linear",_loc3_,_loc4_,_loc7_,_loc11_);
         _loc10_.drawRect(0,0,_loc8_,9);
         _loc10_.lineStyle(1,6513507);
         _loc10_.beginGradientFill("linear",_loc5_,_loc6_,_loc7_,_loc11_);
         _loc10_.drawRect(1,1,_loc8_ - 2,7);
         _loc10_.endFill();
         _loc10_.lineStyle(1,0,0.12);
         _loc10_.moveTo(2,8);
         _loc10_.lineTo(2,2);
         _loc10_.lineTo(_loc8_ - 2,2);
         _loc10_.lineTo(_loc8_ - 2,8);
         if(param1 == param2)
         {
            this._downloadComplete = true;
         }
      }
      
      protected function setInitProgress(param1:Number, param2:Number) : void
      {
         var _loc3_:* = [16777215,15395562];
         var _loc4_:* = [16777215,14211288];
         var _loc5_:* = [1,1];
         var _loc6_:* = [0,255];
         var _loc7_:Number = Math.round(this._barWidth * Math.min(param1 / param2,1));
         var _loc9_:Graphics = this._barSprite.graphics;
         var _loc10_:Matrix;
         (_loc10_ = new Matrix()).createGradientBox(_loc7_ - 6,7,90,2,2);
         _loc9_.clear();
         _loc9_.lineStyle(1);
         _loc9_.lineGradientStyle("linear",_loc3_,_loc5_,_loc6_,_loc10_);
         _loc9_.beginGradientFill("linear",_loc4_,_loc5_,_loc6_,_loc10_);
         _loc9_.drawRect(2,2,_loc7_ - 4,5);
         _loc9_.endFill();
         _loc9_.lineStyle(1,0,0.55);
         _loc9_.moveTo(_loc7_ - 1,2);
         _loc9_.lineTo(_loc7_ - 1,8);
      }
      
      private function show() : void
      {
         if(this.stageWidth == 0 && this.stageHeight == 0)
         {
            try
            {
               this.stageWidth = stage.stageWidth;
               this.stageHeight = stage.stageHeight;
            }
            catch(e:Error)
            {
               stageWidth = loaderInfo.width;
               stageHeight = loaderInfo.height;
            }
            if(this.stageWidth == 0 && this.stageHeight == 0)
            {
               return;
            }
         }
         this._showingDisplay = true;
         this.createChildren();
      }
      
      private function hide() : void
      {
      }
      
      protected function showDisplayForDownloading(param1:int, param2:ProgressEvent) : Boolean
      {
         return param1 > 700 && param2.bytesLoaded < param2.bytesTotal / 2;
      }
      
      protected function showDisplayForInit(param1:int, param2:int) : Boolean
      {
         return param1 > 300 && param2 == 2;
      }
      
      private function loadBackgroundImage(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(Boolean(param1) && Boolean(param1 as Class))
         {
            _loc2_ = Class(param1);
            this.initBackgroundImage(new _loc2_());
         }
         else if(Boolean(param1) && param1 is String)
         {
            try
            {
               _loc2_ = Class(getDefinitionByName(String(param1)));
            }
            catch(e:Error)
            {
            }
            if(_loc2_)
            {
               _loc3_ = new _loc2_();
               this.initBackgroundImage(_loc3_);
            }
            else
            {
               (_loc4_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.loader_completeHandler);
               _loc4_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loader_ioErrorHandler);
               (_loc5_ = new LoaderContext()).applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
               _loc4_.load(new URLRequest(String(param1)),_loc5_);
            }
         }
      }
      
      private function initBackgroundImage(param1:DisplayObject) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         addChildAt(param1,0);
         var _loc2_:Number = param1.width;
         var _loc3_:Number = param1.height;
         var _loc4_:Number = this.calcBackgroundSize();
         if(isNaN(_loc4_))
         {
            _loc7_ = 1;
            _loc8_ = 1;
         }
         else
         {
            _loc7_ = (_loc9_ = _loc4_ * 0.01) * this.stageWidth / _loc2_;
            _loc8_ = _loc9_ * this.stageHeight / _loc3_;
         }
         param1.scaleX = _loc7_;
         param1.scaleY = _loc8_;
         var _loc5_:Number = Math.round(0.5 * (this.stageWidth - _loc2_ * _loc7_));
         var _loc6_:Number = Math.round(0.5 * (this.stageHeight - _loc3_ * _loc8_));
         param1.x = _loc5_;
         param1.y = _loc6_;
         if(!isNaN(this.backgroundAlpha))
         {
            param1.alpha = this.backgroundAlpha;
         }
      }
      
      private function calcBackgroundSize() : Number
      {
         var _loc2_:int = 0;
         var _loc1_:Number = NaN;
         if(this.backgroundSize)
         {
            _loc2_ = this.backgroundSize.indexOf("%");
            if(_loc2_ != -1)
            {
               _loc1_ = Number(this.backgroundSize.substr(0,_loc2_));
            }
         }
         return _loc1_;
      }
      
      protected function progressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:uint = param1.bytesLoaded;
         var _loc3_:uint = param1.bytesTotal;
         var _loc4_:int = getTimer() - this._startTime;
         if(!this._showingDisplay && this.showDisplayForDownloading(_loc4_,param1))
         {
            this.show();
         }
         if(this._showingDisplay)
         {
            this.setDownloadProgress(param1.bytesLoaded,param1.bytesTotal);
         }
      }
      
      protected function completeHandler(param1:Event) : void
      {
      }
      
      protected function rslProgressHandler(param1:RSLEvent) : void
      {
      }
      
      protected function rslCompleteHandler(param1:RSLEvent) : void
      {
      }
      
      protected function rslErrorHandler(param1:RSLEvent) : void
      {
         this._preloader.removeEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         this._preloader.removeEventListener(Event.COMPLETE,this.completeHandler);
         this._preloader.removeEventListener(RSLEvent.RSL_PROGRESS,this.rslProgressHandler);
         this._preloader.removeEventListener(RSLEvent.RSL_COMPLETE,this.rslCompleteHandler);
         this._preloader.removeEventListener(RSLEvent.RSL_ERROR,this.rslErrorHandler);
         this._preloader.removeEventListener(FlexEvent.INIT_PROGRESS,this.initProgressHandler);
         this._preloader.removeEventListener(FlexEvent.INIT_COMPLETE,this.initCompleteHandler);
         if(!this._showingDisplay)
         {
            this.show();
            this.setDownloadProgress(100,100);
         }
         var _loc2_:ErrorField = new ErrorField(this);
         _loc2_.show(param1.errorText);
      }
      
      protected function initProgressHandler(param1:Event) : void
      {
         if(this._initProgressCount == 0)
         {
            this._startTime = getTimer();
         }
         var _loc2_:int = getTimer() - this._startTime;
         ++this._initProgressCount;
         if(!this._showingDisplay && this.showDisplayForInit(_loc2_,this._initProgressCount))
         {
            this._displayStartCount = this._initProgressCount;
            this.show();
            this.setDownloadProgress(100,100);
         }
         if(this._showingDisplay)
         {
            if(!this._downloadComplete)
            {
               this.setDownloadProgress(100,100);
            }
            this.setInitProgress(this._initProgressCount,this.initProgressTotal);
         }
      }
      
      protected function initCompleteHandler(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function loader_completeHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(LoaderInfo(param1.target).loader);
         this.initBackgroundImage(_loc2_);
      }
      
      private function loader_ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
   }
}

import flash.display.Sprite;
import flash.system.Capabilities;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import mx.preloaders.SparkDownloadProgressBar;

class ErrorField extends Sprite
{
    
   
   private var downloadProgressBar:SparkDownloadProgressBar;
   
   private const MIN_WIDTH_INCHES:int = 2;
   
   private const MAX_WIDTH_INCHES:int = 6;
   
   private const TEXT_MARGIN_PX:int = 10;
   
   function ErrorField(param1:SparkDownloadProgressBar)
   {
      super();
      this.downloadProgressBar = param1;
   }
   
   protected function get labelFormat() : TextFormat
   {
      var _loc1_:TextFormat = new TextFormat();
      _loc1_.color = 0;
      _loc1_.font = "Arial";
      _loc1_.size = 12;
      return _loc1_;
   }
   
   public function show(param1:String) : void
   {
      if(param1 == null || param1.length == 0)
      {
         return;
      }
      var _loc2_:Number = Number(this.downloadProgressBar.stageWidth);
      var _loc3_:Number = Number(this.downloadProgressBar.stageHeight);
      var _loc4_:TextField;
      (_loc4_ = new TextField()).autoSize = TextFieldAutoSize.LEFT;
      _loc4_.multiline = true;
      _loc4_.wordWrap = true;
      _loc4_.background = true;
      _loc4_.defaultTextFormat = this.labelFormat;
      _loc4_.text = param1;
      _loc4_.width = Math.max(Number(this.MIN_WIDTH_INCHES) * 0,_loc2_ - Number(this.TEXT_MARGIN_PX) * 2);
      _loc4_.width = Math.min(Number(this.MAX_WIDTH_INCHES) * 0,_loc4_.width);
      _loc4_.y = Math.max(0,_loc3_ - Number(this.TEXT_MARGIN_PX) - _loc4_.height);
      _loc4_.x = (_loc2_ - _loc4_.width) / 2;
      this.downloadProgressBar.parent.addChild(this);
      this.addChild(_loc4_);
   }
}
