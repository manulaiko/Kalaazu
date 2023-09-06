package spark.components.gridClasses
{
   public final class GridRowNode
   {
       
      
      public var rowIndex:int;
      
      private var cellHeights:Vector.<Number>;
      
      public var maxCellHeight:Number = -1;
      
      public var fixedHeight:Number = -1;
      
      public var next:GridRowNode;
      
      public var prev:GridRowNode;
      
      private var _numColumns:uint;
      
      public function GridRowNode(param1:uint, param2:int)
      {
         super();
         this.rowIndex = param2;
         this._numColumns = param1;
         this.cellHeights = new Vector.<Number>(param1);
         GridDimensions.clearVector(this.cellHeights,-1);
      }
      
      public function get numColumns() : uint
      {
         return this._numColumns;
      }
      
      public function set numColumns(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(param1 == this._numColumns)
         {
            return;
         }
         this.cellHeights.length = param1;
         if(param1 > this._numColumns)
         {
            _loc2_ = param1 - this._numColumns;
            while(_loc2_ < param1)
            {
               this.cellHeights[_loc2_] = -1;
               _loc2_++;
            }
         }
         else
         {
            this.updateMaxHeight();
         }
         this._numColumns = param1;
      }
      
      private function updateMaxHeight() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = false;
         var _loc1_:Number = -1;
         for each(_loc2_ in this.cellHeights)
         {
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         _loc3_ = this.maxCellHeight != _loc1_;
         if(_loc3_)
         {
            this.maxCellHeight = _loc1_;
         }
         return _loc3_;
      }
      
      public function getCellHeight(param1:int) : Number
      {
         if(param1 < 0 || param1 >= this.cellHeights.length)
         {
            return NaN;
         }
         return this.cellHeights[param1];
      }
      
      public function setCellHeight(param1:int, param2:Number) : Boolean
      {
         if(this.cellHeights[param1] == param2)
         {
            return false;
         }
         this.cellHeights[param1] = param2;
         if(param2 == this.maxCellHeight)
         {
            return false;
         }
         if(param2 > this.maxCellHeight)
         {
            this.maxCellHeight = param2;
            return true;
         }
         return this.updateMaxHeight();
      }
      
      public function insertColumns(param1:int, param2:int) : void
      {
         GridDimensions.insertValueToVector(this.cellHeights,param1,param2,-1);
      }
      
      public function moveColumns(param1:int, param2:int, param3:int) : void
      {
         GridDimensions.insertElementsToVector(this.cellHeights,param2,this.cellHeights.splice(param1,param3));
      }
      
      public function clearColumns(param1:int, param2:int) : void
      {
         GridDimensions.clearVector(this.cellHeights,-1,param1,param2);
         this.updateMaxHeight();
      }
      
      public function removeColumns(param1:int, param2:int) : void
      {
         this.cellHeights.splice(param1,param2);
         this.updateMaxHeight();
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ += "(" + this.rowIndex + ", " + this.maxCellHeight + ") ";
         _loc1_ += this.cellHeights + "\n";
         if(this.prev)
         {
            _loc1_ += this.prev.rowIndex;
         }
         else
         {
            _loc1_ += "null";
         }
         _loc1_ += " <- -> ";
         if(this.next)
         {
            _loc1_ += this.next.rowIndex;
         }
         else
         {
            _loc1_ += "null";
         }
         return _loc1_;
      }
   }
}
