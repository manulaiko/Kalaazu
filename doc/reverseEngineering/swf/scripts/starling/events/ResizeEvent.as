package starling.events
{
   import flash.geom.Point;
   
   public class ResizeEvent extends Event
   {
      
      public static const RESIZE:String = "resize";
       
      
      public function ResizeEvent(param1:String, param2:int, param3:int, param4:Boolean = false)
      {
         super(param1,param4,new Point(param2,param3));
      }
      
      public function get width() : int
      {
         return (data as Point).x;
      }
      
      public function get height() : int
      {
         return (data as Point).y;
      }
   }
}
