package mx.core
{
   import flash.geom.Rectangle;
   
   public interface IRectangularBorder extends IBorder
   {
       
      
      function get backgroundImageBounds() : Rectangle;
      
      function set backgroundImageBounds(param1:Rectangle) : void;
      
      function get hasBackgroundImage() : Boolean;
      
      function layoutBackgroundImage() : void;
   }
}
