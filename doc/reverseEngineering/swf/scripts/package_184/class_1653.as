package package_184
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_10.class_1921;
   import package_29.class_85;
   
   public class class_1653 extends class_85
   {
       
      
      public const const_3243:class_1921 = new class_1921();
      
      public function class_1653()
      {
         super(class_90.method_5486,new class_73(4900,2700));
         UberAssetsLib.instance.fillTraits(this,"trainingArenaScore",UberAssetsLib.LIB_DEFAULT);
      }
      
      public function get data() : class_1652
      {
         return this.const_3243.value as class_1652;
      }
   }
}
