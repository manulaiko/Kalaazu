package package_354
{
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_22.class_339;
   import package_286.class_2019;
   import package_35.class_338;
   import package_75.class_395;
   
   public class class_2060 extends class_2019
   {
       
      
      private var var_134:Boolean;
      
      private var var_397:Boolean;
      
      public function class_2060(param1:class_1206, param2:class_395)
      {
         this.var_134 = false;
         if(Boolean(param2.source) && Settings.qualityShip.value == Settings.QUALITY_HIGH)
         {
            param2.pattern = new class_339(class_338.const_1278,"startSpawnChildrenShip" + class_86(param2.source).shipPattern.getPatternID());
         }
         super(param1,param2,false);
      }
      
      override protected function method_30() : void
      {
         if(this.clip)
         {
            if(method_5878)
            {
               method_5878.visible = false;
            }
            method_3528.method_5826.addChild(this.clip);
            class_395(effect).source.position.changed.add(this.method_2522);
            this.method_2522();
            this.method_6420(false,1,this.var_134,false);
         }
      }
      
      private function method_2522() : void
      {
         this.clip.x = class_395(effect).source.x;
         this.clip.y = class_395(effect).source.y;
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         class_395(effect).source.position.changed.remove(this.method_2522);
         if(method_5878)
         {
            method_5878.visible = true;
         }
         if(!param1 && var_1714 && !this.var_397)
         {
            this.var_397 = true;
            this.method_6420(false,var_1714.totalFrames,this.var_134,true,true);
         }
         else
         {
            super.disposeView(param1);
         }
      }
   }
}
