package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_27.class_82;
   
   public class class_1162 implements class_1157
   {
      
      public static const NAME:String = "playSoundEffect";
       
      
      public function class_1162()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         class_82.playSoundEffect(int(param2[0]));
      }
   }
}
