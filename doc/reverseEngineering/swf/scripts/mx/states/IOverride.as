package mx.states
{
   import mx.core.UIComponent;
   
   public interface IOverride
   {
       
      
      function initialize() : void;
      
      function apply(param1:UIComponent) : void;
      
      function remove(param1:UIComponent) : void;
   }
}
