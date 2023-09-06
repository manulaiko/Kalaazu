package spark.components
{
   import mx.core.IDataRenderer;
   import mx.core.IVisualElement;
   
   public interface IItemRenderer extends IDataRenderer, IVisualElement
   {
       
      
      function get itemIndex() : int;
      
      function set itemIndex(param1:int) : void;
      
      function get dragging() : Boolean;
      
      function set dragging(param1:Boolean) : void;
      
      function get label() : String;
      
      function set label(param1:String) : void;
      
      function get selected() : Boolean;
      
      function set selected(param1:Boolean) : void;
      
      function get showsCaret() : Boolean;
      
      function set showsCaret(param1:Boolean) : void;
   }
}
