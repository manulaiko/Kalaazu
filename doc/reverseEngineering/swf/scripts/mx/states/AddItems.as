package mx.states
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import mx.collections.IList;
   import mx.core.ContainerCreationPolicy;
   import mx.core.IChildList;
   import mx.core.IDeferredContentOwner;
   import mx.core.ITransientDeferredInstance;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class AddItems extends OverrideBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const FIRST:String = "first";
      
      public static const LAST:String = "last";
      
      public static const BEFORE:String = "before";
      
      public static const AFTER:String = "after";
       
      
      private var added:Boolean = false;
      
      private var startIndex:int;
      
      private var numAdded:int;
      
      private var instanceCreated:Boolean = false;
      
      private var _creationPolicy:String = "auto";
      
      private var _destructionPolicy:String = "never";
      
      public var destination:Object;
      
      private var _items;
      
      private var _itemsFactory:ITransientDeferredInstance;
      
      public var position:String = "last";
      
      public var isStyle:Boolean = false;
      
      public var isArray:Boolean = false;
      
      public var vectorClass:Class;
      
      public var propertyName:String;
      
      public var relativeTo:Object;
      
      private var _waitingForDeferredContent:Boolean = false;
      
      public function AddItems()
      {
         super();
      }
      
      public function get creationPolicy() : String
      {
         return this._creationPolicy;
      }
      
      public function set creationPolicy(param1:String) : void
      {
         this._creationPolicy = param1;
         if(this._creationPolicy == ContainerCreationPolicy.ALL)
         {
            this.createInstance();
         }
      }
      
      public function get destructionPolicy() : String
      {
         return this._destructionPolicy;
      }
      
      public function set destructionPolicy(param1:String) : void
      {
         this._destructionPolicy = param1;
      }
      
      public function get items() : *
      {
         if(!this._items && this.creationPolicy != ContainerCreationPolicy.NONE)
         {
            this.createInstance();
         }
         return this._items;
      }
      
      public function set items(param1:*) : void
      {
         this._items = param1;
      }
      
      public function get itemsFactory() : ITransientDeferredInstance
      {
         return this._itemsFactory;
      }
      
      public function set itemsFactory(param1:ITransientDeferredInstance) : void
      {
         this._itemsFactory = param1;
         if(this.creationPolicy == ContainerCreationPolicy.ALL)
         {
            this.createInstance();
         }
      }
      
      public function createInstance() : void
      {
         if(!this.instanceCreated && !this._items && Boolean(this.itemsFactory))
         {
            this.instanceCreated = true;
            this.items = this.itemsFactory.getInstance();
         }
      }
      
      override public function initialize() : void
      {
         if(this.creationPolicy == ContainerCreationPolicy.AUTO)
         {
            this.createInstance();
         }
      }
      
      override public function apply(param1:UIComponent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         _loc2_ = getOverrideContext(this.destination,param1);
         this.added = false;
         parentContext = param1;
         if(!_loc2_)
         {
            if(this.destination != null && !applied)
            {
               addContextListener(this.destination);
            }
            applied = true;
            return;
         }
         applied = true;
         this.destination = _loc2_;
         if(this.items is Array && !this.isArray)
         {
            _loc3_ = this.items;
         }
         else
         {
            _loc3_ = [this.items];
         }
         switch(this.position)
         {
            case FIRST:
               this.startIndex = 0;
               break;
            case LAST:
               this.startIndex = -1;
               break;
            case BEFORE:
               this.startIndex = this.getRelatedIndex(param1,_loc2_);
               break;
            case AFTER:
               this.startIndex = this.getRelatedIndex(param1,_loc2_) + 1;
         }
         if((this.propertyName == null || this.propertyName == "mxmlContent") && _loc2_ is IVisualElementContainer)
         {
            if(!this.addItemsToContentHolder(_loc2_ as IVisualElementContainer,_loc3_))
            {
               return;
            }
         }
         else if(this.propertyName == null && _loc2_ is IChildList)
         {
            this.addItemsToContainer(_loc2_ as IChildList,_loc3_);
         }
         else if(this.propertyName != null && !this.isStyle && _loc2_[this.propertyName] is IList)
         {
            this.addItemsToIList(_loc2_[this.propertyName],_loc3_);
         }
         else if(this.vectorClass)
         {
            this.addItemsToVector(_loc2_,this.propertyName,_loc3_);
         }
         else
         {
            this.addItemsToArray(_loc2_,this.propertyName,_loc3_);
         }
         this.added = true;
         this.numAdded = _loc3_.length;
      }
      
      override public function remove(param1:UIComponent) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = getOverrideContext(this.destination,param1);
         if(!this.added)
         {
            if(_loc2_ == null)
            {
               removeContextListener();
            }
            else if(this._waitingForDeferredContent)
            {
               this.removeCreationCompleteListener();
            }
            applied = false;
            parentContext = null;
            return;
         }
         if(this.items is Array && !this.isArray)
         {
            _loc3_ = this.items;
         }
         else
         {
            _loc3_ = [this.items];
         }
         if((this.propertyName == null || this.propertyName == "mxmlContent") && _loc2_ is IVisualElementContainer)
         {
            _loc4_ = 0;
            while(_loc4_ < this.numAdded)
            {
               if(IVisualElementContainer(_loc2_).numElements > this.startIndex)
               {
                  IVisualElementContainer(_loc2_).removeElementAt(this.startIndex);
               }
               _loc4_++;
            }
         }
         else if(this.propertyName == null && _loc2_ is IChildList)
         {
            _loc4_ = 0;
            while(_loc4_ < this.numAdded)
            {
               if(IChildList(_loc2_).numChildren > this.startIndex)
               {
                  IChildList(_loc2_).removeChildAt(this.startIndex);
               }
               _loc4_++;
            }
         }
         else if(this.propertyName != null && !this.isStyle && _loc2_[this.propertyName] is IList)
         {
            this.removeItemsFromIList(_loc2_[this.propertyName] as IList);
         }
         else if(this.vectorClass)
         {
            _loc5_ = this.isStyle ? _loc2_.getStyle(this.propertyName) : _loc2_[this.propertyName];
            if(this.numAdded < _loc5_.length)
            {
               _loc5_.splice(this.startIndex,this.numAdded);
               this.assign(_loc2_,this.propertyName,_loc5_);
            }
            else
            {
               this.assign(_loc2_,this.propertyName,new this.vectorClass());
            }
         }
         else
         {
            _loc6_ = this.isStyle ? _loc2_.getStyle(this.propertyName) : _loc2_[this.propertyName];
            if(this.numAdded < _loc6_.length)
            {
               _loc6_.splice(this.startIndex,this.numAdded);
               this.assign(_loc2_,this.propertyName,_loc6_);
            }
            else
            {
               this.assign(_loc2_,this.propertyName,new Array());
            }
         }
         if(this.destructionPolicy == "auto")
         {
            this.destroyInstance();
         }
         this.added = false;
         applied = false;
         parentContext = null;
      }
      
      private function destroyInstance() : void
      {
         if(this._itemsFactory)
         {
            this.instanceCreated = false;
            this.items = null;
            this._itemsFactory.reset();
         }
      }
      
      protected function getObjectIndex(param1:Object, param2:Object) : int
      {
         try
         {
            if((this.propertyName == null || this.propertyName == "mxmlContent") && param2 is IVisualElementContainer)
            {
               return IVisualElementContainer(param2).getElementIndex(param1 as IVisualElement);
            }
            if(this.propertyName == null && param2 is IChildList)
            {
               return IChildList(param2).getChildIndex(DisplayObject(param1));
            }
            if(this.propertyName != null && !this.isStyle && param2[this.propertyName] is IList)
            {
               return IList(param2[this.propertyName].list).getItemIndex(param1);
            }
            if(this.propertyName != null && this.isStyle)
            {
               return param2.getStyle(this.propertyName).indexOf(param1);
            }
            return param2[this.propertyName].indexOf(param1);
         }
         catch(e:Error)
         {
            return -1;
         }
      }
      
      protected function getRelatedIndex(param1:UIComponent, param2:Object) : int
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:int = -1;
         if(this.relativeTo is Array)
         {
            _loc4_ = 0;
            while(_loc4_ < this.relativeTo.length && _loc3_ < 0)
            {
               _loc5_ = getOverrideContext(this.relativeTo[_loc4_],param1);
               _loc3_ = this.getObjectIndex(_loc5_,param2);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = getOverrideContext(this.relativeTo,param1);
            _loc3_ = this.getObjectIndex(_loc5_,param2);
         }
         return _loc3_;
      }
      
      protected function addItemsToContentHolder(param1:IVisualElementContainer, param2:Array) : Boolean
      {
         var _loc4_:* = null;
         if(param1 is IDeferredContentOwner && param1 is IEventDispatcher)
         {
            if(!(_loc4_ = param1 as IDeferredContentOwner).deferredContentCreated)
            {
               IEventDispatcher(param1).addEventListener("contentCreationComplete",this.onDestinationContentCreated);
               this._waitingForDeferredContent = true;
               return false;
            }
         }
         if(this.startIndex == -1)
         {
            this.startIndex = param1.numElements;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.addElementAt(param2[_loc3_],this.startIndex + _loc3_);
            _loc3_++;
         }
         return true;
      }
      
      protected function addItemsToContainer(param1:IChildList, param2:Array) : void
      {
         if(this.startIndex == -1)
         {
            this.startIndex = param1.numChildren;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.addChildAt(param2[_loc3_],this.startIndex + _loc3_);
            _loc3_++;
         }
      }
      
      protected function addItemsToArray(param1:Object, param2:String, param3:Array) : void
      {
         var _loc4_:Array;
         if(!(_loc4_ = this.isStyle ? param1.getStyle(param2) : param1[param2]))
         {
            _loc4_ = new Array();
         }
         if(this.startIndex == -1)
         {
            this.startIndex = _loc4_.length;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param3.length)
         {
            _loc4_.splice(this.startIndex + _loc5_,0,param3[_loc5_]);
            _loc5_++;
         }
         this.assign(param1,param2,_loc4_);
      }
      
      protected function addItemsToVector(param1:Object, param2:String, param3:Array) : void
      {
         var _loc4_:Object;
         if(!(_loc4_ = this.isStyle ? param1.getStyle(param2) : param1[param2]))
         {
            _loc4_ = new this.vectorClass();
         }
         if(this.startIndex == -1)
         {
            this.startIndex = _loc4_.length;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param3.length)
         {
            _loc4_.splice(this.startIndex + _loc5_,0,param3[_loc5_]);
            _loc5_++;
         }
         this.assign(param1,param2,_loc4_);
      }
      
      protected function addItemsToIList(param1:IList, param2:Array) : void
      {
         if(this.startIndex == -1)
         {
            this.startIndex = param1.length;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.addItemAt(param2[_loc3_],this.startIndex + _loc3_);
            _loc3_++;
         }
      }
      
      protected function removeItemsFromIList(param1:IList) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.numAdded)
         {
            param1.removeItemAt(this.startIndex);
            _loc2_++;
         }
      }
      
      protected function assign(param1:Object, param2:String, param3:Object) : void
      {
         if(this.isStyle)
         {
            param1.setStyle(param2,param3);
            param1.styleChanged(param2);
            param1.notifyStyleChangeInChildren(param2,true);
         }
         else
         {
            param1[param2] = param3;
         }
      }
      
      private function onDestinationContentCreated(param1:Event) : void
      {
         if(parentContext)
         {
            this.removeCreationCompleteListener();
            this.apply(parentContext);
         }
      }
      
      private function removeCreationCompleteListener() : void
      {
         if(parentContext)
         {
            parentContext.removeEventListener("contentCreationComplete",this.onDestinationContentCreated);
            this._waitingForDeferredContent = false;
         }
      }
   }
}
