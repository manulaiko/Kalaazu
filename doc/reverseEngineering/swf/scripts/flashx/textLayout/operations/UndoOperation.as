package flashx.textLayout.operations
{
   public class UndoOperation extends FlowOperation
   {
       
      
      private var _operation:FlowOperation;
      
      public function UndoOperation(param1:FlowOperation)
      {
         super(null);
         this._operation = param1;
      }
      
      public function get operation() : FlowOperation
      {
         return this._operation;
      }
      
      public function set operation(param1:FlowOperation) : void
      {
         this._operation = param1;
      }
   }
}
