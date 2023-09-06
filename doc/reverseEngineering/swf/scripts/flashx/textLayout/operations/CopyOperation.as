package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.edit.TextClipboard;
   import flashx.textLayout.edit.TextScrap;
   
   public class CopyOperation extends FlowTextOperation
   {
       
      
      public function CopyOperation(param1:SelectionState)
      {
         super(param1);
      }
      
      override public function doOperation() : Boolean
      {
         if(false)
         {
            TextClipboard.setContents(TextScrap.createTextScrap(originalSelectionState));
         }
         return true;
      }
      
      override public function undo() : SelectionState
      {
         return originalSelectionState;
      }
      
      override public function redo() : SelectionState
      {
         return originalSelectionState;
      }
      
      override public function canUndo() : Boolean
      {
         return false;
      }
   }
}
