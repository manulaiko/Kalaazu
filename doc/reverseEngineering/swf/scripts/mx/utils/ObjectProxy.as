package mx.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   import flash.utils.getQualifiedClassName;
   import mx.core.IPropertyChangeNotifier;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   
   [Bindable("propertyChange")]
   public dynamic class ObjectProxy extends Proxy implements IExternalizable, IPropertyChangeNotifier
   {
       
      
      protected var dispatcher:EventDispatcher;
      
      protected var notifiers:Object;
      
      protected var proxyClass:Class;
      
      protected var propertyList:Array;
      
      private var _proxyLevel:int;
      
      private var _item:Object;
      
      private var _type:QName;
      
      private var _id:String;
      
      public function ObjectProxy(param1:Object = null, param2:String = null, param3:int = -1)
      {
         this.proxyClass = ObjectProxy;
         super();
         if(!param1)
         {
            param1 = {};
         }
         this._item = param1;
         this._proxyLevel = param3;
         this.notifiers = {};
         this.dispatcher = new EventDispatcher(this);
         if(param2)
         {
            this._id = param2;
         }
      }
      
      object_proxy function get object() : Object
      {
         return this._item;
      }
      
      object_proxy function get type() : QName
      {
         return this._type;
      }
      
      object_proxy function set type(param1:QName) : void
      {
         this._type = param1;
      }
      
      public function get uid() : String
      {
         if(this._id === null)
         {
            this._id = UIDUtil.createUID();
         }
         return this._id;
      }
      
      public function set uid(param1:String) : void
      {
         this._id = param1;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(this.notifiers[param1.toString()])
         {
            return this.notifiers[param1];
         }
         _loc2_ = this._item[param1];
         if(_loc2_)
         {
            if(this._proxyLevel == 0 || ObjectUtil.isSimple(_loc2_))
            {
               return _loc2_;
            }
            _loc2_ = this.object_proxy::getComplexProperty(param1,_loc2_);
         }
         return _loc2_;
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         return this._item[param1].apply(this._item,rest);
      }
      
      override flash_proxy function deleteProperty(param1:*) : Boolean
      {
         var _loc5_:* = null;
         var _loc2_:IPropertyChangeNotifier = IPropertyChangeNotifier(this.notifiers[param1]);
         if(_loc2_)
         {
            _loc2_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.propertyChangeHandler);
            delete this.notifiers[param1];
         }
         var _loc3_:* = this._item[param1];
         var _loc4_:* = delete this._item[param1];
         if(this.dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
         {
            (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.DELETE;
            _loc5_.property = param1;
            _loc5_.oldValue = _loc3_;
            _loc5_.source = this;
            this.dispatcher.dispatchEvent(_loc5_);
         }
         return _loc4_;
      }
      
      override flash_proxy function hasProperty(param1:*) : Boolean
      {
         return param1 in this._item;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return this.propertyList[param1 - 1];
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 == 0)
         {
            this.setupPropertyList();
         }
         if(param1 < this.propertyList.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this._item[this.propertyList[param1 - 1]];
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = this._item[param1];
         if(_loc3_ !== param2)
         {
            this._item[param1] = param2;
            if(_loc4_ = IPropertyChangeNotifier(this.notifiers[param1]))
            {
               _loc4_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.propertyChangeHandler);
               delete this.notifiers[param1];
            }
            if(this.dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
            {
               if(param1 is QName)
               {
                  param1 = QName(param1).localName;
               }
               _loc5_ = PropertyChangeEvent.createUpdateEvent(this,param1.toString(),_loc3_,param2);
               this.dispatcher.dispatchEvent(_loc5_);
            }
         }
      }
      
      object_proxy function getComplexProperty(param1:*, param2:*) : *
      {
         if(param2 is IPropertyChangeNotifier)
         {
            param2.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.propertyChangeHandler);
            this.notifiers[param1] = param2;
            return param2;
         }
         if(getQualifiedClassName(param2) == "Object")
         {
            param2 = new this.proxyClass(this._item[param1],null,this._proxyLevel > 0 ? this._proxyLevel - 1 : this._proxyLevel);
            param2.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.propertyChangeHandler);
            this.notifiers[param1] = param2;
            return param2;
         }
         return param2;
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         var _loc2_:Object = param1.readObject();
         this._item = _loc2_;
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         param1.writeObject(this._item);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.dispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.dispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.dispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.dispatcher.willTrigger(param1);
      }
      
      public function propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         this.dispatcher.dispatchEvent(param1);
      }
      
      protected function setupPropertyList() : void
      {
         var _loc1_:* = null;
         if(getQualifiedClassName(this._item) == "Object")
         {
            this.propertyList = [];
            for(_loc1_ in this._item)
            {
               this.propertyList.push(_loc1_);
            }
         }
         else
         {
            this.propertyList = ObjectUtil.getClassInfo(this._item,null,{
               "includeReadOnly":true,
               "uris":["package_1"]
            }).properties;
         }
      }
   }
}
