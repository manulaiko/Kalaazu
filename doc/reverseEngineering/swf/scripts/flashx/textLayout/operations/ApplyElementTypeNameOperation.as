package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowElement;
   
   public class ApplyElementTypeNameOperation extends FlowElementOperation
   {
       
      
      private var _undoTypeName:String;
      
      private var _typeName:String;
      
      public function ApplyElementTypeNameOperation(param1:SelectionState, param2:FlowElement, param3:String, param4:int = 0, param5:int = -1)
      {
         this._typeName = param3;
         super(param1,param2,param4,param5);
      }
      
      public function get typeName() : String
      {
         return this._typeName;
      }
      
      public function set typeName(param1:String) : void
      {
         this._typeName = param1;
      }
      
      override public function doOperation() : Boolean
      {
         var _loc1_:FlowElement = getTargetElement();
         this._undoTypeName = _loc1_.typeName;
         adjustForDoOperation(_loc1_);
         _loc1_.typeName = this._typeName;
         return true;
      }
      
      override public function undo() : SelectionState
      {
         var _loc1_:FlowElement = getTargetElement();
         _loc1_.typeName = this._undoTypeName;
         adjustForUndoOperation(_loc1_);
         return originalSelectionState;
      }
   }
}
