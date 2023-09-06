package package_464
{
   import package_386.class_2717;
   import package_431.class_2718;
   import package_466.class_2598;
   import package_481.ConstColorValueSubParser;
   
   public class ParticleSegmentedColorNodeSubParser extends class_2593
   {
       
      
      private var var_202:ConstColorValueSubParser;
      
      private var var_1422:ConstColorValueSubParser;
      
      private var var_1248:Array;
      
      private var var_291:Boolean;
      
      private var var_456:Boolean;
      
      public function ParticleSegmentedColorNodeSubParser()
      {
         super();
      }
      
      public static function get identifier() : *
      {
         return class_2598.ParticleSegmentedColorNodeSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(var_117)
         {
            this.var_291 = _data.usesMultiplier;
            this.var_456 = _data.usesOffset;
            _loc1_ = _data.startColor;
            _loc3_ = _loc1_.data;
            this.var_202 = new ConstColorValueSubParser(null);
            method_4558(this.var_202);
            this.var_202.method_5169(_loc3_);
            _loc1_ = _data.endColor;
            _loc3_ = _loc1_.data;
            this.var_1422 = new ConstColorValueSubParser(null);
            method_4558(this.var_1422);
            this.var_1422.method_5169(_loc3_);
            this.var_1248 = new Array();
            _loc4_ = _data.segmentPoints;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = new ConstColorValueSubParser(null);
               method_4558(_loc6_);
               this.var_1248.push({
                  "life":_loc4_[_loc5_].life,
                  "color":_loc6_
               });
               _loc6_.method_5169(_loc4_[_loc5_].color.data);
               _loc5_++;
            }
            this.var_1248.sortOn("life",0 | 0);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length - 1)
            {
               if(this.var_1248[_loc5_].life == this.var_1248[_loc5_ + 1].life)
               {
                  this.var_1248[_loc5_].life -= 0.00001 * (_loc4_.length - _loc5_);
               }
               _loc5_++;
            }
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
         var _loc3_:int = 0;
         var _loc1_:Vector.<class_2717> = new Vector.<class_2717>();
         var _loc2_:int = int(this.var_1248.length);
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(new class_2717(this.var_1248[_loc3_].life,this.var_1248[_loc3_].color.setter.generateOneValue()));
            _loc3_++;
         }
         var_4806 = new class_2718(this.var_291,this.var_456,_loc2_,this.var_202.setter.generateOneValue(),this.var_1422.setter.generateOneValue(),_loc1_);
      }
   }
}
