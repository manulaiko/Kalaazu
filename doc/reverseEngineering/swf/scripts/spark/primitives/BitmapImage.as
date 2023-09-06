package spark.primitives
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import mx.core.FlexGlobals;
   import mx.core.IInvalidating;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.graphics.BitmapFillMode;
   import mx.graphics.BitmapScaleMode;
   import mx.graphics.BitmapSmoothingQuality;
   import mx.utils.DensityUtil;
   import mx.utils.LoaderUtil;
   import spark.core.ContentRequest;
   import spark.core.DisplayObjectSharingMode;
   import spark.core.IContentLoader;
   import spark.layouts.HorizontalAlign;
   import spark.layouts.VerticalAlign;
   import spark.primitives.supportClasses.GraphicElement;
   import spark.utils.MultiDPIBitmapSource;
   
   public class BitmapImage extends GraphicElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var matrix:Matrix = new Matrix();
       
      
      private var _scaleGridBottom:Number;
      
      private var _scaleGridLeft:Number;
      
      private var _scaleGridRight:Number;
      
      private var _scaleGridTop:Number;
      
      private var bitmapDataCreated:Boolean;
      
      private var cachedSourceGrid:Array;
      
      private var cachedDestGrid:Array;
      
      private var imageWidth:Number = NaN;
      
      private var imageHeight:Number = NaN;
      
      private var loadedContent:DisplayObject;
      
      private var loadingContent:Object;
      
      private var previousUnscaledWidth:Number;
      
      private var previousUnscaledHeight:Number;
      
      private var sourceInvalid:Boolean;
      
      private var loadFailed:Boolean;
      
      private var _bitmapData:BitmapData;
      
      private var _bytesLoaded:Number = NaN;
      
      private var _bytesTotal:Number = NaN;
      
      private var _clearOnLoad:Boolean = true;
      
      private var _contentLoaderGrouping:String;
      
      private var _contentLoader:IContentLoader;
      
      private var contentLoaderInvalid:Boolean;
      
      protected var _fillMode:String = "scale";
      
      private var _horizontalAlign:String = "center";
      
      private var _preliminaryHeight:Number = NaN;
      
      private var _preliminaryWidth:Number = NaN;
      
      private var _scaleMode:String = "stretch";
      
      private var _smooth:Boolean = false;
      
      private var _smoothingQuality:String = "default";
      
      private var _source:Object;
      
      private var _trustedSource:Boolean = true;
      
      private var _verticalAlign:String = "middle";
      
      public function BitmapImage()
      {
         super();
         layoutDirection = "ltr";
      }
      
      protected static function resample(param1:BitmapData, param2:uint, param3:uint) : BitmapData
      {
         var _loc4_:Number = Math.max(param2 / param1.width,param3 / param1.height);
         var _loc5_:BitmapData = param1;
         if(_loc4_ > 1)
         {
            (_loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,0)).draw(param1,new Matrix(_loc4_,0,0,_loc4_),null,null,null,true);
            return _loc5_;
         }
         var _loc7_:Number = _loc4_;
         while(_loc7_ / 0.5 < 1)
         {
            _loc7_ /= 0.5;
         }
         var _loc8_:Number = Math.floor(param1.width * _loc7_);
         var _loc9_:Number = Math.floor(param1.height * _loc7_);
         var _loc10_:BitmapData;
         (_loc10_ = new BitmapData(_loc8_,_loc9_,param1.transparent,0)).draw(_loc5_,new Matrix(_loc7_,0,0,_loc7_),null,null,null,true);
         _loc5_ = _loc10_;
         var _loc11_:Number = _loc7_ * 0.5;
         while(Math.round(_loc11_ * 1000) >= Math.round(_loc4_ * 1000))
         {
            _loc8_ = Math.floor(param1.width * _loc11_);
            _loc9_ = Math.floor(param1.height * _loc11_);
            (_loc10_ = new BitmapData(_loc8_,_loc9_,param1.transparent,0)).draw(_loc5_,new Matrix(0.5,0,0,0.5),null,null,null,true);
            _loc5_.dispose();
            _loc5_ = _loc10_;
            _loc11_ *= 0.5;
         }
         return _loc5_;
      }
      
      public function get bitmapData() : BitmapData
      {
         return !!this._bitmapData ? this._bitmapData.clone() : this._bitmapData;
      }
      
      public function get bytesLoaded() : Number
      {
         return this._bytesLoaded;
      }
      
      public function get bytesTotal() : Number
      {
         return this._bytesTotal;
      }
      
      public function get clearOnLoad() : Boolean
      {
         return this._clearOnLoad;
      }
      
      public function set clearOnLoad(param1:Boolean) : void
      {
         this._clearOnLoad = param1;
      }
      
      public function get contentLoaderGrouping() : String
      {
         return this._contentLoaderGrouping;
      }
      
      public function set contentLoaderGrouping(param1:String) : void
      {
         if(param1 != this._contentLoaderGrouping)
         {
            this._contentLoaderGrouping = param1;
            invalidateProperties();
         }
      }
      
      public function get contentLoader() : IContentLoader
      {
         return this._contentLoader;
      }
      
      public function set contentLoader(param1:IContentLoader) : void
      {
         if(param1 != this._contentLoader)
         {
            this._contentLoader = param1;
            this.contentLoaderInvalid = true;
            invalidateProperties();
         }
      }
      
      public function get fillMode() : String
      {
         return this._fillMode;
      }
      
      public function set fillMode(param1:String) : void
      {
         if(param1 != this._fillMode)
         {
            this._fillMode = param1;
            invalidateDisplayList();
         }
      }
      
      public function get horizontalAlign() : String
      {
         return this._horizontalAlign;
      }
      
      public function set horizontalAlign(param1:String) : void
      {
         if(param1 == this._horizontalAlign)
         {
            return;
         }
         this._horizontalAlign = param1;
         invalidateDisplayList();
      }
      
      private function getHorizontalAlignValue() : Number
      {
         if(this._horizontalAlign == HorizontalAlign.LEFT)
         {
            return 0;
         }
         if(this._horizontalAlign == HorizontalAlign.RIGHT)
         {
            return 1;
         }
         return 0.5;
      }
      
      public function get preliminaryHeight() : Number
      {
         return this._preliminaryHeight;
      }
      
      public function set preliminaryHeight(param1:Number) : void
      {
         if(param1 != this._preliminaryHeight)
         {
            this._preliminaryHeight = param1;
            invalidateSize();
         }
      }
      
      public function get preliminaryWidth() : Number
      {
         return this._preliminaryWidth;
      }
      
      public function set preliminaryWidth(param1:Number) : void
      {
         if(param1 != this._preliminaryWidth)
         {
            this._preliminaryWidth = param1;
            invalidateSize();
         }
      }
      
      public function get scaleMode() : String
      {
         return this._scaleMode;
      }
      
      public function set scaleMode(param1:String) : void
      {
         if(param1 == this._scaleMode)
         {
            return;
         }
         this._scaleMode = param1;
         invalidateDisplayList();
      }
      
      public function set smooth(param1:Boolean) : void
      {
         if(param1 != this._smooth)
         {
            this._smooth = param1;
            invalidateDisplayList();
         }
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set smoothingQuality(param1:String) : void
      {
         if(param1 != this._smoothingQuality)
         {
            this._smoothingQuality = param1;
            invalidateDisplayList();
         }
      }
      
      public function get smoothingQuality() : String
      {
         return this._smoothingQuality;
      }
      
      [Bindable("sourceChanged")]
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         if(param1 != this._source)
         {
            this.clearLoadingContent();
            this.removeAddedToStageHandler(this._source);
            this._source = param1;
            this.sourceInvalid = true;
            this.loadFailed = false;
            invalidateProperties();
            dispatchEvent(new Event("sourceChanged"));
         }
      }
      
      public function get sourceHeight() : Number
      {
         return this.imageHeight;
      }
      
      public function get sourceWidth() : Number
      {
         return this.imageWidth;
      }
      
      public function get trustedSource() : Boolean
      {
         return this._trustedSource;
      }
      
      public function get verticalAlign() : String
      {
         return this._verticalAlign;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         if(param1 == this._verticalAlign)
         {
            return;
         }
         this._verticalAlign = param1;
         invalidateDisplayList();
      }
      
      private function getVerticalAlignValue() : Number
      {
         if(this._verticalAlign == VerticalAlign.TOP)
         {
            return 0;
         }
         if(this._verticalAlign == VerticalAlign.BOTTOM)
         {
            return 1;
         }
         return 0.5;
      }
      
      override protected function commitProperties() : void
      {
         this.mx_internal::validateSource();
         super.commitProperties();
      }
      
      override protected function measure() : void
      {
         var _loc3_:* = false;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Number = 1;
         var _loc2_:Object = FlexGlobals.topLevelApplication;
         if("applicationDPI" in _loc2_ && "runtimeDPI" in _loc2_ && this.source is MultiDPIBitmapSource)
         {
            _loc1_ = Number(_loc2_.runtimeDPI) / Number(_loc2_.applicationDPI);
         }
         if(this.loadedContent)
         {
            measuredWidth = this.imageWidth;
            measuredHeight = this.imageHeight;
            if(_loc1_ != 1)
            {
               measuredWidth /= _loc1_;
               measuredHeight /= _loc1_;
            }
         }
         else
         {
            if(!this._bitmapData)
            {
               _loc3_ = !(this._source == null || this._source == "" || this.loadFailed);
               _loc4_ = _loc3_ ? measuredWidth : 0;
               _loc5_ = _loc3_ ? measuredHeight : 0;
               measuredWidth = !isNaN(this._preliminaryWidth) && _loc4_ == 0 ? this._preliminaryWidth : _loc4_;
               measuredHeight = !isNaN(this._preliminaryHeight) && _loc5_ == 0 ? this._preliminaryHeight : _loc5_;
               return;
            }
            measuredWidth = this._bitmapData.width;
            measuredHeight = this._bitmapData.height;
            if(_loc1_ != 1)
            {
               measuredWidth /= _loc1_;
               measuredHeight /= _loc1_;
            }
         }
         if(this.maintainAspectRatio && measuredWidth > 0 && measuredHeight > 0)
         {
            if(!isNaN(explicitWidth) && isNaN(explicitHeight) && isNaN(percentHeight))
            {
               measuredHeight = explicitWidth / measuredWidth * measuredHeight;
            }
            else if(!isNaN(explicitHeight) && isNaN(explicitWidth) && isNaN(percentWidth))
            {
               measuredWidth = explicitHeight / measuredHeight * measuredWidth;
            }
            else if(!isNaN(percentWidth) && isNaN(explicitHeight) && isNaN(percentHeight) && width > 0)
            {
               measuredHeight = width / measuredWidth * measuredHeight;
            }
            else if(!isNaN(percentHeight) && isNaN(explicitWidth) && isNaN(percentWidth) && height > 0)
            {
               measuredWidth = height / measuredHeight * measuredWidth;
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Boolean = false;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:* = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:int = 0;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:int = 0;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = param2;
         var _loc4_:Number = param1;
         var _loc5_:Boolean = this._fillMode == BitmapFillMode.SCALE && this._scaleMode == BitmapScaleMode.ZOOM;
         var _loc6_:Number = param1 / param2;
         var _loc7_:Number = this.imageWidth / this.imageHeight;
         if(this.maintainAspectRatio)
         {
            if(!isNaN(_loc7_))
            {
               if(_loc7_ > _loc6_)
               {
                  _loc3_ = param1 / _loc7_;
               }
               else
               {
                  _loc4_ = param2 * _loc7_;
               }
               if(!isNaN(percentWidth) && isNaN(percentHeight) && isNaN(explicitHeight) || !isNaN(percentHeight) && isNaN(percentWidth) && isNaN(explicitWidth))
               {
                  if(_loc6_ != _loc7_)
                  {
                     invalidateSize();
                     return;
                  }
               }
            }
         }
         if(!this._bitmapData || !drawnDisplayObject || !(drawnDisplayObject is Sprite))
         {
            if(this.loadedContent)
            {
               if(this._fillMode == BitmapFillMode.SCALE)
               {
                  this.loadedContent.width = _loc4_;
                  this.loadedContent.height = _loc3_;
               }
               this.loadedContent.y = this.loadedContent.x = 0;
               if(this.maintainAspectRatio || this._fillMode == BitmapFillMode.CLIP || _loc5_)
               {
                  _loc16_ = this._fillMode == BitmapFillMode.CLIP || _loc5_ ? this.imageWidth : _loc4_;
                  _loc17_ = this._fillMode == BitmapFillMode.CLIP || _loc5_ ? this.imageHeight : _loc3_;
                  if(param2 > _loc17_)
                  {
                     this.loadedContent.y = Math.floor((param2 - _loc17_) * this.getVerticalAlignValue());
                  }
                  if(param1 > _loc16_)
                  {
                     this.loadedContent.x = Math.floor((param1 - _loc16_) * this.getHorizontalAlignValue());
                  }
               }
               this.loadedContent.scrollRect = this._fillMode == BitmapFillMode.CLIP || _loc5_ ? new Rectangle(0,0,param1,param2) : null;
            }
            return;
         }
         var _loc8_:Graphics;
         (_loc8_ = Sprite(drawnDisplayObject).graphics).lineStyle();
         var _loc9_:Boolean = false;
         var _loc10_:Number = 1;
         var _loc11_:Number = 1;
         var _loc12_:Number = Math.round(drawX);
         var _loc13_:Number = Math.round(drawY);
         var _loc14_:Number = _loc4_;
         var _loc15_:Number = _loc3_;
         if(this._bitmapData)
         {
            switch(this._fillMode)
            {
               case BitmapFillMode.REPEAT:
                  _loc9_ = true;
                  break;
               case BitmapFillMode.SCALE:
                  if(_loc5_)
                  {
                     _loc18_ = _loc4_ / this._bitmapData.width;
                     _loc19_ = _loc3_ / this._bitmapData.height;
                     if(_loc18_ < _loc19_)
                     {
                        var _loc34_:* = _loc3_ / this._bitmapData.height;
                        _loc11_ = _loc3_ / this._bitmapData.height;
                        _loc10_ = _loc34_;
                        break;
                     }
                     _loc34_ = _loc4_ / this._bitmapData.width;
                     _loc11_ = _loc4_ / this._bitmapData.width;
                     _loc10_ = _loc34_;
                     break;
                  }
                  _loc10_ = _loc4_ / this._bitmapData.width;
                  _loc11_ = _loc3_ / this._bitmapData.height;
                  break;
               case BitmapFillMode.CLIP:
                  _loc14_ = Math.min(_loc4_,this._bitmapData.width);
                  _loc15_ = Math.min(_loc3_,this._bitmapData.height);
            }
         }
         if(this._fillMode != BitmapFillMode.SCALE || isNaN(this._scaleGridTop) || isNaN(this._scaleGridBottom) || isNaN(this._scaleGridLeft) || isNaN(this._scaleGridRight))
         {
            _loc20_ = this._smooth && this._smoothingQuality == BitmapSmoothingQuality.HIGH && this._fillMode == BitmapFillMode.SCALE;
            _loc21_ = _loc14_;
            _loc22_ = _loc15_;
            if(_loc5_)
            {
               _loc21_ = this._bitmapData.width * _loc10_;
               _loc22_ = this._bitmapData.height * _loc11_;
            }
            _loc23_ = _loc20_ ? resample(this._bitmapData,_loc21_,_loc22_) : this._bitmapData;
            if(_loc20_ && this._fillMode == BitmapFillMode.SCALE)
            {
               if(_loc5_)
               {
                  _loc10_ = _loc11_ = 1;
               }
               else if(this._fillMode == BitmapFillMode.SCALE)
               {
                  _loc10_ = _loc4_ / _loc23_.width;
                  _loc11_ = _loc3_ / _loc23_.height;
               }
            }
            _loc24_ = _loc23_.height * _loc10_;
            _loc25_ = _loc23_.width * _loc11_;
            if(this.maintainAspectRatio || this._fillMode == BitmapFillMode.CLIP || _loc5_)
            {
               if(param2 > _loc24_)
               {
                  _loc13_ += Math.floor((param2 - _loc24_) * this.getVerticalAlignValue());
               }
               if(param1 > _loc25_)
               {
                  _loc12_ += Math.floor((param1 - _loc25_) * this.getHorizontalAlignValue());
               }
            }
            _loc26_ = _loc12_;
            _loc27_ = _loc13_;
            if(_loc5_)
            {
               if(_loc25_ > param1)
               {
                  _loc26_ += (param1 - _loc25_) * this.getHorizontalAlignValue();
               }
               else if(_loc24_ > param2)
               {
                  _loc27_ += (param2 - _loc24_) * this.getVerticalAlignValue();
               }
            }
            matrix.identity();
            if(!(_loc20_ && (this.maintainAspectRatio || _loc5_)))
            {
               matrix.scale(_loc10_,_loc11_);
            }
            matrix.translate(_loc26_,_loc27_);
            _loc8_.beginBitmapFill(_loc23_,matrix,_loc9_,this._smooth);
            _loc8_.drawRect(_loc12_,_loc13_,_loc14_,_loc15_);
            _loc8_.endFill();
         }
         else
         {
            if(this.cachedSourceGrid == null)
            {
               this.cachedSourceGrid = [];
               this.cachedSourceGrid.push([new Point(0,0),new Point(this._scaleGridLeft,0),new Point(this._scaleGridRight,0),new Point(this._bitmapData.width,0)]);
               this.cachedSourceGrid.push([new Point(0,this._scaleGridTop),new Point(this._scaleGridLeft,this._scaleGridTop),new Point(this._scaleGridRight,this._scaleGridTop),new Point(this._bitmapData.width,this._scaleGridTop)]);
               this.cachedSourceGrid.push([new Point(0,this._scaleGridBottom),new Point(this._scaleGridLeft,this._scaleGridBottom),new Point(this._scaleGridRight,this._scaleGridBottom),new Point(this._bitmapData.width,this._scaleGridBottom)]);
               this.cachedSourceGrid.push([new Point(0,this._bitmapData.height),new Point(this._scaleGridLeft,this._bitmapData.height),new Point(this._scaleGridRight,this._bitmapData.height),new Point(this._bitmapData.width,this._bitmapData.height)]);
            }
            if(this.cachedDestGrid == null || this.previousUnscaledWidth != param1 || this.previousUnscaledHeight != param2)
            {
               _loc31_ = param2 - (this._bitmapData.height - this._scaleGridBottom);
               _loc32_ = param1 - (this._bitmapData.width - this._scaleGridRight);
               this.cachedDestGrid = [];
               this.cachedDestGrid.push([new Point(0,0),new Point(this._scaleGridLeft,0),new Point(_loc32_,0),new Point(param1,0)]);
               this.cachedDestGrid.push([new Point(0,this._scaleGridTop),new Point(this._scaleGridLeft,this._scaleGridTop),new Point(_loc32_,this._scaleGridTop),new Point(param1,this._scaleGridTop)]);
               this.cachedDestGrid.push([new Point(0,_loc31_),new Point(this._scaleGridLeft,_loc31_),new Point(_loc32_,_loc31_),new Point(param1,_loc31_)]);
               this.cachedDestGrid.push([new Point(0,param2),new Point(this._scaleGridLeft,param2),new Point(_loc32_,param2),new Point(param1,param2)]);
            }
            _loc28_ = new Rectangle();
            _loc29_ = new Rectangle();
            _loc30_ = 0;
            while(_loc30_ < 3)
            {
               _loc33_ = 0;
               while(_loc33_ < 3)
               {
                  _loc28_.topLeft = this.cachedSourceGrid[_loc30_][_loc33_];
                  _loc28_.bottomRight = this.cachedSourceGrid[_loc30_ + 1][_loc33_ + 1];
                  _loc29_.topLeft = this.cachedDestGrid[_loc30_][_loc33_];
                  _loc29_.bottomRight = this.cachedDestGrid[_loc30_ + 1][_loc33_ + 1];
                  matrix.identity();
                  matrix.scale(_loc29_.width / _loc28_.width,_loc29_.height / _loc28_.height);
                  matrix.translate(_loc29_.x - _loc28_.x * 0,_loc29_.y - _loc28_.y * 0);
                  matrix.translate(_loc12_,_loc13_);
                  _loc8_.beginBitmapFill(this._bitmapData,matrix);
                  _loc8_.drawRect(_loc29_.x + _loc12_,_loc29_.y + _loc13_,_loc29_.width,_loc29_.height);
                  _loc8_.endFill();
                  _loc33_++;
               }
               _loc30_++;
            }
         }
         this.previousUnscaledWidth = param1;
         this.previousUnscaledHeight = param2;
      }
      
      override protected function get needsDisplayObject() : Boolean
      {
         return !this.trustedSource || super.needsDisplayObject;
      }
      
      protected function setBitmapData(param1:BitmapData, param2:Boolean = false) : void
      {
         this.clearBitmapData();
         this.imageWidth = this.imageHeight = NaN;
         this.clearLoadingContent();
         if(param1)
         {
            this.bitmapDataCreated = param2;
            this._bitmapData = param1;
            this.imageWidth = param1.width;
            this.imageHeight = param1.height;
            this.cachedSourceGrid = null;
            this.cachedDestGrid = null;
            dispatchEvent(new FlexEvent(FlexEvent.READY));
         }
         if(!explicitHeight || !explicitWidth)
         {
            invalidateSize();
         }
         invalidateDisplayList();
      }
      
      mx_internal function applySource() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc1_:Object = this._source;
         if(_loc1_ is MultiDPIBitmapSource)
         {
            _loc1_ = this.mx_internal::getActualValue(_loc1_ as MultiDPIBitmapSource);
         }
         this._scaleGridLeft = NaN;
         this._scaleGridRight = NaN;
         this._scaleGridTop = NaN;
         this._scaleGridBottom = NaN;
         var _loc4_:Boolean = false;
         this._bytesLoaded = NaN;
         this._bytesTotal = NaN;
         this._trustedSource = true;
         invalidateDisplayObjectSharing();
         invalidateDisplayList();
         if(this._clearOnLoad)
         {
            this.removePreviousContent();
         }
         if(_loc1_ is Class)
         {
            _loc1_ = new (_loc5_ = Class(_loc1_))();
            _loc4_ = true;
         }
         else if(_loc1_ is String || _loc1_ is URLRequest)
         {
            this.mx_internal::loadExternal(_loc1_);
         }
         else if(_loc1_ is ByteArray)
         {
            this.mx_internal::loadFromBytes(_loc1_ as ByteArray);
         }
         if(_loc1_ is BitmapData)
         {
            _loc2_ = _loc1_ as BitmapData;
         }
         else if(_loc1_ is Bitmap)
         {
            _loc2_ = _loc1_.bitmapData;
         }
         else if(_loc1_ is DisplayObject)
         {
            _loc3_ = _loc1_ as DisplayObject;
            if((_loc3_.width == 0 || _loc3_.height == 0) && !_loc3_.stage)
            {
               _loc3_.addEventListener(Event.ADDED_TO_STAGE,this.source_addedToStageHandler);
               return;
            }
         }
         else if(_loc1_ != null)
         {
            return;
         }
         if(!_loc2_ && Boolean(_loc3_))
         {
            if(_loc3_ is IInvalidating)
            {
               IInvalidating(_loc3_).validateNow();
            }
            if(_loc3_.width == 0 || _loc3_.height == 0)
            {
               return;
            }
            _loc2_ = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc2_.draw(_loc3_,new Matrix(),_loc3_.transform.colorTransform);
            _loc4_ = true;
            if(_loc3_.scale9Grid)
            {
               this._scaleGridLeft = _loc3_.scale9Grid.left;
               this._scaleGridRight = _loc3_.scale9Grid.right;
               this._scaleGridTop = _loc3_.scale9Grid.top;
               this._scaleGridBottom = _loc3_.scale9Grid.bottom;
            }
         }
         if(!this._clearOnLoad)
         {
            this.removePreviousContent();
         }
         this.setBitmapData(_loc2_,_loc4_);
      }
      
      mx_internal function getActualValue(param1:MultiDPIBitmapSource) : Object
      {
         var _loc3_:Number = NaN;
         var _loc2_:Object = FlexGlobals.topLevelApplication;
         if("runtimeDPI" in _loc2_)
         {
            _loc3_ = Number(_loc2_["runtimeDPI"]);
         }
         else
         {
            _loc3_ = DensityUtil.getRuntimeDPI();
         }
         return param1.getSource(_loc3_);
      }
      
      mx_internal function loadExternal(param1:Object) : void
      {
         var url:String = null;
         var contentRequest:ContentRequest = null;
         var var_338:Loader = null;
         var loaderContext:LoaderContext = null;
         var urlRequest:URLRequest = null;
         var source:Object = param1;
         if(source is String)
         {
            url = source as String;
            source = LoaderUtil.mx_internal::OSToPlayerURI(url,LoaderUtil.mx_internal::isLocal(url));
         }
         if(this.contentLoader)
         {
            contentRequest = this.contentLoader.load(source,this.contentLoaderGrouping);
            if(contentRequest.complete)
            {
               this.contentComplete(contentRequest.content);
            }
            else
            {
               this.loadingContent = contentRequest;
               this.attachLoadingListeners();
            }
         }
         else
         {
            var_338 = new Loader();
            loaderContext = new LoaderContext();
            this.loadingContent = var_338.contentLoaderInfo;
            this.attachLoadingListeners();
            try
            {
               loaderContext.checkPolicyFile = true;
               urlRequest = source is URLRequest ? source as URLRequest : new URLRequest(source as String);
               var_338.load(urlRequest,loaderContext);
            }
            catch(error:SecurityError)
            {
               handleSecurityError(error);
            }
         }
      }
      
      mx_internal function loadFromBytes(param1:ByteArray) : void
      {
         var source:ByteArray = param1;
         var var_338:Loader = new Loader();
         var loaderContext:LoaderContext = new LoaderContext();
         this.loadingContent = var_338.contentLoaderInfo;
         this.attachLoadingListeners();
         try
         {
            var_338.loadBytes(source as ByteArray,loaderContext);
         }
         catch(error:SecurityError)
         {
            handleSecurityError(error);
         }
      }
      
      protected function contentComplete(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 is LoaderInfo)
         {
            this.setBitmapData(null);
            this.removePreviousContent();
            _loc2_ = param1 as LoaderInfo;
            if(_loc2_.childAllowsParent)
            {
               _loc3_ = Bitmap(_loc2_.content);
               this.setBitmapData(_loc3_.bitmapData);
            }
            else
            {
               displayObjectSharingMode = DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT;
               invalidateDisplayObjectSharing();
               _loc4_ = new Sprite();
               setDisplayObject(_loc4_);
               this.loadedContent = _loc2_.loader;
               _loc4_.addChild(this.loadedContent);
               this.imageWidth = _loc2_.width;
               this.imageHeight = _loc2_.height;
               if(!explicitHeight || !explicitWidth)
               {
                  invalidateSize();
               }
               invalidateDisplayList();
               this._trustedSource = false;
               dispatchEvent(new FlexEvent(FlexEvent.READY));
            }
         }
         else if(param1 is BitmapData)
         {
            this.setBitmapData(param1 as BitmapData);
         }
      }
      
      private function get maintainAspectRatio() : Boolean
      {
         return this._scaleMode == BitmapScaleMode.LETTERBOX && this._fillMode == BitmapFillMode.SCALE;
      }
      
      private function removePreviousContent() : void
      {
         if(Boolean(this.loadedContent) && Boolean(this.loadedContent.parent))
         {
            displayObjectSharingMode = DisplayObjectSharingMode.USES_SHARED_OBJECT;
            invalidateDisplayObjectSharing();
            this.loadedContent.parent.removeChild(this.loadedContent);
            this.loadedContent = null;
            setDisplayObject(null);
            this.imageWidth = this.imageHeight = NaN;
         }
         else if(drawnDisplayObject)
         {
            Sprite(drawnDisplayObject).graphics.clear();
            this.clearBitmapData();
         }
      }
      
      private function clearLoadingContent() : void
      {
         if(this.loadingContent is LoaderInfo && Boolean(LoaderInfo(this.loadingContent).loader))
         {
            try
            {
               LoaderInfo(this.loadingContent).loader.close();
            }
            catch(e:Error)
            {
            }
         }
         this.removeLoadingListeners();
         this.loadingContent = null;
      }
      
      private function clearBitmapData() : void
      {
         if(this._bitmapData)
         {
            if(this.bitmapDataCreated)
            {
               this._bitmapData.dispose();
            }
            this._bitmapData = null;
         }
      }
      
      private function attachLoadingListeners() : void
      {
         if(this.loadingContent)
         {
            this.loadingContent.addEventListener(Event.COMPLETE,this.mx_internal::loader_completeHandler,false,0,true);
            this.loadingContent.addEventListener(IOErrorEvent.IO_ERROR,this.loader_ioErrorHandler,false,0,true);
            this.loadingContent.addEventListener(ProgressEvent.PROGRESS,this.loader_progressHandler,false,0,true);
            this.loadingContent.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loader_securityErrorHandler,false,0,true);
            this.loadingContent.addEventListener(HTTPStatusEvent.HTTP_STATUS,dispatchEvent,false,0,true);
         }
      }
      
      private function removeLoadingListeners() : void
      {
         if(this.loadingContent)
         {
            this.loadingContent.removeEventListener(Event.COMPLETE,this.mx_internal::loader_completeHandler);
            this.loadingContent.removeEventListener(IOErrorEvent.IO_ERROR,this.loader_ioErrorHandler);
            this.loadingContent.removeEventListener(ProgressEvent.PROGRESS,this.loader_progressHandler);
            this.loadingContent.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loader_securityErrorHandler);
            this.loadingContent.removeEventListener(HTTPStatusEvent.HTTP_STATUS,dispatchEvent);
         }
      }
      
      mx_internal function validateSource() : void
      {
         if(this.sourceInvalid || this.contentLoaderInvalid)
         {
            this.mx_internal::applySource();
            this.sourceInvalid = false;
            this.contentLoaderInvalid = false;
         }
      }
      
      mx_internal function loader_completeHandler(param1:Event) : void
      {
         var loaderInfo:LoaderInfo = null;
         var var_6:Event = param1;
         try
         {
            loaderInfo = var_6.target is ContentRequest ? var_6.target.content as LoaderInfo : var_6.target as LoaderInfo;
            if(loaderInfo.bytesLoaded)
            {
               this._bytesLoaded = this._bytesTotal;
               this.contentComplete(loaderInfo);
            }
         }
         catch(error:SecurityError)
         {
            handleSecurityError(error);
         }
         dispatchEvent(var_6);
         this.clearLoadingContent();
      }
      
      private function loader_ioErrorHandler(param1:IOErrorEvent) : void
      {
         if(hasEventListener(param1.type))
         {
            dispatchEvent(param1);
         }
         this.setBitmapData(null);
         this.loadFailed = true;
      }
      
      private function loader_securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         dispatchEvent(param1);
         this.setBitmapData(null);
         this.loadFailed = true;
      }
      
      private function loader_progressHandler(param1:ProgressEvent) : void
      {
         this._bytesLoaded = param1.bytesLoaded;
         this._bytesTotal = param1.bytesTotal;
         dispatchEvent(param1);
      }
      
      private function handleSecurityError(param1:SecurityError) : void
      {
         dispatchEvent(new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR,false,false,param1.message));
         this.setBitmapData(null);
         this.loadFailed = true;
      }
      
      private function source_addedToStageHandler(param1:Event) : void
      {
         this.removeAddedToStageHandler(param1.target);
         this.mx_internal::applySource();
      }
      
      private function removeAddedToStageHandler(param1:Object) : void
      {
         if(Boolean(param1) && param1 is DisplayObject)
         {
            param1.removeEventListener(Event.ADDED_TO_STAGE,this.source_addedToStageHandler);
         }
      }
   }
}
