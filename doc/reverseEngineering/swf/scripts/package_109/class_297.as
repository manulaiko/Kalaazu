package package_109
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import package_17.class_62;
   import package_29.class_84;
   import package_29.class_85;
   import package_9.class_50;
   
   public class class_297
   {
       
      
      private const const_461:Vector.<class_319> = new Vector.<class_319>();
      
      private var var_4517:class_84;
      
      private var var_1827:class_319;
      
      private var _map:class_90;
      
      public function class_297()
      {
         super();
      }
      
      public function set map(param1:class_90) : void
      {
         var _loc2_:* = null;
         if(this.var_4517)
         {
            this.var_4517.name_110.remove(this.method_2767);
            this.var_4517.name_33.remove(this.method_2228);
            this.const_461.length = 0;
            if(this.var_1827)
            {
               this.var_1827.mouseOut();
               this.var_1827 = null;
            }
         }
         this._map = param1;
         if(this._map)
         {
            this.var_4517 = this._map.method_328(class_319);
            this.var_4517.name_110.add(this.method_2767);
            this.var_4517.name_33.add(this.method_2228);
            for each(_loc2_ in this.var_4517.traits)
            {
               this.method_2767(_loc2_);
            }
         }
      }
      
      public function method_6447(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(this.method_3528 == null || this._map == null)
         {
            return false;
         }
         if(this.var_1827)
         {
            _loc3_ = Number(this.var_1827.method_1974(this.method_3528).method_3849(param1,param2));
            if(_loc3_ <= this.var_1827.clickRadius)
            {
               return true;
            }
            this.var_1827.mouseOut();
            this.var_1827 = null;
         }
         var _loc5_:int = int(this.const_461.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = Number((_loc4_ = this.const_461[_loc6_]).method_1974(this.method_3528).method_3849(param1,param2));
            if(_loc3_ <= _loc4_.clickRadius)
            {
               _loc4_.mouseOver();
               this.var_1827 = _loc4_;
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public function method_2186(param1:int, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.method_3528 == null || this._map == null)
         {
            return false;
         }
         var _loc3_:int = int(this.const_461.length);
         var _loc5_:class_86 = this._map.hero;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            if((_loc4_ = this.const_461[_loc6_]).owner.id != class_81.userID)
            {
               if((_loc7_ = Number(_loc4_.method_1974(this.method_3528).method_3849(param1,param2))) <= _loc4_.clickRadius)
               {
                  if(Boolean(_loc4_.method_2996) && _loc4_.owner.method_1954(class_287) != null)
                  {
                     if(this.method_1054 != _loc4_.owner)
                     {
                        if(!(_loc4_.owner is class_86))
                        {
                           this._map.method_4929.target = _loc4_.owner;
                        }
                        if(_loc5_)
                        {
                           _loc8_ = _loc4_.owner.position;
                           if((_loc9_ = _loc5_.position) != null && _loc8_ != null)
                           {
                              class_62.getInstance().sendNotification(MapAssetNotification.TRY_TO_SELECT_MAPASSET,[_loc4_.owner.id,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y]);
                           }
                        }
                     }
                  }
                  else
                  {
                     _loc4_.method_4753();
                  }
                  return true;
               }
            }
            _loc6_++;
         }
         return false;
      }
      
      public function method_6250(param1:int, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         if(this.method_3528 == null || this._map == null)
         {
            return false;
         }
         var _loc3_:class_85 = this.method_1054;
         if(_loc3_)
         {
            if((_loc5_ = Number((_loc4_ = _loc3_.method_1954(class_319) as class_319).method_1974(this.method_3528).method_3849(param1,param2))) <= _loc4_.clickRadius)
            {
               class_62.getInstance().sendNotification(MapAssetNotification.ATTACK_MAP_ASSET,_loc3_);
               return true;
            }
         }
         return false;
      }
      
      private function method_2767(param1:class_319) : void
      {
         this.method_5966(param1);
      }
      
      private function method_2228(param1:class_319) : void
      {
         var _loc2_:int = int(this.const_461.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.const_461.splice(_loc2_,1);
         }
         if(this.var_1827 == param1)
         {
            this.var_1827.mouseOut();
            this.var_1827 = null;
         }
      }
      
      private function method_5966(param1:class_319) : void
      {
         this.const_461.push(param1);
         this.const_461.sort(this.method_726);
      }
      
      private function get method_1054() : class_85
      {
         if(this._map)
         {
            return this._map.method_4929.target;
         }
         return null;
      }
      
      private function method_726(param1:class_319, param2:class_319) : int
      {
         return Number(param2.clickPriority) - Number(param1.clickPriority);
      }
      
      public function method_4391() : void
      {
         if(this.var_1827)
         {
            this.var_1827.mouseOut();
            this.var_1827 = null;
         }
      }
      
      private function get method_3528() : class_87
      {
         return class_50.getInstance().method_3528;
      }
      
      public function get method_495() : class_319
      {
         return this.var_1827;
      }
   }
}
