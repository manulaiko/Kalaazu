package mx.core
{
   import flash.display.DisplayObjectContainer;
   import mx.geom.TransformOffsets;
   
   public interface IVisualElement extends ILayoutElement, ILayoutDirectionElement
   {
       
      
      function get owner() : DisplayObjectContainer;
      
      function set owner(param1:DisplayObjectContainer) : void;
      
      function get parent() : DisplayObjectContainer;
      
      function get depth() : Number;
      
      function set depth(param1:Number) : void;
      
      function get visible() : Boolean;
      
      function set visible(param1:Boolean) : void;
      
      function get alpha() : Number;
      
      function set alpha(param1:Number) : void;
      
      function get width() : Number;
      
      function set width(param1:Number) : void;
      
      function get height() : Number;
      
      function set height(param1:Number) : void;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
      
      function get designLayer() : DesignLayer;
      
      function set designLayer(param1:DesignLayer) : void;
      
      function get postLayoutTransformOffsets() : TransformOffsets;
      
      function set postLayoutTransformOffsets(param1:TransformOffsets) : void;
      
      function get is3D() : Boolean;
   }
}
