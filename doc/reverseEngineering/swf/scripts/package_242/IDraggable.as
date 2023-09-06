package package_242
{
   import com.bigpoint.utils.ui.class_1498;
   import flash.geom.Point;
   
   public interface IDraggable extends class_1498
   {
       
      
      function get dragOffset() : Point;
      
      function get preview() : class_1894;
      
      function get data() : Object;
   }
}
