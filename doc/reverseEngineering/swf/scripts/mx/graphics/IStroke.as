package mx.graphics
{
   import flash.display.Graphics;
   import flash.display.GraphicsStroke;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public interface IStroke
   {
       
      
      function get weight() : Number;
      
      function set weight(param1:Number) : void;
      
      function get scaleMode() : String;
      
      function get miterLimit() : Number;
      
      function get joints() : String;
      
      function apply(param1:Graphics, param2:Rectangle, param3:Point) : void;
      
      function createGraphicsStroke(param1:Rectangle, param2:Point) : GraphicsStroke;
   }
}
