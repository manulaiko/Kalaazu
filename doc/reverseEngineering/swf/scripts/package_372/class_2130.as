package package_372
{
   import away3d.arcane;
   import package_304.class_1766;
   import package_376.class_2144;
   
   public class class_2130
   {
       
      
      protected var var_2818:class_2224;
      
      private var var_2627:Boolean;
      
      private var var_4974:class_2225;
      
      public function class_2130(param1:class_2224)
      {
         super();
         this.var_2818 = param1 || new class_2452();
      }
      
      public function get method_2528() : Boolean
      {
         return this.var_2818.method_2528;
      }
      
      public function set method_2528(param1:Boolean) : void
      {
         this.var_2818.method_2528 = param1;
      }
      
      public function traverse(param1:class_2144) : void
      {
         this.method_5320();
         ++class_2144.arcane::var_251;
         this.var_2818.method_2995(param1);
      }
      
      arcane function markForUpdate(param1:class_1766) : void
      {
         var _loc2_:class_2225 = param1.method_2492();
         var _loc3_:class_2225 = this.var_4974;
         while(_loc3_)
         {
            if(_loc2_ == _loc3_)
            {
               return;
            }
            _loc3_ = _loc3_.arcane::var_4303;
         }
         _loc2_.arcane::var_4303 = this.var_4974;
         this.var_4974 = _loc2_;
         this.var_2627 = true;
      }
      
      arcane function removeEntity(param1:class_1766) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_2225 = param1.method_2492();
         _loc2_.removeFromParent();
         if(_loc2_ == this.var_4974)
         {
            this.var_4974 = _loc2_.arcane::var_4303;
         }
         else
         {
            _loc3_ = this.var_4974;
            while(Boolean(_loc3_) && _loc3_.arcane::var_4303 != _loc2_)
            {
               _loc3_ = _loc3_.arcane::var_4303;
            }
            if(_loc3_)
            {
               _loc3_.arcane::var_4303 = _loc2_.arcane::var_4303;
            }
         }
         _loc2_.arcane::var_4303 = null;
         if(!this.var_4974)
         {
            this.var_2627 = false;
         }
      }
      
      public function method_5320() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this.var_2627)
         {
            return;
         }
         var _loc1_:class_2225 = this.var_4974;
         this.var_4974 = null;
         this.var_2627 = false;
         do
         {
            _loc2_ = this.var_2818.method_4072(_loc1_.entity);
            if(_loc1_.parent != _loc2_)
            {
               if(_loc1_)
               {
                  _loc1_.removeFromParent();
               }
               _loc2_.arcane::method_2249(_loc1_);
            }
            _loc3_ = _loc1_.arcane::var_4303;
            _loc1_.arcane::var_4303 = null;
            _loc1_.entity.arcane::method_6458();
         }
         while((_loc1_ = _loc3_) != null);
         
      }
   }
}
