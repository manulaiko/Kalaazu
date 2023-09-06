package mx.graphics
{
   import flash.display.Graphics;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public interface IFill
   {
       
      
      function begin(param1:Graphics, param2:Rectangle, param3:Point) : void;
      
      function end(param1:Graphics) : void;
   }
}
