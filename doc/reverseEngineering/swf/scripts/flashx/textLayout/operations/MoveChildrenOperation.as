package flashx.textLayout.operations
{
   import flashx.textLayout.edit.MementoList;
   import flashx.textLayout.edit.ModelEdit;
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.ListElement;
   import flashx.textLayout.elements.ListItemElement;
   import flashx.textLayout.elements.TextFlow;
   
   public class MoveChildrenOperation extends FlowTextOperation
   {
       
      
      private var _source:FlowGroupElement;
      
      private var _sourceIndex:int;
      
      private var _numChildren:int;
      
      private var _destination:FlowGroupElement;
      
      private var _destinationIndex:int;
      
      private var _mementoList:MementoList;
      
      public function MoveChildrenOperation(param1:SelectionState, param2:FlowGroupElement, param3:int, param4:int, param5:FlowGroupElement, param6:int)
      {
         super(param1);
         this._source = param2;
         this._sourceIndex = param3;
         this._numChildren = param4;
         this._destination = param5;
         this._destinationIndex = param6;
         this._mementoList = new MementoList(param1.textFlow);
      }
      
      public function get source() : FlowGroupElement
      {
         return this._source;
      }
      
      public function set source(param1:FlowGroupElement) : void
      {
         this._source = param1;
      }
      
      public function get sourceIndex() : int
      {
         return this._sourceIndex;
      }
      
      public function set sourceIndex(param1:int) : void
      {
         this._sourceIndex = param1;
      }
      
      public function get numChildren() : int
      {
         return this._numChildren;
      }
      
      public function set numChildren(param1:int) : void
      {
         this._numChildren = param1;
      }
      
      public function get destination() : FlowGroupElement
      {
         return this._destination;
      }
      
      public function set destination(param1:FlowGroupElement) : void
      {
         this._destination = param1;
      }
      
      public function get destinationIndex() : int
      {
         return this._destinationIndex;
      }
      
      public function set destinationIndex(param1:int) : void
      {
         this._destinationIndex = param1;
      }
      
      override public function doOperation() : Boolean
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._numChildren)
         {
            if(this._source.getChildAt(this._sourceIndex) is ListItemElement && !(this._destination is ListElement))
            {
               _loc5_ = 0;
               while(_loc5_ = (this._source.getChildAt(this._sourceIndex) as FlowGroupElement).numChildren)
               {
                  this._mementoList.push(ModelEdit.moveElement(textFlow,(this._source.getChildAt(this._sourceIndex) as FlowGroupElement).getChildAt(0),this._destination,this._destinationIndex++));
                  _loc5_++;
               }
               this._mementoList.push(ModelEdit.removeElements(textFlow,this._source,this._sourceIndex,1));
            }
            else
            {
               this._mementoList.push(ModelEdit.moveElement(textFlow,this._source.getChildAt(this._sourceIndex),this._destination,this._destinationIndex++));
            }
            _loc2_++;
         }
         var _loc3_:FlowGroupElement = this._source;
         while(_loc3_.numChildren == 0 && !(_loc3_ is TextFlow))
         {
            _loc4_ = _loc3_.parent.getChildIndex(_loc3_);
            _loc3_ = _loc3_.parent;
            this._mementoList.push(ModelEdit.removeElements(textFlow,_loc3_,_loc4_,1));
            _loc1_ = _loc3_;
         }
         if(_loc3_ is ListElement)
         {
            _loc1_ = _loc3_.parent;
            _loc4_ = _loc3_.parent.getChildIndex(_loc3_);
         }
         return true;
      }
      
      override public function undo() : SelectionState
      {
         this._mementoList.undo();
         return originalSelectionState;
      }
      
      override public function redo() : SelectionState
      {
         this._mementoList.redo();
         return originalSelectionState;
      }
   }
}
