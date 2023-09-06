package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowElement;
   
   public class ApplyElementIDOperation extends FlowElementOperation
   {
       
      
      private var _origID:String;
      
      private var _newID:String;
      
      public function ApplyElementIDOperation(param1:SelectionState, param2:FlowElement, param3:String, param4:int = 0, param5:int = -1)
      {
         this._newID = param3;
         super(param1,param2,param4,param5);
      }
      
      public function get newID() : String
      {
         return this._newID;
      }
      
      public function set newID(param1:String) : void
      {
         this._newID = param1;
      }
      
      override public function doOperation() : Boolean
      {
         var _loc1_:FlowElement = getTargetElement();
         this._origID = _loc1_.id;
         adjustForDoOperation(_loc1_);
         _loc1_.id = this._newID;
         return true;
      }
      
      override public function undo() : SelectionState
      {
         var _loc1_:FlowElement = getTargetElement();
         _loc1_.id = this._origID;
         adjustForUndoOperation(_loc1_);
         return originalSelectionState;
      }
   }
}
