package package_426
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_11.class_39;
   import package_126.class_1091;
   import package_126.class_354;
   import package_22.class_198;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_9.ResourceManager;
   
   public class class_2370 implements class_2366
   {
       
      
      private var var_1285:class_1091;
      
      private var var_127:class_2082;
      
      public function class_2370()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         this.var_127 = param2;
         var _loc4_:class_354;
         if((_loc4_ = class_354(param1.owner)).var_310 > 0)
         {
            this.var_1285 = class_198.var_3786[_loc4_.var_310] as class_1091;
            ResourceManager.name_15.load(this.var_1285.resKey,this.method_344);
         }
      }
      
      private function method_344(param1:class_39) : void
      {
         var _loc2_:MovieClip = param1.getEmbeddedMovieClip("mc");
         _loc2_.scaleX = this.var_1285.scale;
         _loc2_.scaleY = this.var_1285.scale;
         var _loc3_:ColorTransform = new ColorTransform();
         _loc3_.color = this.var_1285.color;
         _loc3_.alphaMultiplier = this.var_1285.alpha;
         _loc2_.transform.colorTransform = _loc3_;
         this.var_127.addChild(_loc2_);
      }
   }
}
