package package_443
{
   import away3d.animators.class_2403;
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import package_304.class_2114;
   import package_373.class_2134;
   import package_373.class_2460;
   import package_430.class_2652;
   import package_431.class_2651;
   
   public class class_2464 implements class_2461
   {
       
      
      private var var_1643:class_308;
      
      private var var_127:class_2134;
      
      private var var_3916:class_2652;
      
      public function class_2464()
      {
         super();
      }
      
      public function initialize(param1:class_306, param2:class_2134, param3:Object) : void
      {
         this.var_1643 = param1.owner.method_1954(class_308) as class_308;
         this.var_1643.changed.add(this.update);
         this.var_127 = param2;
      }
      
      public function decorate() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:class_2460 = this.var_127.method_4434("bulb") as class_2460;
         if(_loc1_)
         {
            for each(_loc2_ in _loc1_.particles.method_3953)
            {
               if(_loc2_.name == "glow")
               {
                  _loc3_ = class_2403(_loc2_.animator);
                  _loc4_ = _loc3_.animationSet.method_1957("ParticleInitialColorGlobal") as class_2651;
                  this.var_3916 = _loc3_.method_3412(_loc4_) as class_2652;
                  this.update();
                  break;
               }
            }
         }
      }
      
      private function update() : void
      {
         TweenLite.to(this,0.25,{"alpha":Number(this.var_1643.hp.value) / Number(this.var_1643.const_3026.value)});
      }
      
      public function get alpha() : Number
      {
         if(this.var_3916)
         {
            return Number(this.var_3916.method_5929.alphaMultiplier) || false;
         }
         return 0;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(this.var_3916)
         {
            this.var_3916.method_5929.alphaMultiplier = param1 || false;
            this.var_3916.method_5929 = this.var_3916.method_5929;
         }
      }
   }
}
