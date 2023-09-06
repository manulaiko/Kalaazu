package org.osmf.containers
{
   import flash.display.DisplayObject;
   import flash.errors.IllegalOperationError;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import org.osmf.events.ContainerChangeEvent;
   import org.osmf.layout.LayoutMetadata;
   import org.osmf.layout.LayoutRenderer;
   import org.osmf.layout.LayoutRendererBase;
   import org.osmf.layout.LayoutTargetEvent;
   import org.osmf.layout.LayoutTargetSprite;
   import org.osmf.layout.MediaElementLayoutTarget;
   import org.osmf.media.MediaElement;
   import org.osmf.utils.OSMFStrings;
   
   public class MediaContainer extends LayoutTargetSprite implements IMediaContainer
   {
       
      
      private var layoutTargets:Dictionary;
      
      private var _layoutRenderer:LayoutRendererBase;
      
      private var _backgroundColor:Number;
      
      private var _backgroundAlpha:Number;
      
      private var lastAvailableWidth:Number;
      
      private var lastAvailableHeight:Number;
      
      public function MediaContainer(param1:LayoutRendererBase = null, param2:LayoutMetadata = null)
      {
         this.layoutTargets = new Dictionary();
         super(param2);
         this._layoutRenderer = param1 || new LayoutRenderer();
         this._layoutRenderer.container = this;
      }
      
      public function addMediaElement(param1:MediaElement) : MediaElement
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
         }
         if(this.layoutTargets[param1] == undefined)
         {
            param1.dispatchEvent(new ContainerChangeEvent(ContainerChangeEvent.CONTAINER_CHANGE,false,false,param1.container,this));
            _loc2_ = MediaElementLayoutTarget.getInstance(param1);
            this.layoutTargets[param1] = _loc2_;
            this._layoutRenderer.addTarget(_loc2_);
            param1.addEventListener(ContainerChangeEvent.CONTAINER_CHANGE,this.onElementContainerChange);
            return param1;
         }
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
      }
      
      public function removeMediaElement(param1:MediaElement) : MediaElement
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
         }
         var _loc3_:MediaElementLayoutTarget = this.layoutTargets[param1];
         if(_loc3_)
         {
            param1.removeEventListener(ContainerChangeEvent.CONTAINER_CHANGE,this.onElementContainerChange);
            this._layoutRenderer.removeTarget(_loc3_);
            delete this.layoutTargets[param1];
            _loc2_ = param1;
            if(param1.container == this)
            {
               param1.dispatchEvent(new ContainerChangeEvent(ContainerChangeEvent.CONTAINER_CHANGE,false,false,param1.container,null));
            }
            return _loc2_;
         }
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
      }
      
      public function containsMediaElement(param1:MediaElement) : Boolean
      {
         return this.layoutTargets[param1] != undefined;
      }
      
      public function get layoutRenderer() : LayoutRendererBase
      {
         return this._layoutRenderer;
      }
      
      public function get clipChildren() : Boolean
      {
         return scrollRect != null;
      }
      
      public function set clipChildren(param1:Boolean) : void
      {
         if(param1 && scrollRect == null)
         {
            scrollRect = new Rectangle(0,0,this._layoutRenderer.measuredWidth,this._layoutRenderer.measuredHeight);
         }
         else if(param1 == false && Boolean(scrollRect))
         {
            scrollRect = null;
         }
      }
      
      public function get backgroundColor() : Number
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(param1:Number) : void
      {
         if(param1 != this._backgroundColor)
         {
            this._backgroundColor = param1;
            this.drawBackground();
         }
      }
      
      public function get backgroundAlpha() : Number
      {
         return this._backgroundAlpha;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
         if(param1 != this._backgroundAlpha)
         {
            this._backgroundAlpha = param1;
            this.drawBackground();
         }
      }
      
      override public function layout(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         super.layout(param1,param2,param3);
         this.lastAvailableWidth = param1;
         this.lastAvailableHeight = param2;
         if(!isNaN(this.backgroundColor))
         {
            this.drawBackground();
         }
         if(scrollRect)
         {
            scrollRect = new Rectangle(0,0,param1,param2);
         }
      }
      
      override public function validateNow() : void
      {
         this._layoutRenderer.validateNow();
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DIRECT_DISPLAY_LIST_MOD_ERROR));
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DIRECT_DISPLAY_LIST_MOD_ERROR));
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DIRECT_DISPLAY_LIST_MOD_ERROR));
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DIRECT_DISPLAY_LIST_MOD_ERROR));
      }
      
      override protected function onAddChildAt(param1:LayoutTargetEvent) : void
      {
         super.addChildAt(param1.displayObject,param1.index);
      }
      
      override protected function onRemoveChild(param1:LayoutTargetEvent) : void
      {
         super.removeChild(param1.displayObject);
      }
      
      override protected function onSetChildIndex(param1:LayoutTargetEvent) : void
      {
         super.setChildIndex(param1.displayObject,param1.index);
      }
      
      private function drawBackground() : void
      {
         graphics.clear();
         if(!isNaN(this._backgroundColor) && this._backgroundAlpha != 0 && this.lastAvailableWidth && Boolean(this.lastAvailableHeight))
         {
            graphics.beginFill(this._backgroundColor,this._backgroundAlpha);
            graphics.drawRect(0,0,this.lastAvailableWidth,this.lastAvailableHeight);
            graphics.endFill();
         }
      }
      
      private function onElementContainerChange(param1:ContainerChangeEvent) : void
      {
         if(param1.oldContainer == this)
         {
            this.removeMediaElement(param1.target as MediaElement);
         }
      }
   }
}
