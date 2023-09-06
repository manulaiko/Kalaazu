package spark.components
{
   import mx.core.IVisualElement;
   
   public interface IItemRendererOwner
   {
       
      
      function itemToLabel(param1:Object) : String;
      
      function updateRenderer(param1:IVisualElement, param2:int, param3:Object) : void;
   }
}
