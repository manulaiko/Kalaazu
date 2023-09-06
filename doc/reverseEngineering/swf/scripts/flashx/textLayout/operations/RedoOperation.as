package flashx.textLayout.operations
{
   public class RedoOperation extends FlowOperation
   {
       
      
      private var _operation:FlowOperation;
      
      public function RedoOperation(param1:FlowOperation)
      {
         super(param1.textFlow);
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
