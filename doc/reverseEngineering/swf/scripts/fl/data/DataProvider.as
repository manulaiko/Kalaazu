package fl.data
{
   import fl.events.DataChangeEvent;
   import fl.events.DataChangeType;
   import flash.events.EventDispatcher;
   
   public class DataProvider extends EventDispatcher
   {
       
      
      protected var data:Array;
      
      public function DataProvider(param1:Object = null)
      {
         super();
         if(param1 == null)
         {
            data = [];
         }
         else
         {
            data = getDataFromObject(param1);
         }
      }
      
      public function invalidateItemAt(param1:int) : void
      {
         checkIndex(param1,-1);
         dispatchChangeEvent(DataChangeType.INVALIDATE,[data[param1]],param1,param1);
      }
      
      protected function dispatchPreChangeEvent(param1:String, param2:Array, param3:int, param4:int) : void
      {
         dispatchEvent(new DataChangeEvent(DataChangeEvent.PRE_DATA_CHANGE,param1,param2,param3,param4));
      }
      
      public function getItemIndex(param1:Object) : int
      {
         return data.indexOf(param1);
      }
      
      public function removeItemAt(param1:uint) : Object
      {
         checkIndex(param1,-1);
         dispatchPreChangeEvent(DataChangeType.REMOVE,data.slice(param1,param1 + 1),param1,param1);
         var _loc2_:Array = data.splice(param1,1);
         dispatchChangeEvent(DataChangeType.REMOVE,_loc2_,param1,param1);
         return _loc2_[0];
      }
      
      protected function getDataFromObject(param1:Object) : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param1 is Array)
         {
            _loc3_ = param1 as Array;
            if(_loc3_.length > 0)
            {
               if(_loc3_[0] is String || _loc3_[0] is Number)
               {
                  _loc2_ = [];
                  _loc4_ = 0;
                  while(_loc4_ < _loc3_.length)
                  {
                     _loc5_ = {
                        "label":String(_loc3_[_loc4_]),
                        "data":_loc3_[_loc4_]
                     };
                     _loc2_.push(_loc5_);
                     _loc4_++;
                  }
                  return _loc2_;
               }
            }
            return param1.concat();
         }
         if(param1 is DataProvider)
         {
            return param1.toArray();
         }
         if(param1 is XML)
         {
            _loc6_ = param1 as XML;
            _loc2_ = [];
            _loc7_ = _loc6_.package_1;
            for each(_loc8_ in _loc7_)
            {
               param1 = {};
               _loc9_ = _loc8_.attributes();
               for each(_loc10_ in _loc9_)
               {
                  param1[_loc10_.localName()] = _loc10_.toString();
               }
               _loc11_ = _loc8_.package_1;
               for each(_loc12_ in _loc11_)
               {
                  if(_loc12_.hasSimpleContent())
                  {
                     param1[_loc12_.localName()] = _loc12_.toString();
                  }
               }
               _loc2_.push(param1);
            }
            return _loc2_;
         }
         throw new TypeError("Error: Type Coercion failed: cannot convert " + param1 + " to Array or DataProvider.");
      }
      
      public function addItem(param1:Object) : void
      {
         dispatchPreChangeEvent(DataChangeType.ADD,[param1],-1,-1);
         data.push(param1);
         dispatchChangeEvent(DataChangeType.ADD,[param1],-1,-1);
      }
      
      public function concat(param1:Object) : void
      {
         addItems(param1);
      }
      
      public function getItemAt(param1:uint) : Object
      {
         checkIndex(param1,-1);
         return data[param1];
      }
      
      public function sortOn(param1:Object, param2:Object = null) : *
      {
         dispatchPreChangeEvent(DataChangeType.SORT,data.concat(),0,-1);
         var _loc3_:Array = data.sortOn(param1,param2);
         dispatchChangeEvent(DataChangeType.SORT,data.concat(),0,-1);
         return _loc3_;
      }
      
      public function toArray() : Array
      {
         return data.concat();
      }
      
      public function addItems(param1:Object) : void
      {
         addItemsAt(param1,data.length);
      }
      
      public function clone() : DataProvider
      {
         return new DataProvider(data);
      }
      
      public function sort(... rest) : *
      {
         dispatchPreChangeEvent(DataChangeType.SORT,data.concat(),0,-1);
         var _loc2_:Array = data.sort.apply(data,rest);
         dispatchChangeEvent(DataChangeType.SORT,data.concat(),0,-1);
         return _loc2_;
      }
      
      public function get length() : uint
      {
         return data.length;
      }
      
      public function addItemAt(param1:Object, param2:uint) : void
      {
         checkIndex(param2,data.length);
         dispatchPreChangeEvent(DataChangeType.ADD,[param1],param2,param2);
         data.splice(param2,0,param1);
         dispatchChangeEvent(DataChangeType.ADD,[param1],param2,param2);
      }
      
      override public function toString() : String
      {
         return "DataProvider [" + data.join(" , ") + "]";
      }
      
      public function invalidateItem(param1:Object) : void
      {
         var _loc2_:uint = getItemIndex(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         invalidateItemAt(_loc2_);
      }
      
      protected function dispatchChangeEvent(param1:String, param2:Array, param3:int, param4:int) : void
      {
         dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE,param1,param2,param3,param4));
      }
      
      protected function checkIndex(param1:int, param2:int) : void
      {
         if(param1 > param2 || param1 < 0)
         {
            throw new RangeError("DataProvider index (" + param1 + ") is not in acceptable range (0 - " + param2 + ")");
         }
      }
      
      public function addItemsAt(param1:Object, param2:uint) : void
      {
         checkIndex(param2,data.length);
         var _loc3_:Array = getDataFromObject(param1);
         dispatchPreChangeEvent(DataChangeType.ADD,_loc3_,param2,param2 + _loc3_.length - 1);
         data.splice.apply(data,[param2,0].concat(_loc3_));
         dispatchChangeEvent(DataChangeType.ADD,_loc3_,param2,param2 + _loc3_.length - 1);
      }
      
      public function replaceItem(param1:Object, param2:Object) : Object
      {
         var _loc3_:int = getItemIndex(param2);
         if(_loc3_ != -1)
         {
            return replaceItemAt(param1,_loc3_);
         }
         return null;
      }
      
      public function removeItem(param1:Object) : Object
      {
         var _loc2_:int = getItemIndex(param1);
         if(_loc2_ != -1)
         {
            return removeItemAt(_loc2_);
         }
         return null;
      }
      
      public function merge(param1:Object) : void
      {
         var _loc6_:* = null;
         var _loc2_:Array = getDataFromObject(param1);
         var _loc3_:uint = _loc2_.length;
         var _loc4_:Number = 0;
         dispatchPreChangeEvent(DataChangeType.ADD,data.slice(_loc4_,data.length),_loc4_,this.data.length - 1);
         var _loc5_:Number = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc2_[_loc5_];
            if(getItemIndex(_loc6_) == -1)
            {
               data.push(_loc6_);
            }
            _loc5_++;
         }
         if(data.length > _loc4_)
         {
            dispatchChangeEvent(DataChangeType.ADD,data.slice(_loc4_,data.length),_loc4_,this.data.length - 1);
         }
         else
         {
            dispatchChangeEvent(DataChangeType.ADD,[],-1,-1);
         }
      }
      
      public function replaceItemAt(param1:Object, param2:uint) : Object
      {
         checkIndex(param2,-1);
         var _loc3_:Array = [data[param2]];
         dispatchPreChangeEvent(DataChangeType.REPLACE,_loc3_,param2,param2);
         data[param2] = param1;
         dispatchChangeEvent(DataChangeType.REPLACE,_loc3_,param2,param2);
         return _loc3_[0];
      }
      
      public function invalidate() : void
      {
         dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE,DataChangeType.INVALIDATE_ALL,data.concat(),0,data.length));
      }
      
      public function removeAll() : void
      {
         var _loc1_:Array = data.concat();
         dispatchPreChangeEvent(DataChangeType.REMOVE_ALL,_loc1_,0,_loc1_.length);
         data = [];
         dispatchChangeEvent(DataChangeType.REMOVE_ALL,_loc1_,0,_loc1_.length);
      }
   }
}
