package org.osmf.elements
{
   import org.osmf.elements.proxyClasses.ProxyMetadata;
   import org.osmf.events.ContainerChangeEvent;
   import org.osmf.events.MediaElementEvent;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.MediaElement;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.metadata.Metadata;
   import org.osmf.traits.MediaTraitBase;
   import org.osmf.traits.MediaTraitType;
   import org.osmf.utils.OSMFStrings;
   
   public class ProxyElement extends MediaElement
   {
       
      
      private var _proxiedMetadata:ProxyMetadata;
      
      private var _proxiedElement:MediaElement;
      
      private var _blockedTraits:Vector.<String>;
      
      public function ProxyElement(param1:MediaElement = null)
      {
         super();
         this.addEventListener(MediaElementEvent.TRAIT_ADD,this.onProxyTraitAdd,false,int.MAX_VALUE);
         this.addEventListener(MediaElementEvent.TRAIT_REMOVE,this.onProxyTraitRemove,false,int.MAX_VALUE);
         this.addEventListener(ContainerChangeEvent.CONTAINER_CHANGE,this.onProxyContainerChange);
         this.proxiedElement = param1;
      }
      
      public function get proxiedElement() : MediaElement
      {
         return this._proxiedElement;
      }
      
      public function set proxiedElement(param1:MediaElement) : void
      {
         var _loc2_:* = null;
         if(param1 != this._proxiedElement)
         {
            if(this._proxiedElement != null)
            {
               this.toggleMediaElementListeners(this._proxiedElement,false);
               for each(_loc2_ in this._proxiedElement.traitTypes)
               {
                  super.dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_REMOVE,false,false,_loc2_));
               }
            }
            this._proxiedElement = param1;
            if(this._proxiedElement != null)
            {
               ProxyMetadata(metadata).metadata = this._proxiedElement.metadata;
               this._proxiedElement.dispatchEvent(new ContainerChangeEvent(ContainerChangeEvent.CONTAINER_CHANGE,false,false,this._proxiedElement.container,container));
               this.toggleMediaElementListeners(this._proxiedElement,true);
               for each(_loc2_ in this._proxiedElement.traitTypes)
               {
                  super.dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_ADD,false,false,_loc2_));
               }
            }
         }
      }
      
      override public function get traitTypes() : Vector.<String>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for each(_loc2_ in MediaTraitType.ALL_TYPES)
         {
            if(this.hasTrait(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      override public function hasTrait(param1:String) : Boolean
      {
         if(param1 == null)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
         return this.getTrait(param1) != null;
      }
      
      override public function getTrait(param1:String) : MediaTraitBase
      {
         if(param1 == null)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
         var _loc2_:* = null;
         if(this.blocksTrait(param1) == false)
         {
            _loc2_ = super.getTrait(param1) || (this.proxiedElement != null ? this.proxiedElement.getTrait(param1) : null);
         }
         return _loc2_;
      }
      
      override public function get resource() : MediaResourceBase
      {
         return !!this.proxiedElement ? this.proxiedElement.resource : null;
      }
      
      override public function set resource(param1:MediaResourceBase) : void
      {
         if(this.proxiedElement != null)
         {
            this.proxiedElement.resource = param1;
         }
      }
      
      override protected function addTrait(param1:String, param2:MediaTraitBase) : void
      {
         if(this.blocksTrait(param1) == false && this.proxiedElement != null && this.proxiedElement.hasTrait(param1) == true)
         {
            super.dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_REMOVE,false,false,param1));
         }
         super.addTrait(param1,param2);
      }
      
      override protected function removeTrait(param1:String) : MediaTraitBase
      {
         var _loc2_:MediaTraitBase = super.removeTrait(param1);
         if(this.blocksTrait(param1) == false && this.proxiedElement != null && this.proxiedElement.hasTrait(param1) == true)
         {
            super.dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_ADD,false,false,param1));
         }
         return _loc2_;
      }
      
      override protected function createMetadata() : Metadata
      {
         return new ProxyMetadata();
      }
      
      protected final function get blockedTraits() : Vector.<String>
      {
         if(this._blockedTraits == null)
         {
            this._blockedTraits = new Vector.<String>();
         }
         return this._blockedTraits;
      }
      
      protected final function set blockedTraits(param1:Vector.<String>) : void
      {
         var _loc4_:* = null;
         if(param1 == this._blockedTraits)
         {
            return;
         }
         var _loc2_:* = [];
         var _loc3_:* = [];
         if(this._proxiedElement != null)
         {
            for each(_loc4_ in MediaTraitType.ALL_TYPES)
            {
               if(param1.indexOf(_loc4_) != -1)
               {
                  if(this._blockedTraits == null || this._blockedTraits.indexOf(_loc4_) == -1)
                  {
                     _loc2_.push(_loc4_);
                  }
               }
               else if(this._blockedTraits != null && this._blockedTraits.indexOf(_loc4_) != -1)
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         if(this._proxiedElement != null)
         {
            for each(_loc4_ in _loc2_)
            {
               if(this.proxiedElement.hasTrait(_loc4_) || super.hasTrait(_loc4_))
               {
                  dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_REMOVE,false,false,_loc4_));
               }
            }
            this._blockedTraits = param1;
            for each(_loc4_ in _loc3_)
            {
               if(this.proxiedElement.hasTrait(_loc4_) || super.hasTrait(_loc4_))
               {
                  dispatchEvent(new MediaElementEvent(MediaElementEvent.TRAIT_ADD,false,false,_loc4_));
               }
            }
         }
         else
         {
            this._blockedTraits = param1;
         }
      }
      
      private function toggleMediaElementListeners(param1:MediaElement, param2:Boolean) : void
      {
         if(param2)
         {
            this._proxiedElement.addEventListener(MediaErrorEvent.MEDIA_ERROR,this.onMediaError);
            this._proxiedElement.addEventListener(MediaElementEvent.TRAIT_ADD,this.onTraitAdd);
            this._proxiedElement.addEventListener(MediaElementEvent.TRAIT_REMOVE,this.onTraitRemove);
            this._proxiedElement.addEventListener(MediaElementEvent.METADATA_ADD,this.onMetadataEvent);
            this._proxiedElement.addEventListener(MediaElementEvent.METADATA_REMOVE,this.onMetadataEvent);
         }
         else
         {
            this._proxiedElement.removeEventListener(MediaErrorEvent.MEDIA_ERROR,this.onMediaError);
            this._proxiedElement.removeEventListener(MediaElementEvent.TRAIT_ADD,this.onTraitAdd);
            this._proxiedElement.removeEventListener(MediaElementEvent.TRAIT_REMOVE,this.onTraitRemove);
            this._proxiedElement.removeEventListener(MediaElementEvent.METADATA_ADD,this.onMetadataEvent);
            this._proxiedElement.removeEventListener(MediaElementEvent.METADATA_REMOVE,this.onMetadataEvent);
         }
      }
      
      private function onMediaError(param1:MediaErrorEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onTraitAdd(param1:MediaElementEvent) : void
      {
         this.processTraitsChangeEvent(param1);
      }
      
      private function onTraitRemove(param1:MediaElementEvent) : void
      {
         this.processTraitsChangeEvent(param1);
      }
      
      private function onMetadataEvent(param1:MediaElementEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onProxyContainerChange(param1:ContainerChangeEvent) : void
      {
         if(this.proxiedElement != null)
         {
            this.proxiedElement.dispatchEvent(param1.clone());
         }
      }
      
      private function onProxyTraitAdd(param1:MediaElementEvent) : void
      {
         this.processProxyTraitsChangeEvent(param1);
      }
      
      private function onProxyTraitRemove(param1:MediaElementEvent) : void
      {
         this.processProxyTraitsChangeEvent(param1);
      }
      
      private function processTraitsChangeEvent(param1:MediaElementEvent) : void
      {
         if(this.blocksTrait(param1.traitType) == false && super.hasTrait(param1.traitType) == false)
         {
            super.dispatchEvent(param1.clone());
         }
      }
      
      private function processProxyTraitsChangeEvent(param1:MediaElementEvent) : void
      {
         if(this.blocksTrait(param1.traitType) == true)
         {
            param1.stopImmediatePropagation();
         }
      }
      
      private function blocksTrait(param1:String) : Boolean
      {
         return Boolean(this._blockedTraits) && this._blockedTraits.indexOf(param1) != -1;
      }
   }
}
