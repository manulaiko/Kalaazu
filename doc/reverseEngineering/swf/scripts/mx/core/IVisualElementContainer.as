package mx.core
{
   public interface IVisualElementContainer
   {
       
      
      function get numElements() : int;
      
      function getElementAt(param1:int) : IVisualElement;
      
      function addElement(param1:IVisualElement) : IVisualElement;
      
      function addElementAt(param1:IVisualElement, param2:int) : IVisualElement;
      
      function removeElement(param1:IVisualElement) : IVisualElement;
      
      function removeElementAt(param1:int) : IVisualElement;
      
      function removeAllElements() : void;
      
      function getElementIndex(param1:IVisualElement) : int;
      
      function setElementIndex(param1:IVisualElement, param2:int) : void;
      
      function swapElements(param1:IVisualElement, param2:IVisualElement) : void;
      
      function swapElementsAt(param1:int, param2:int) : void;
   }
}
