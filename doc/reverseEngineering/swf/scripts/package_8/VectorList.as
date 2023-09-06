package package_8
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   import mx.collections.IList;
   import mx.core.IPropertyChangeNotifier;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.ArrayUtil;
   
   public class VectorList extends EventDispatcher implements IList, IExternalizable, IPropertyChangeNotifier
   {
       
      
      private var _uid:String = "";
      
      private var _source:Object = null;
      
      private var resourceManager:IResourceManager = null;
      
      private var var_1067:uint = 0;
      
      private var var_4336:Array = null;
      
      private var var_3330:Boolean = false;
      
      public function VectorList(param1:Object = null)
      {
         super();
         this.resourceManager = ResourceManager.getInstance();
         if(param1)
         {
            this.source = param1;
         }
         else
         {
            this.source = new Vector.<Object>();
         }
      }
      
      public static function method_1449(param1:Object) : Boolean
      {
         if(param1 is Vector.<*> || param1 is Vector.<int> || param1 is Vector.<uint> || param1 is Vector.<String> || param1 is Vector.<Number> || param1 is Vector.<Boolean>)
         {
            return true;
         }
         return false;
      }
      
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = null;
         if(!VectorList.method_1449(param1))
         {
            throw new ArgumentError("Argument is not a Vector");
         }
         if(Boolean(this._source) && Boolean(this._source.length))
         {
            _loc2_ = uint(this._source.length);
            while(_loc2_--)
            {
               this.method_6465(this._source[_loc2_]);
            }
         }
         this._source = !!param1 ? param1 : new Vector.<Object>();
         _loc2_ = uint(this._source.length);
         while(_loc2_--)
         {
            this.method_3060(this._source[_loc2_]);
         }
         if(this.var_1067 == 0)
         {
            _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc3_.kind = CollectionEventKind.RESET;
            this.dispatchEvent(_loc3_);
         }
         this.var_3330 = false;
      }
      
      public function get length() : int
      {
         if(this.source)
         {
            return this.source.length;
         }
         return 0;
      }
      
      public function addItem(param1:Object) : void
      {
         this.addItemAt(param1,this.length);
      }
      
      public function addItemAt(param1:Object, param2:int) : void
      {
         if(param2 < 0 || param2 > this.length)
         {
            throw new RangeError(this.resourceManager.getString("collections","outOfBounds",[param2]));
         }
         this.source.splice(param2,0,param1);
         this.method_3060(param1);
         this.method_1193(CollectionEventKind.ADD,param1,param2);
         this.var_3330 = false;
      }
      
      public function getItemAt(param1:int, param2:int = 0) : Object
      {
         if(param1 < 0 || param1 >= this.length)
         {
            throw new RangeError(this.resourceManager.getString("collections","outOfBounds",[param1]));
         }
         return this.source[param1];
      }
      
      public function getItemIndex(param1:Object) : int
      {
         return ArrayUtil.getItemIndex(param1,this.toArray());
      }
      
      public function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void
      {
         var _loc5_:* = null;
         (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.UPDATE;
         _loc5_.source = param1;
         _loc5_.property = param2;
         _loc5_.oldValue = param3;
         _loc5_.newValue = param4;
         this.method_2811(_loc5_);
         this.var_3330 = false;
      }
      
      public function removeAll() : void
      {
         var _loc1_:* = 0;
         _loc1_ = uint(this.source.length);
         while(_loc1_--)
         {
            this.method_6465(this.source[_loc1_]);
         }
         this.source.splice(0,this.source.length);
         this.method_1193(CollectionEventKind.RESET);
         this.var_3330 = false;
      }
      
      public function removeItem(param1:Object) : int
      {
         var _loc2_:int = int(this.getItemIndex(param1));
         if(_loc2_ != -1)
         {
            this.removeItemAt(_loc2_);
         }
         return _loc2_;
      }
      
      public function removeItemAt(param1:int) : Object
      {
         var _loc2_:* = null;
         if(param1 < 0 || param1 >= this.source.length)
         {
            throw new RangeError(this.resourceManager.getString("collections","outOfBounds",[param1]));
         }
         _loc2_ = this.source.splice(param1,1)[0];
         this.var_3330 = false;
         this.method_6465(_loc2_);
         this.method_1193(CollectionEventKind.REMOVE,_loc2_,param1);
         return _loc2_;
      }
      
      public function setItemAt(param1:Object, param2:int) : Object
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 < 0 || param2 >= this.source.length)
         {
            throw new RangeError(this.resourceManager.getString("collections","outOfBounds",[param2]));
         }
         _loc3_ = this.source[param2];
         this.source[param2] = param1;
         this.var_3330 = false;
         this.method_6465(_loc3_);
         this.method_3060(param1);
         if(this.var_1067 == 0)
         {
            _loc4_ = Boolean(this.hasEventListener(CollectionEvent.COLLECTION_CHANGE));
            _loc5_ = Boolean(this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE));
            if(_loc4_ || _loc5_)
            {
               (_loc6_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.UPDATE;
               _loc6_.oldValue = _loc3_;
               _loc6_.newValue = param1;
               _loc6_.property = param2;
            }
            if(_loc4_)
            {
               (_loc7_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.REPLACE;
               _loc7_.location = param2;
               _loc7_.items.push(_loc6_);
               this.dispatchEvent(_loc7_);
            }
            if(_loc5_)
            {
               this.dispatchEvent(_loc6_);
            }
         }
         return _loc3_;
      }
      
      public function toArray() : Array
      {
         var _loc1_:* = 0;
         if(!this.var_3330)
         {
            this.var_4336 = new Array(this.source.length);
            _loc1_ = uint(this.source.length);
            while(_loc1_--)
            {
               this.var_4336[_loc1_] = this.source[_loc1_];
            }
            this.var_3330 = false;
         }
         return this.var_4336.concat();
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         param1.writeObject(this._source);
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         this.source = param1.readObject();
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
      }
      
      protected function method_6465(param1:Object) : void
      {
         if(Boolean(param1) && param1 is IEventDispatcher)
         {
            IEventDispatcher(param1).removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.method_2811);
         }
      }
      
      protected function method_2811(param1:PropertyChangeEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         this.method_1193(CollectionEventKind.UPDATE,param1);
         if(this.var_1067 == 0 && Boolean(this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)))
         {
            _loc2_ = PropertyChangeEvent(param1.clone());
            _loc3_ = uint(this.getItemIndex(param1.target));
            _loc2_.property = _loc3_.toString() + "." + param1.property;
            this.dispatchEvent(_loc2_);
         }
      }
      
      private function method_3060(param1:Object) : void
      {
         if(Boolean(param1) && param1 is IEventDispatcher)
         {
            IEventDispatcher(param1).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.method_2811,false,0,true);
         }
      }
      
      private function method_1193(param1:String, param2:Object = null, param3:int = -1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_1067 == 0)
         {
            if(this.hasEventListener(CollectionEvent.COLLECTION_CHANGE))
            {
               (_loc4_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = param1;
               _loc4_.items.push(param2);
               _loc4_.location = param3;
               this.dispatchEvent(_loc4_);
            }
            if(Boolean(this.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)) && (param1 == CollectionEventKind.ADD || param1 == CollectionEventKind.REMOVE))
            {
               (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).property = param3;
               if(param1 == CollectionEventKind.ADD)
               {
                  _loc5_.newValue = param2;
               }
               else
               {
                  _loc5_.oldValue = param2;
               }
               this.dispatchEvent(_loc5_);
            }
         }
      }
   }
}
