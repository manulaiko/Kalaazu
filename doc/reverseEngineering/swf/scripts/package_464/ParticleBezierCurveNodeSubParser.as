package package_464
{
   import package_386.class_2578;
   import package_431.class_2723;
   import package_437.class_2592;
   import package_438.class_2421;
   import package_466.class_2595;
   import package_466.class_2598;
   
   public class ParticleBezierCurveNodeSubParser extends class_2593
   {
       
      
      private var var_3561:class_2421;
      
      private var var_37:class_2421;
      
      public function ParticleBezierCurveNodeSubParser()
      {
         super();
      }
      
      public static function get identifier() : *
      {
         return class_2598.ParticleBezierCurveNodeSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_117)
         {
            _loc1_ = _data.control;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if(!(_loc4_ = class_2592.method_6525(_loc2_,class_2595.const_972)))
            {
               method_444("Unknown value");
            }
            this.var_3561 = new _loc4_(class_2723.const_292);
            method_4558(this.var_3561);
            this.var_3561.method_5169(_loc3_);
            _loc1_ = _data.end;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if(!(_loc4_ = class_2592.method_6525(_loc2_,class_2595.const_972)))
            {
               method_444("Unknown value");
            }
            this.var_37 = new _loc4_(class_2723.const_212);
            method_4558(this.var_37);
            this.var_37.method_5169(_loc3_);
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
         if(this.var_3561.method_5046 == class_2421.const_376 && this.var_37.method_5046 == class_2421.const_376)
         {
            var_4806 = new class_2723(class_2578.name_100,this.var_3561.setter.generateOneValue(),this.var_37.setter.generateOneValue());
         }
         else
         {
            var_4806 = new class_2723(class_2578.name_24);
            _setters.push(this.var_3561.setter);
            _setters.push(this.var_37.setter);
         }
      }
   }
}
