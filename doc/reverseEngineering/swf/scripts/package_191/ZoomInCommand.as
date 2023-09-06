package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_9.class_50;
   
   public class ZoomInCommand implements class_1157
   {
      
      public static const NAME:String = "ZoomInCommand";
       
      
      public function ZoomInCommand()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         class_50.getInstance().method_3528.zoomIn();
      }
   }
}
