package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_17.class_62;
   import package_97.class_257;
   
   public class class_1160 implements class_1157
   {
      
      public static const NAME:String = "toggleDebugView";
       
      
      public function class_1160()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         class_62.getInstance().sendNotification(class_257.const_99);
      }
   }
}
