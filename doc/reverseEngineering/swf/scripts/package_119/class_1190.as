package package_119
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_29.class_85;
   
   public class class_1190 extends class_85
   {
       
      
      public function class_1190(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,new class_73(param3,param4));
         UberAssetsLib.instance.fillTraits(this,"ctbHomeZone_" + param2,UberAssetsLib.LIB_DEFAULT);
      }
   }
}
