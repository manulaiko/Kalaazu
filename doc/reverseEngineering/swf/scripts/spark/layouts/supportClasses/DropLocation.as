package spark.layouts.supportClasses
{
   import flash.geom.Point;
   import mx.events.DragEvent;
   
   public class DropLocation
   {
       
      
      public var dragEvent:DragEvent = null;
      
      public var dropIndex:int = -1;
      
      public var dropPoint:Point = null;
      
      public function DropLocation()
      {
         super();
      }
   }
}
