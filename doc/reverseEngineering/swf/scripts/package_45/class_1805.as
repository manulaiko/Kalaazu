package package_45
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.traits.class_2255;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_27.class_82;
   import package_29.class_85;
   import package_38.class_868;
   
   public class class_1805 extends class_85
   {
      
      private static const const_583:uint = 65280;
      
      private static const const_1058:int = 800;
       
      
      private var var_4070:class_2255;
      
      private var var_9:class_306;
      
      public function class_1805(param1:class_868)
      {
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295));
         UberAssetsLib.instance.fillTraits(this,"pod_heal",UberAssetsLib.LIB_DEFAULT);
         this.var_9 = method_1954(class_306) as class_306;
         this.var_9.state.value = "active";
         this.var_4070 = new class_2255(true,const_1058,const_583,false,2);
         addTrait(this.var_4070);
         class_82.playSoundEffect(class_126.const_2942,true,false,this.position.x,this.position.y,true,true);
      }
      
      override public function method_166() : void
      {
         class_82.method_3212(class_126.const_2942);
         this.var_4070.disable();
         super.method_166();
      }
      
      public function method_3779() : void
      {
         this.var_4070.enable(const_1058,const_583);
      }
      
      public function deactivate() : void
      {
         class_82.method_3212(class_126.const_2942);
         this.var_9.state.value = "inactive";
         if(this.var_4070.enabled)
         {
            this.var_4070.disable();
         }
      }
   }
}
