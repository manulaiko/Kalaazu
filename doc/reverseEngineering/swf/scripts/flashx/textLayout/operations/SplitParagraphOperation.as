package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.tlf_internal;
   
   public class SplitParagraphOperation extends SplitElementOperation
   {
       
      
      public function SplitParagraphOperation(param1:SelectionState)
      {
         var _loc2_:ParagraphElement = param1.textFlow.findLeaf(param1.absoluteStart).getParagraph();
         super(param1,_loc2_);
      }
      
      override tlf_internal function merge(param1:FlowOperation) : FlowOperation
      {
         if(this.endGeneration != param1.beginGeneration)
         {
            return null;
         }
         if(param1 is SplitParagraphOperation || param1 is InsertTextOperation)
         {
            return new CompositeOperation([this,param1]);
         }
         return null;
      }
   }
}
