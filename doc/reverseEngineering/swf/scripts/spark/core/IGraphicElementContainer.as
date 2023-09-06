package spark.core
{
   public interface IGraphicElementContainer
   {
       
      
      function invalidateGraphicElementSharing(param1:IGraphicElement) : void;
      
      function invalidateGraphicElementProperties(param1:IGraphicElement) : void;
      
      function invalidateGraphicElementSize(param1:IGraphicElement) : void;
      
      function invalidateGraphicElementDisplayList(param1:IGraphicElement) : void;
   }
}
