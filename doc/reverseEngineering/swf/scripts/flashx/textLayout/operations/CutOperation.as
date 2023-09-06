package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.edit.TextScrap;
   
   public class CutOperation extends FlowTextOperation
   {
       
      
      private var _tScrap:TextScrap;
      
      private var _deleteTextOperation:DeleteTextOperation;
      
      public function CutOperation(param1:SelectionState, param2:TextScrap)
      {
         super(param1);
         if(absoluteStart < absoluteEnd)
         {
            this._tScrap = param2;
         }
      }
      
      override public function doOperation() : Boolean
      {
         this._deleteTextOperation = new DeleteTextOperation(originalSelectionState);
         return this._deleteTextOperation.doOperation();
      }
      
      override public function undo() : SelectionState
      {
         return this._deleteTextOperation.undo();
      }
      
      override public function redo() : SelectionState
      {
         return this._deleteTextOperation.redo();
      }
      
      public function get scrapToCut() : TextScrap
      {
         return this._tScrap;
      }
      
      public function set scrapToCut(param1:TextScrap) : void
      {
         this._tScrap = param1;
      }
   }
}
