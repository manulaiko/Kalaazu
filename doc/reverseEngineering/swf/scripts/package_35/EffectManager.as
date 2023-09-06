package package_35
{
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import package_19.class_68;
   import package_19.class_70;
   
   public class EffectManager
   {
       
      
      private var var_877:Object;
      
      private var var_3258:Vector.<Effect>;
      
      private var var_208:Vector.<Effect>;
      
      public const const_1806:class_68 = new class_70(Effect);
      
      public const const_727:class_68 = new class_70(Effect);
      
      public function EffectManager()
      {
         this.var_877 = {};
         this.var_3258 = new Vector.<Effect>();
         this.var_208 = new Vector.<Effect>();
         super();
      }
      
      public function get effects() : Vector.<Effect>
      {
         return this.var_208.concat();
      }
      
      public function method_269(param1:Effect) : Effect
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!param1.isValid())
         {
            return param1;
         }
         if(param1.method_4512 != 0)
         {
            var _loc4_:* = this.var_877[param1.method_4512] || true;
            this.var_877[param1.method_4512] = this.var_877[param1.method_4512] || true;
            _loc2_ = _loc4_;
            _loc3_ = getTimer();
            if(_loc3_ < int(_loc2_.nextAllowedTimer))
            {
               setTimeout(this.method_3196,int(_loc2_.nextAllowedTimer) - _loc3_,param1);
               _loc2_.nextAllowedTimer = int(_loc2_.nextAllowedTimer) + 1500;
               return param1;
            }
            _loc2_.nextAllowedTimer = _loc3_ + 1500;
         }
         this.method_3196(param1);
         return param1;
      }
      
      public function method_5084(param1:Effect) : Effect
      {
         if(!param1.isValid())
         {
            return param1;
         }
         if(Boolean(param1.method_1664) || Boolean(param1.timeout))
         {
            this.var_208.push(param1);
         }
         return this.method_269(param1);
      }
      
      public function method_584(param1:Effect) : void
      {
         if(!param1.isValid())
         {
            return;
         }
         if(this.method_1894(param1.id) == null)
         {
            this.method_5084(param1);
         }
         else
         {
            this.method_1894(param1.id).method_5571(param1);
         }
      }
      
      public function method_5565(param1:class_348) : void
      {
         if(!param1.isValid())
         {
            return;
         }
         if(this.method_4909(param1.source.id,param1.id) == null)
         {
            this.method_5084(param1);
         }
         else
         {
            this.method_4909(param1.source.id,param1.id).method_5571(param1);
         }
      }
      
      public function method_1847(param1:Effect) : Effect
      {
         if(param1)
         {
            this.method_2754(param1);
            this.const_727.dispatch(param1);
            param1.deactivate();
         }
         return param1;
      }
      
      private function method_2754(param1:Effect) : void
      {
         var _loc2_:int = int(this.var_208.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_208.splice(_loc2_,1);
         }
         _loc2_ = int(this.var_3258.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_3258.splice(_loc2_,1);
         }
      }
      
      public function method_4909(param1:int, param2:int) : class_348
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_208)
         {
            if(_loc3_.id == param2 && _loc3_ is class_348 && class_348(_loc3_).source.id == param1)
            {
               return _loc3_ as class_348;
            }
         }
         return null;
      }
      
      public function method_3217(param1:int, param2:int) : class_348
      {
         return this.method_1847(this.method_4909(param1,param2)) as class_348;
      }
      
      public function method_4748(param1:int) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_208.concat(this.var_3258))
         {
            if(_loc2_ is class_348 && (_loc2_ as class_348).source.id == param1)
            {
               this.method_1847(_loc2_);
            }
         }
      }
      
      public function method_6442() : void
      {
         this.var_877 = {};
         while(this.var_208.length > 0)
         {
            this.method_1847(this.var_208.pop());
         }
      }
      
      public function method_1894(param1:int) : Effect
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_208)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function method_2947(param1:int) : Effect
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_208)
         {
            if(_loc2_.id == param1)
            {
               return this.method_1847(_loc2_) as Effect;
            }
         }
         return null;
      }
      
      private function method_3196(param1:Effect) : void
      {
         var _loc2_:Boolean = Boolean(param1.activate());
         if(_loc2_)
         {
            this.const_1806.dispatch(param1);
         }
         else if(Boolean(param1.method_1664) || Boolean(param1.timeout))
         {
            this.method_2754(param1);
            this.var_3258.push(param1);
         }
      }
      
      public function method_3771(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<Effect> = this.var_3258.concat();
         var _loc3_:int = _loc2_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = _loc2_[_loc5_] as class_348) && _loc4_.source && _loc4_.source.id == param1)
            {
               this.method_2754(_loc4_);
               this.method_5565(_loc4_);
            }
            _loc5_++;
         }
      }
      
      public function method_6294(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<Effect> = this.var_208.concat();
         var _loc3_:int = _loc2_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = _loc2_[_loc5_] as class_348) && _loc4_.source && _loc4_.source.id == param1 && !_loc4_.method_5314)
            {
               this.method_2754(_loc4_);
               this.const_727.dispatch(_loc4_);
               this.var_3258.push(_loc4_);
            }
            _loc5_++;
         }
      }
   }
}
