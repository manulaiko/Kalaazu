package mx.managers.layoutClasses
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import mx.core.IChildList;
   import mx.core.IRawChildrenContainer;
   import mx.core.mx_internal;
   import mx.managers.ILayoutManagerClient;
   
   public class PriorityQueue
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var priorityBins:Array;
      
      private var minPriority:int = 0;
      
      private var maxPriority:int = -1;
      
      public function PriorityQueue()
      {
         this.priorityBins = [];
         super();
      }
      
      public function addObject(param1:Object, param2:int) : void
      {
         if(this.maxPriority < this.minPriority)
         {
            this.minPriority = this.maxPriority = param2;
         }
         else
         {
            if(param2 < this.minPriority)
            {
               this.minPriority = param2;
            }
            if(param2 > this.maxPriority)
            {
               this.maxPriority = param2;
            }
         }
         var _loc3_:PriorityBin = this.priorityBins[param2];
         if(!_loc3_)
         {
            _loc3_ = new PriorityBin();
            this.priorityBins[param2] = _loc3_;
            _loc3_.items[param1] = true;
            ++_loc3_.length;
         }
         else if(_loc3_.items[param1] == null)
         {
            _loc3_.items[param1] = true;
            ++_loc3_.length;
         }
      }
      
      public function removeLargest() : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         if(this.minPriority <= this.maxPriority)
         {
            _loc2_ = this.priorityBins[this.maxPriority];
            while(!_loc2_ || _loc2_.length == 0)
            {
               --this.maxPriority;
               if(this.maxPriority < this.minPriority)
               {
                  return null;
               }
               _loc2_ = this.priorityBins[this.maxPriority];
            }
            var _loc4_:int = 0;
            var _loc5_:* = _loc2_.items;
            for(_loc1_ in _loc5_)
            {
               this.removeChild(ILayoutManagerClient(_loc3_),this.maxPriority);
            }
            while(!_loc2_ || _loc2_.length == 0)
            {
               --this.maxPriority;
               if(this.maxPriority < this.minPriority)
               {
                  break;
               }
               _loc2_ = this.priorityBins[this.maxPriority];
            }
         }
         return _loc1_;
      }
      
      public function removeLargestChild(param1:ILayoutManagerClient) : Object
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = this.maxPriority;
         var _loc3_:int = param1.nestLevel;
         while(_loc3_ <= _loc2_)
         {
            if((Boolean(_loc4_ = this.priorityBins[_loc2_])) && _loc4_.length > 0)
            {
               if(_loc2_ == param1.nestLevel)
               {
                  if(_loc4_.items[param1])
                  {
                     this.removeChild(ILayoutManagerClient(param1),_loc2_);
                     return param1;
                  }
               }
               else
               {
                  for(_loc5_ in _loc4_.items)
                  {
                     if(_loc5_ is DisplayObject && this.contains(DisplayObject(param1),DisplayObject(_loc5_)))
                     {
                        this.removeChild(ILayoutManagerClient(_loc5_),_loc2_);
                        return _loc5_;
                     }
                  }
               }
               _loc2_--;
            }
            else
            {
               if(_loc2_ == this.maxPriority)
               {
                  --this.maxPriority;
               }
               _loc2_--;
               if(_loc2_ < _loc3_)
               {
                  break;
               }
            }
         }
         return null;
      }
      
      public function removeSmallest() : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         if(this.minPriority <= this.maxPriority)
         {
            _loc2_ = this.priorityBins[this.minPriority];
            while(!_loc2_ || _loc2_.length == 0)
            {
               ++this.minPriority;
               if(this.minPriority > this.maxPriority)
               {
                  return null;
               }
               _loc2_ = this.priorityBins[this.minPriority];
            }
            var _loc4_:int = 0;
            var _loc5_:* = _loc2_.items;
            for(_loc1_ in _loc5_)
            {
               this.removeChild(ILayoutManagerClient(_loc3_),this.minPriority);
            }
            while(!_loc2_ || _loc2_.length == 0)
            {
               ++this.minPriority;
               if(this.minPriority > this.maxPriority)
               {
                  break;
               }
               _loc2_ = this.priorityBins[this.minPriority];
            }
         }
         return _loc1_;
      }
      
      public function removeSmallestChild(param1:ILayoutManagerClient) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = param1.nestLevel;
         while(_loc2_ <= this.maxPriority)
         {
            _loc3_ = this.priorityBins[_loc2_];
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               if(_loc2_ == param1.nestLevel)
               {
                  if(_loc3_.items[param1])
                  {
                     this.removeChild(ILayoutManagerClient(param1),_loc2_);
                     return param1;
                  }
               }
               else
               {
                  for(_loc4_ in _loc3_.items)
                  {
                     if(_loc4_ is DisplayObject && this.contains(DisplayObject(param1),DisplayObject(_loc4_)))
                     {
                        this.removeChild(ILayoutManagerClient(_loc4_),_loc2_);
                        return _loc4_;
                     }
                  }
               }
               _loc2_++;
            }
            else
            {
               if(_loc2_ == this.minPriority)
               {
                  ++this.minPriority;
               }
               _loc2_++;
               if(_loc2_ > this.maxPriority)
               {
                  break;
               }
            }
         }
         return null;
      }
      
      public function removeChild(param1:ILayoutManagerClient, param2:int = -1) : Object
      {
         var _loc3_:int = param2 >= 0 ? param2 : param1.nestLevel;
         var _loc4_:PriorityBin;
         if((Boolean(_loc4_ = this.priorityBins[_loc3_])) && _loc4_.items[param1] != null)
         {
            delete _loc4_.items[param1];
            --_loc4_.length;
            return param1;
         }
         return null;
      }
      
      public function removeAll() : void
      {
         this.priorityBins.length = 0;
         this.minPriority = 0;
         this.maxPriority = -1;
      }
      
      public function isEmpty() : Boolean
      {
         return this.minPriority > this.maxPriority;
      }
      
      private function contains(param1:DisplayObject, param2:DisplayObject) : Boolean
      {
         var _loc3_:* = null;
         if(param1 is IRawChildrenContainer)
         {
            _loc3_ = IRawChildrenContainer(param1).rawChildren;
            return _loc3_.contains(param2);
         }
         if(param1 is DisplayObjectContainer)
         {
            return DisplayObjectContainer(param1).contains(param2);
         }
         return param1 == param2;
      }
   }
}

import flash.utils.Dictionary;

class PriorityBin
{
    
   
   public var length:int;
   
   public var items:Dictionary;
   
   function PriorityBin()
   {
      this.items = new Dictionary();
      super();
   }
}
