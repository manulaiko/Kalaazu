package mx.core
{
   public interface IDeferredContentOwner extends IUIComponent
   {
       
      
      function get creationPolicy() : String;
      
      function set creationPolicy(param1:String) : void;
      
      function createDeferredContent() : void;
      
      function get deferredContentCreated() : Boolean;
   }
}
