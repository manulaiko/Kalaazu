package spark.core
{
   import mx.core.IVisualElement;
   
   public interface IViewport extends IVisualElement
   {
       
      
      function get contentWidth() : Number;
      
      function get contentHeight() : Number;
      
      function get horizontalScrollPosition() : Number;
      
      function set horizontalScrollPosition(param1:Number) : void;
      
      function get verticalScrollPosition() : Number;
      
      function set verticalScrollPosition(param1:Number) : void;
      
      function getHorizontalScrollPositionDelta(param1:uint) : Number;
      
      function getVerticalScrollPositionDelta(param1:uint) : Number;
      
      function get clipAndEnableScrolling() : Boolean;
      
      function set clipAndEnableScrolling(param1:Boolean) : void;
   }
}
