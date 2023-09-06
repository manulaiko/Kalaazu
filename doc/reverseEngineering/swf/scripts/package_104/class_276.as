package package_104
{
   import flash.geom.Point;
   
   public class class_276 extends class_274
   {
      
      public static const ID:String = "verticallListLayout";
       
      
      public function class_276()
      {
         super();
      }
      
      override public function method_1821(param1:int, param2:int) : Point
      {
         var _loc3_:int = param2 * param1;
         return new Point(0 + _xOffset,_loc3_ + _yOffset);
      }
      
      override public function method_1064(param1:int, param2:int) : Point
      {
         var _loc3_:int = param2 * param1;
         return new Point(0,_loc3_);
      }
      
      override public function get id() : String
      {
         return ID;
      }
   }
}
