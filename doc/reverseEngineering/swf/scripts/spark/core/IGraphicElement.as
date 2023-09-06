package spark.core
{
   import flash.display.DisplayObject;
   import mx.core.IVisualElement;
   
   public interface IGraphicElement extends IVisualElement
   {
       
      
      function get displayObject() : DisplayObject;
      
      function get displayObjectSharingMode() : String;
      
      function set displayObjectSharingMode(param1:String) : void;
      
      function createDisplayObject() : DisplayObject;
      
      function setSharedDisplayObject(param1:DisplayObject) : Boolean;
      
      function canShareWithPrevious(param1:IGraphicElement) : Boolean;
      
      function canShareWithNext(param1:IGraphicElement) : Boolean;
      
      function parentChanged(param1:IGraphicElementContainer) : void;
      
      function validateProperties() : void;
      
      function validateSize() : void;
      
      function validateDisplayList() : void;
   }
}
