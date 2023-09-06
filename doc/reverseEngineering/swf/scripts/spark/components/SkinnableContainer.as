package spark.components
{
   import mx.core.ContainerCreationPolicy;
   import mx.core.IDeferredContentOwner;
   import mx.core.IDeferredInstance;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.BitFlagUtil;
   import spark.components.supportClasses.SkinnableContainerBase;
   import spark.events.ElementExistenceEvent;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class SkinnableContainer extends SkinnableContainerBase implements IDeferredContentOwner, IVisualElementContainer
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const AUTO_LAYOUT_PROPERTY_FLAG:uint = 1;
      
      private static const LAYOUT_PROPERTY_FLAG:uint = 2;
       
      
      private var _809612678contentGroup:Group;
      
      private var contentGroupProperties:Object;
      
      private var _placeHolderGroup:Group;
      
      private var creationPolicyNone:Boolean = false;
      
      private var _mxmlContent:Array;
      
      private var _contentModified:Boolean = false;
      
      private var _mxmlContentFactory:IDeferredInstance;
      
      private var mxmlContentCreated:Boolean = false;
      
      private var _deferredContentCreated:Boolean;
      
      public function SkinnableContainer()
      {
         this.contentGroupProperties = {};
         super();
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         styleManager.registerInheritingStyle("_creationPolicy");
      }
      
      mx_internal function get currentContentGroup() : Group
      {
         this.createContentIfNeeded();
         if(!this.contentGroup)
         {
            if(!this._placeHolderGroup)
            {
               this._placeHolderGroup = new Group();
               if(this._mxmlContent)
               {
                  this._placeHolderGroup.mxmlContent = this._mxmlContent;
                  this._mxmlContent = null;
               }
               this._placeHolderGroup.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.contentGroup_elementAddedHandler);
               this._placeHolderGroup.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
            }
            return this._placeHolderGroup;
         }
         return this.contentGroup;
      }
      
      public function get creationPolicy() : String
      {
         var _loc1_:String = getStyle("_creationPolicy");
         if(_loc1_ == null)
         {
            _loc1_ = "null";
         }
         if(this.creationPolicyNone)
         {
            _loc1_ = "null";
         }
         return _loc1_;
      }
      
      public function set creationPolicy(param1:String) : void
      {
         if(param1 == ContainerCreationPolicy.NONE)
         {
            this.creationPolicyNone = true;
            param1 = "null";
         }
         else
         {
            this.creationPolicyNone = false;
         }
         setStyle("_creationPolicy",param1);
      }
      
      public function get autoLayout() : Boolean
      {
         var _loc1_:* = undefined;
         if(this.contentGroup)
         {
            return this.contentGroup.autoLayout;
         }
         _loc1_ = this.contentGroupProperties.autoLayout;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         if(this.contentGroup)
         {
            this.contentGroup.autoLayout = param1;
            this.contentGroupProperties = BitFlagUtil.update(this.contentGroupProperties as uint,AUTO_LAYOUT_PROPERTY_FLAG,true);
         }
         else
         {
            this.contentGroupProperties.autoLayout = param1;
         }
      }
      
      public function get layout() : LayoutBase
      {
         return !!this.contentGroup ? this.contentGroup.layout : this.contentGroupProperties.layout;
      }
      
      public function set layout(param1:LayoutBase) : void
      {
         if(this.contentGroup)
         {
            this.contentGroup.layout = param1;
            this.contentGroupProperties = BitFlagUtil.update(this.contentGroupProperties as uint,LAYOUT_PROPERTY_FLAG,true);
         }
         else
         {
            this.contentGroupProperties.layout = param1;
         }
      }
      
      public function set mxmlContent(param1:Array) : void
      {
         if(this.contentGroup)
         {
            this.contentGroup.mxmlContent = param1;
         }
         else if(this._placeHolderGroup)
         {
            this._placeHolderGroup.mxmlContent = param1;
         }
         else
         {
            this._mxmlContent = param1;
         }
         if(param1 != null)
         {
            this._contentModified = true;
         }
      }
      
      public function set mxmlContentFactory(param1:IDeferredInstance) : void
      {
         if(param1 == this._mxmlContentFactory)
         {
            return;
         }
         this._mxmlContentFactory = param1;
         this.mxmlContentCreated = false;
      }
      
      public function get numElements() : int
      {
         return this.mx_internal::currentContentGroup.numElements;
      }
      
      public function getElementAt(param1:int) : IVisualElement
      {
         return this.mx_internal::currentContentGroup.getElementAt(param1);
      }
      
      public function getElementIndex(param1:IVisualElement) : int
      {
         return this.mx_internal::currentContentGroup.getElementIndex(param1);
      }
      
      public function addElement(param1:IVisualElement) : IVisualElement
      {
         this._contentModified = true;
         return this.mx_internal::currentContentGroup.addElement(param1);
      }
      
      public function addElementAt(param1:IVisualElement, param2:int) : IVisualElement
      {
         this._contentModified = true;
         return this.mx_internal::currentContentGroup.addElementAt(param1,param2);
      }
      
      public function removeElement(param1:IVisualElement) : IVisualElement
      {
         this._contentModified = true;
         return this.mx_internal::currentContentGroup.removeElement(param1);
      }
      
      public function removeElementAt(param1:int) : IVisualElement
      {
         this._contentModified = true;
         return this.mx_internal::currentContentGroup.removeElementAt(param1);
      }
      
      public function removeAllElements() : void
      {
         this._contentModified = true;
         this.mx_internal::currentContentGroup.removeAllElements();
      }
      
      public function setElementIndex(param1:IVisualElement, param2:int) : void
      {
         this._contentModified = true;
         this.mx_internal::currentContentGroup.setElementIndex(param1,param2);
      }
      
      public function swapElements(param1:IVisualElement, param2:IVisualElement) : void
      {
         this._contentModified = true;
         this.mx_internal::currentContentGroup.swapElements(param1,param2);
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         this._contentModified = true;
         this.mx_internal::currentContentGroup.swapElementsAt(param1,param2);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.createContentIfNeeded();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         super.partAdded(param1,param2);
         if(param2 == this.contentGroup)
         {
            if(this._contentModified)
            {
               if(this._placeHolderGroup != null)
               {
                  _loc4_ = this._placeHolderGroup.mx_internal::getMXMLContent();
                  this._placeHolderGroup.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
                  _loc5_ = this._placeHolderGroup.numElements;
                  while(_loc5_ > 0)
                  {
                     this._placeHolderGroup.removeElementAt(0);
                     _loc5_--;
                  }
                  this.contentGroup.mxmlContent = !!_loc4_ ? _loc4_.slice() : null;
               }
               else if(this._mxmlContent != null)
               {
                  this.contentGroup.mxmlContent = this._mxmlContent;
                  this._mxmlContent = null;
               }
            }
            _loc3_ = 0;
            if(this.contentGroupProperties.autoLayout !== undefined)
            {
               this.contentGroup.autoLayout = this.contentGroupProperties.autoLayout;
               _loc3_ = BitFlagUtil.update(_loc3_,AUTO_LAYOUT_PROPERTY_FLAG,true);
            }
            if(this.contentGroupProperties.layout !== undefined)
            {
               this.contentGroup.layout = this.contentGroupProperties.layout;
               _loc3_ = BitFlagUtil.update(_loc3_,LAYOUT_PROPERTY_FLAG,true);
            }
            this.contentGroupProperties = _loc3_;
            this.contentGroup.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.contentGroup_elementAddedHandler);
            this.contentGroup.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
            if(this._placeHolderGroup)
            {
               this._placeHolderGroup.removeEventListener(ElementExistenceEvent.ELEMENT_ADD,this.contentGroup_elementAddedHandler);
               this._placeHolderGroup.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
               this._placeHolderGroup = null;
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.partRemoved(param1,param2);
         if(param2 == this.contentGroup)
         {
            this.contentGroup.removeEventListener(ElementExistenceEvent.ELEMENT_ADD,this.contentGroup_elementAddedHandler);
            this.contentGroup.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
            _loc3_ = {};
            if(BitFlagUtil.isSet(this.contentGroupProperties as uint,AUTO_LAYOUT_PROPERTY_FLAG))
            {
               _loc3_.autoLayout = this.contentGroup.autoLayout;
            }
            if(BitFlagUtil.isSet(this.contentGroupProperties as uint,LAYOUT_PROPERTY_FLAG))
            {
               _loc3_.layout = this.contentGroup.layout;
            }
            this.contentGroupProperties = _loc3_;
            _loc4_ = this.contentGroup.mx_internal::getMXMLContent();
            if(this._contentModified && Boolean(_loc4_))
            {
               this._placeHolderGroup = new Group();
               this._placeHolderGroup.mxmlContent = _loc4_;
               this._placeHolderGroup.addEventListener(ElementExistenceEvent.ELEMENT_ADD,this.contentGroup_elementAddedHandler);
               this._placeHolderGroup.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE,this.contentGroup_elementRemovedHandler);
            }
            this.contentGroup.mxmlContent = null;
            this.contentGroup.layout = null;
         }
      }
      
      public function createDeferredContent() : void
      {
         var _loc1_:* = null;
         if(!this.mxmlContentCreated)
         {
            this.mxmlContentCreated = true;
            if(this._mxmlContentFactory)
            {
               _loc1_ = this._mxmlContentFactory.getInstance();
               this.mxmlContent = _loc1_ as Array;
               this._deferredContentCreated = true;
               dispatchEvent(new FlexEvent(FlexEvent.CONTENT_CREATION_COMPLETE));
            }
         }
      }
      
      public function get deferredContentCreated() : Boolean
      {
         return this._deferredContentCreated;
      }
      
      private function createContentIfNeeded() : void
      {
         if(!this.mxmlContentCreated && this.creationPolicy != ContainerCreationPolicy.NONE)
         {
            this.createDeferredContent();
         }
      }
      
      private function contentGroup_elementAddedHandler(param1:ElementExistenceEvent) : void
      {
         param1.element.owner = this;
         dispatchEvent(param1);
      }
      
      private function contentGroup_elementRemovedHandler(param1:ElementExistenceEvent) : void
      {
         param1.element.owner = null;
         dispatchEvent(param1);
      }
      
      [SkinPart(required="false")]
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      [SkinPart(required="false")]
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
   }
}
