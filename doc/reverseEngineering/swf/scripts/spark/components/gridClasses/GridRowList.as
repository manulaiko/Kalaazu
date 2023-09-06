package spark.components.gridClasses
{
   import mx.collections.ArrayCollection;
   
   public class GridRowList
   {
       
      
      private var _head:GridRowNode;
      
      private var _tail:GridRowNode;
      
      private var _length:Number = 0;
      
      private var recentNode:GridRowNode;
      
      private var _numColumns:uint = 0;
      
      public function GridRowList()
      {
         super();
      }
      
      public function get first() : GridRowNode
      {
         return this._head;
      }
      
      public function get last() : GridRowNode
      {
         return this._tail;
      }
      
      public function get tail() : GridRowNode
      {
         return this._tail;
      }
      
      public function get head() : GridRowNode
      {
         return this._head;
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      public function get numColumns() : uint
      {
         return this._numColumns;
      }
      
      public function set numColumns(param1:uint) : void
      {
         if(this._numColumns == param1)
         {
            return;
         }
         this._numColumns = param1;
         var _loc2_:GridRowNode = this._head;
         while(_loc2_)
         {
            _loc2_.numColumns = param1;
            _loc2_ = _loc2_.next;
         }
      }
      
      public function insert(param1:int) : GridRowNode
      {
         if(this._head == null)
         {
            this._head = new GridRowNode(this.numColumns,param1);
            this._tail = this._head;
            ++this._length;
            return this._head;
         }
         var _loc2_:GridRowNode = this.findNearestLTE(param1);
         if(Boolean(_loc2_) && _loc2_.rowIndex == param1)
         {
            return _loc2_;
         }
         var _loc3_:GridRowNode = new GridRowNode(this.numColumns,param1);
         if(!_loc2_)
         {
            this.insertBefore(this._head,_loc3_);
         }
         else
         {
            this.insertAfter(_loc2_,_loc3_);
         }
         this.recentNode = _loc3_;
         return _loc3_;
      }
      
      public function insertAfter(param1:GridRowNode, param2:GridRowNode) : void
      {
         param2.prev = param1;
         param2.next = param1.next;
         if(param1.next == null)
         {
            this._tail = param2;
         }
         else
         {
            param1.next.prev = param2;
         }
         param1.next = param2;
         ++this._length;
      }
      
      public function insertBefore(param1:GridRowNode, param2:GridRowNode) : void
      {
         param2.prev = param1.prev;
         param2.next = param1;
         if(param1.prev == null)
         {
            this._head = param2;
         }
         else
         {
            param1.prev.next = param2;
         }
         param1.prev = param2;
         ++this._length;
      }
      
      public function find(param1:int) : GridRowNode
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this._head)
         {
            return null;
         }
         var _loc4_:int = this._tail.rowIndex - param1;
         var _loc5_:* = null;
         if(this.recentNode)
         {
            if(this.recentNode.rowIndex == param1)
            {
               return this.recentNode;
            }
            _loc2_ = this.recentNode.rowIndex - param1;
            _loc3_ = Math.abs(_loc2_);
         }
         if(_loc4_ < 0)
         {
            return null;
         }
         if(this.recentNode && _loc3_ < _loc4_ && _loc3_ < param1)
         {
            if(_loc2_ > 0)
            {
               _loc5_ = this.findBefore(param1,this.recentNode);
            }
            else
            {
               _loc5_ = this.findAfter(param1,this.recentNode);
            }
         }
         else if(_loc4_ < param1)
         {
            _loc5_ = this.findBefore(param1,this._tail);
         }
         else
         {
            _loc5_ = this.findAfter(param1,this._head);
         }
         if(_loc5_)
         {
            this.recentNode = _loc5_;
         }
         return _loc5_;
      }
      
      private function findAfter(param1:int, param2:GridRowNode) : GridRowNode
      {
         var _loc3_:GridRowNode = param2;
         var _loc4_:* = null;
         while(Boolean(_loc3_) && _loc3_.rowIndex <= param1)
         {
            if(_loc3_.rowIndex == param1)
            {
               _loc4_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc4_;
      }
      
      private function findBefore(param1:int, param2:GridRowNode) : GridRowNode
      {
         var _loc3_:GridRowNode = param2;
         var _loc4_:* = null;
         while(Boolean(_loc3_) && _loc3_.rowIndex >= param1)
         {
            if(_loc3_.rowIndex == param1)
            {
               _loc4_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_.prev;
         }
         return _loc4_;
      }
      
      public function findNearestLTE(param1:int) : GridRowNode
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this._head || param1 < 0)
         {
            return null;
         }
         var _loc5_:* = null;
         if(this.recentNode)
         {
            if(this.recentNode.rowIndex == param1)
            {
               return this.recentNode;
            }
            _loc2_ = this.recentNode.rowIndex - param1;
            _loc3_ = Math.abs(_loc2_);
         }
         _loc4_ = this._tail.rowIndex - param1;
         if(param1 < this._head.rowIndex)
         {
            _loc5_ = null;
         }
         else if(_loc4_ < 0)
         {
            _loc5_ = this._tail;
         }
         else if(this.recentNode && _loc3_ < _loc4_ && _loc3_ < param1)
         {
            if(_loc2_ > 0)
            {
               _loc5_ = this.findNearestLTEBefore(param1,this.recentNode);
            }
            else
            {
               _loc5_ = this.findNearestLTEAfter(param1,this.recentNode);
            }
         }
         else if(_loc4_ < param1)
         {
            _loc5_ = this.findNearestLTEBefore(param1,this._tail);
         }
         else
         {
            _loc5_ = this.findNearestLTEAfter(param1,this._head);
         }
         this.recentNode = _loc5_;
         return _loc5_;
      }
      
      private function findNearestLTEAfter(param1:int, param2:GridRowNode) : GridRowNode
      {
         var _loc3_:GridRowNode = param2;
         while(Boolean(_loc3_) && _loc3_.rowIndex < param1)
         {
            if(_loc3_.next == null)
            {
               break;
            }
            if(_loc3_.next.rowIndex > param1)
            {
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc3_;
      }
      
      private function findNearestLTEBefore(param1:int, param2:GridRowNode) : GridRowNode
      {
         var _loc3_:GridRowNode = param2;
         while(Boolean(_loc3_) && _loc3_.rowIndex > param1)
         {
            _loc3_ = _loc3_.prev;
         }
         return _loc3_;
      }
      
      public function push(param1:GridRowNode) : void
      {
         if(this._tail)
         {
            param1.prev = this._tail;
            param1.next = null;
            this._tail.next = param1;
            this._tail = param1;
            ++this._length;
         }
         else
         {
            param1.prev = null;
            param1.next = null;
            this._head = param1;
            this._tail = param1;
            this._length = 1;
         }
      }
      
      public function remove(param1:int) : GridRowNode
      {
         var _loc2_:GridRowNode = this.find(param1);
         if(_loc2_)
         {
            this.removeNode(_loc2_);
         }
         return _loc2_;
      }
      
      public function removeNode(param1:GridRowNode) : void
      {
         if(param1.prev == null)
         {
            this._head = param1.next;
         }
         else
         {
            param1.prev.next = param1.next;
         }
         if(param1.next == null)
         {
            this._tail = param1.prev;
         }
         else
         {
            param1.next.prev = param1.prev;
         }
         param1.next = null;
         param1.prev = null;
         if(param1 == this.recentNode)
         {
            this.recentNode = null;
         }
         --this._length;
      }
      
      public function removeAll() : void
      {
         this._head = null;
         this._tail = null;
         this._length = 0;
         this.recentNode = null;
      }
      
      public function insertColumns(param1:int, param2:int) : void
      {
         this._numColumns += param2;
         var _loc3_:GridRowNode = this.first;
         while(_loc3_)
         {
            _loc3_.insertColumns(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function removeColumns(param1:int, param2:int) : void
      {
         this._numColumns -= param2;
         var _loc3_:GridRowNode = this.first;
         while(_loc3_)
         {
            _loc3_.removeColumns(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function moveColumns(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:GridRowNode = this.first;
         while(_loc4_)
         {
            _loc4_.moveColumns(param1,param2,param3);
            _loc4_ = _loc4_.next;
         }
      }
      
      public function clearColumns(param1:int, param2:int) : void
      {
         var _loc3_:GridRowNode = this.first;
         while(_loc3_)
         {
            _loc3_.clearColumns(param1,param2);
            _loc3_ = _loc3_.next;
         }
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[ ";
         var _loc2_:GridRowNode = this.first;
         while(_loc2_)
         {
            _loc1_ += "(" + _loc2_.rowIndex + "," + _loc2_.maxCellHeight + ") -> ";
            _loc2_ = _loc2_.next;
         }
         return _loc1_ + "]";
      }
      
      public function toArray() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         var _loc2_:GridRowNode = this.first;
         while(_loc2_)
         {
            _loc1_.addItem(_loc2_);
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
   }
}
