package package_366
{
   import away3d.arcane;
   import flash.net.URLRequest;
   import package_304.class_2104;
   import package_304.class_2114;
   import package_368.class_2416;
   import package_386.class_2404;
   import package_386.class_2408;
   import package_439.InstancePropertySubParser;
   
   public class class_2109 extends class_2108
   {
       
      
      private var var_1983:class_2104;
      
      private var var_1566:Vector.<ParticleAnimationParser>;
      
      private var var_318:Vector.<InstancePropertySubParser>;
      
      private var var_3317:Object;
      
      private var var_2174:Vector.<class_2404>;
      
      public function class_2109()
      {
         super();
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "awp";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         var serializedData:Object = null;
         var data:* = param1;
         try
         {
            serializedData = JSON.parse(data);
         }
         catch(e:Error)
         {
            return false;
         }
         return serializedData.hasOwnProperty("animationDatas");
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(var_117)
         {
            this.var_3317 = _data.customParameters;
            _loc1_ = _data.animationDatas;
            this.var_1566 = new Vector.<ParticleAnimationParser>(_loc1_.length,true);
            this.var_318 = new Vector.<InstancePropertySubParser>(_loc1_.length,true);
            _loc2_ = _data.particleEvents as Array;
            if(_loc2_)
            {
               this.var_2174 = new Vector.<class_2404>();
               for each(_loc4_ in _loc2_)
               {
                  this.var_2174.push(new class_2404(_loc4_.occurTime,_loc4_.name));
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               if(_loc6_ = (_loc5_ = _loc1_[_loc3_]).property)
               {
                  _loc7_ = new InstancePropertySubParser(null);
                  method_4558(_loc7_);
                  _loc7_.method_5169(_loc6_.data);
                  this.var_318[_loc3_] = _loc7_;
               }
               if(_loc5_.embed)
               {
                  _loc8_ = new ParticleAnimationParser();
                  method_4558(_loc8_);
                  _loc8_.method_5169(_loc5_.data);
                  this.var_1566[_loc3_] = _loc8_;
               }
               else
               {
                  method_597(_loc3_.toString(),new URLRequest(_loc5_.url),true);
               }
               _loc3_++;
            }
         }
         if(super.method_196() == const_2361)
         {
            this.method_4946();
            method_3342(this.var_1983);
            return const_2361;
         }
         return const_2971;
      }
      
      override arcane function method_3765(param1:class_2416) : void
      {
         var _loc2_:int = int(param1.id);
         var _loc3_:ParticleAnimationParser = new ParticleAnimationParser();
         method_4558(_loc3_);
         _loc3_.method_5169(param1.data);
         this.var_1566[_loc2_] = _loc3_;
      }
      
      override arcane function resolveDependencyFailure(param1:class_2416) : void
      {
         method_444("resolveDependencyFailure");
      }
      
      private function method_4946() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc1_:int = int(this.var_1566.length);
         var _loc2_:Vector.<class_2114> = new Vector.<class_2114>();
         var _loc3_:Vector.<class_2408> = new Vector.<class_2408>(_loc1_,true);
         while(_loc4_ < this.var_1566.length)
         {
            _loc5_ = this.var_1566[_loc4_];
            if(this.var_318[_loc4_])
            {
               _loc3_[_loc4_] = class_2408(this.var_318[_loc4_].setter.generateOneValue());
            }
            _loc2_.push(_loc5_.method_3631);
            _loc4_++;
         }
         this.var_1983 = new class_2104(_loc2_,_loc3_,this.var_3317,this.var_2174);
      }
      
      public function get method_3352() : class_2104
      {
         return this.var_1983;
      }
   }
}
