package package_464
{
   import package_386.class_2578;
   import package_431.class_2729;
   import package_438.class_2421;
   import package_466.class_2598;
   import package_470.OneDConstValueSubParser;
   import package_481.CompositeColorValueSubParser;
   
   public class ParticleColorNodeSubParser extends class_2593
   {
       
      
      private var var_202:CompositeColorValueSubParser;
      
      private var var_1422:CompositeColorValueSubParser;
      
      private var var_867:OneDConstValueSubParser;
      
      private var var_3775:OneDConstValueSubParser;
      
      private var var_219:Boolean;
      
      private var var_81:Boolean;
      
      public function ParticleColorNodeSubParser()
      {
         super();
      }
      
      public static function get identifier() : *
      {
         return class_2598.ParticleColorNodeSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_117)
         {
            this.var_219 = _data.usesCycle;
            this.var_81 = _data.usesPhase;
            this.var_219 = _data.usesCycle;
            if(this.var_219)
            {
               _loc1_ = _data.cycleDuration;
               _loc2_ = _loc1_.id;
               _loc3_ = _loc1_.data;
               this.var_867 = new OneDConstValueSubParser(null);
               method_4558(this.var_867);
               this.var_867.method_5169(_loc3_);
            }
            this.var_81 = _data.usesPhase;
            if(this.var_81)
            {
               _loc1_ = _data.cyclePhase;
               _loc2_ = _loc1_.id;
               _loc3_ = _loc1_.data;
               this.var_3775 = new OneDConstValueSubParser(null);
               method_4558(this.var_3775);
               this.var_3775.method_5169(_loc3_);
            }
            _loc1_ = _data.startColor;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            this.var_202 = new CompositeColorValueSubParser(class_2729.const_1540);
            method_4558(this.var_202);
            this.var_202.method_5169(_loc3_);
            _loc1_ = _data.endColor;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            this.var_1422 = new CompositeColorValueSubParser(class_2729.const_1523);
            method_4558(this.var_1422);
            this.var_1422.method_5169(_loc3_);
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
         var _loc1_:Number = 1;
         var _loc2_:Number = 0;
         if(this.var_219)
         {
            _loc1_ = Number(this.var_867.setter.generateOneValue());
            if(this.var_81)
            {
               _loc2_ = Number(this.var_3775.setter.generateOneValue());
            }
         }
         if(this.var_202.method_5046 == class_2421.const_376 && this.var_1422.method_5046 == class_2421.const_376)
         {
            var_4806 = new class_2729(class_2578.name_100,this.var_202.usesMultiplier,this.var_202.usesOffset,this.var_219,this.var_81,this.var_202.setter.generateOneValue(),this.var_1422.setter.generateOneValue(),_loc1_,_loc2_);
         }
         else
         {
            var_4806 = new class_2729(class_2578.name_24,this.var_202.usesMultiplier,this.var_202.usesOffset,this.var_219,this.var_81,null,null,_loc1_,_loc2_);
            _setters.push(this.var_202.setter);
            _setters.push(this.var_1422.setter);
         }
      }
   }
}
