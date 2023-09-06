package package_354
{
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_286.class_2019;
   import package_75.class_1865;
   import package_9.ResourceManager;
   
   public class class_2071 extends class_2019
   {
       
      
      public function class_2071(param1:class_1206, param2:class_1865)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         method_2332(ResourceManager.getMovieClip("ui","markTarget"));
         fps = 60;
         method_6420(true,1,true);
      }
   }
}
