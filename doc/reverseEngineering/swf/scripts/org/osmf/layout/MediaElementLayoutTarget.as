package org.osmf.layout
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import org.osmf.events.DisplayObjectEvent;
   import org.osmf.events.MediaElementEvent;
   import org.osmf.media.MediaElement;
   import org.osmf.traits.DisplayObjectTrait;
   import org.osmf.traits.MediaTraitType;
   import org.osmf.utils.OSMFStrings;
   
   public class MediaElementLayoutTarget extends EventDispatcher implements ILayoutTarget
   {
      
      private static const layoutTargets:Dictionary = new Dictionary(true);
       
      
      private var _mediaElement:MediaElement;
      
      private var _layoutMetadata:LayoutMetadata;
      
      private var displayObjectTrait:DisplayObjectTrait;
      
      private var _displayObject:DisplayObject;
      
      private var renderers:LayoutTargetRenderers;
      
      public function MediaElementLayoutTarget(param1:MediaElement, param2:Class)
      {
         super();
         if(param2 != ConstructorLock)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ILLEGAL_CONSTRUCTOR_INVOCATION));
         }
         this._mediaElement = param1;
         this._mediaElement.addEventListener(MediaElementEvent.TRAIT_ADD,this.onMediaElementTraitsChange);
         this._mediaElement.addEventListener(MediaElementEvent.TRAIT_REMOVE,this.onMediaElementTraitsChange);
         this._mediaElement.addEventListener(MediaElementEvent.METADATA_ADD,this.onMetadataAdd);
         this._mediaElement.addEventListener(MediaElementEvent.METADATA_REMOVE,this.onMetadataRemove);
         this.renderers = new LayoutTargetRenderers(this);
         this._layoutMetadata = this._mediaElement.getMetadata(LayoutMetadata.LAYOUT_NAMESPACE) as LayoutMetadata;
         addEventListener(LayoutTargetEvent.ADD_CHILD_AT,this.onAddChildAt);
         addEventListener(LayoutTargetEvent.SET_CHILD_INDEX,this.onSetChildIndex);
         addEventListener(LayoutTargetEvent.REMOVE_CHILD,this.onRemoveChild);
         this.onMediaElementTraitsChange();
      }
      
      public static function getInstance(param1:MediaElement) : MediaElementLayoutTarget
      {
         var _loc2_:* = undefined;
         for(_loc2_ in layoutTargets)
         {
            if(_loc2_.mediaElement == param1)
            {
               break;
            }
            _loc2_ = null;
         }
         if(_loc2_ == null)
         {
            _loc2_ = new MediaElementLayoutTarget(param1,ConstructorLock);
            layoutTargets[_loc2_] = true;
         }
         return _loc2_;
      }
      
      public function get mediaElement() : MediaElement
      {
         return this._mediaElement;
      }
      
      public function get layoutMetadata() : LayoutMetadata
      {
         if(this._layoutMetadata == null)
         {
            this._layoutMetadata = new LayoutMetadata();
            this._mediaElement.addMetadata(LayoutMetadata.LAYOUT_NAMESPACE,this._layoutMetadata);
         }
         return this._layoutMetadata;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function get measuredWidth() : Number
      {
         return !!this.displayObjectTrait ? this.displayObjectTrait.mediaWidth : NaN;
      }
      
      public function get measuredHeight() : Number
      {
         return !!this.displayObjectTrait ? this.displayObjectTrait.mediaHeight : NaN;
      }
      
      public function measure(param1:Boolean = true) : void
      {
         if(this._displayObject is ILayoutTarget)
         {
            ILayoutTarget(this._displayObject).measure(param1);
         }
      }
      
      public function layout(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         if(this._displayObject is ILayoutTarget)
         {
            ILayoutTarget(this._displayObject).layout(param1,param2,param3);
         }
         else if(this._displayObject != null && this.renderers.containerRenderer == null)
         {
            this._displayObject.width = param1;
            this._displayObject.height = param2;
         }
      }
      
      private function onMediaElementTraitsChange(param1:MediaElementEvent = null) : void
      {
         var _loc2_:* = null;
         if(param1 == null || param1 && param1.traitType == MediaTraitType.DISPLAY_OBJECT)
         {
            _loc2_ = Boolean(param1) && param1.type == MediaElementEvent.TRAIT_REMOVE ? null : this._mediaElement.getTrait(MediaTraitType.DISPLAY_OBJECT) as DisplayObjectTrait;
            if(_loc2_ != this.displayObjectTrait)
            {
               if(this.displayObjectTrait)
               {
                  this.displayObjectTrait.removeEventListener(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE,this.onDisplayObjectTraitDisplayObjecChange);
                  this.displayObjectTrait.removeEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE,this.onDisplayObjectTraitMediaSizeChange);
               }
               this.displayObjectTrait = _loc2_;
               if(this.displayObjectTrait)
               {
                  this.displayObjectTrait.addEventListener(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE,this.onDisplayObjectTraitDisplayObjecChange);
                  this.displayObjectTrait.addEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE,this.onDisplayObjectTraitMediaSizeChange);
               }
               this.updateDisplayObject(!!this.displayObjectTrait ? this.displayObjectTrait.displayObject : null);
            }
         }
      }
      
      private function onMetadataAdd(param1:MediaElementEvent) : void
      {
         if(param1.namespaceURL == LayoutMetadata.LAYOUT_NAMESPACE)
         {
            this._layoutMetadata = param1.metadata as LayoutMetadata;
         }
      }
      
      private function onMetadataRemove(param1:MediaElementEvent) : void
      {
         if(param1.namespaceURL == LayoutMetadata.LAYOUT_NAMESPACE)
         {
            this._layoutMetadata = null;
         }
      }
      
      private function updateDisplayObject(param1:DisplayObject) : void
      {
         var _loc2_:DisplayObject = this._displayObject;
         if(param1 != this.displayObject)
         {
            this._displayObject = param1;
            dispatchEvent(new DisplayObjectEvent(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE,false,false,_loc2_,param1));
         }
         if(param1 is ILayoutTarget && Boolean(this.renderers.parentRenderer))
         {
            ILayoutTarget(param1).dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.ADD_TO_LAYOUT_RENDERER,false,false,this.renderers.parentRenderer));
         }
      }
      
      private function onDisplayObjectTraitDisplayObjecChange(param1:DisplayObjectEvent) : void
      {
         this.updateDisplayObject(param1.newDisplayObject);
      }
      
      private function onDisplayObjectTraitMediaSizeChange(param1:DisplayObjectEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onAddChildAt(param1:LayoutTargetEvent) : void
      {
         if(this._displayObject is ILayoutTarget)
         {
            ILayoutTarget(this._displayObject).dispatchEvent(param1.clone());
         }
         else if(this._displayObject is DisplayObjectContainer)
         {
            DisplayObjectContainer(this._displayObject).addChildAt(param1.displayObject,param1.index);
         }
      }
      
      private function onRemoveChild(param1:LayoutTargetEvent) : void
      {
         if(this._displayObject is ILayoutTarget)
         {
            ILayoutTarget(this._displayObject).dispatchEvent(param1.clone());
         }
         else if(this._displayObject is DisplayObjectContainer)
         {
            DisplayObjectContainer(this._displayObject).removeChild(param1.displayObject);
         }
      }
      
      private function onSetChildIndex(param1:LayoutTargetEvent) : void
      {
         if(this._displayObject is ILayoutTarget)
         {
            ILayoutTarget(this._displayObject).dispatchEvent(param1.clone());
         }
         else if(this._displayObject is DisplayObjectContainer)
         {
            DisplayObjectContainer(this._displayObject).setChildIndex(param1.displayObject,param1.index);
         }
      }
   }
}

class ConstructorLock
{
    
   
   function ConstructorLock()
   {
      super();
   }
}
