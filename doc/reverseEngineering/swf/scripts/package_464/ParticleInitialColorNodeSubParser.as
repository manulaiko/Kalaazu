package package_464
{
   import package_386.class_2578;
   import package_431.class_2651;
   import package_438.class_2421;
   import package_466.class_2598;
   import package_481.CompositeColorValueSubParser;
   
   public class ParticleInitialColorNodeSubParser extends class_2593
   {
       
      
      private var var_2992:CompositeColorValueSubParser;
      
      public function ParticleInitialColorNodeSubParser()
      {
         super();
      }
      
      public static function get identifier() : *
      {
         return class_2598.ParticleInitialColorNodeSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_117)
         {
            _loc1_ = _data.color;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            this.var_2992 = new CompositeColorValueSubParser(class_2651.const_1047);
            method_4558(this.var_2992);
            this.var_2992.method_5169(_loc3_);
         }
         if(super.method_196() == const_2361)
         {
            this.method_184();
            return const_2361;
         }
         return const_2971;
      }
      
      private function method_184() : void
      {
         if(this.var_2992.method_5046 == class_2421.const_376)
         {
            var_4806 = new class_2651(class_2578.name_100,this.var_2992.usesMultiplier,this.var_2992.usesOffset,this.var_2992.setter.generateOneValue());
         }
         else
         {
            var_4806 = new class_2651(class_2578.name_24,this.var_2992.usesMultiplier,this.var_2992.usesOffset);
            _setters.push(this.var_2992.setter);
         }
      }
   }
}
