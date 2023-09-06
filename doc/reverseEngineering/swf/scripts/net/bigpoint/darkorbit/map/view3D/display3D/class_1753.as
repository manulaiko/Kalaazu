package net.bigpoint.darkorbit.map.view3D.display3D
{
   import away3d.animators.class_2132;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_10.class_19;
   import package_200.Settings3D;
   import package_295.class_1752;
   import package_304.class_2104;
   import package_304.class_2114;
   
   public class class_1753 extends class_1752 implements class_80
   {
      
      private static const const_976:class_19 = Settings3D.effects.medium;
      
      private static const const_1233:int = 2000;
       
      
      private var var_278:class_2104;
      
      private var var_2794:Vector.<class_2132>;
      
      private var _map:class_90;
      
      public function class_1753()
      {
         this.var_2794 = new Vector.<class_2132>();
         super();
         const_976.changed.add(this.method_6160);
      }
      
      public function set map(param1:class_90) : void
      {
         this._map = param1;
         this.method_6160();
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:int = param1 * 1000;
         var _loc3_:int = this.var_2794.length - 1;
         while(_loc3_ >= 0)
         {
            this.var_2794[_loc3_].time += _loc2_;
            _loc3_--;
         }
      }
      
      private function method_6160() : void
      {
         var _loc1_:* = null;
         if(false)
         {
            if(this._map && this._map.method_3763 && String(this._map.method_3763.@starfield).length > 0)
            {
               if(String(this._map.method_3763.@starfield) != "none")
               {
                  _loc1_ = String(this._map.method_3763.@starfield);
               }
            }
            else
            {
               _loc1_ = "star_dust_chaotic";
            }
            if(_loc1_)
            {
               class_1210.instance.method_659.method_1811(_loc1_ + ".zip",class_1210.const_2984).addOnce(this.method_941);
            }
            else
            {
               this.var_278 = null;
               this.update();
            }
         }
         else
         {
            this.var_278 = null;
            this.update();
         }
      }
      
      private function method_941(param1:class_2104) : void
      {
         this.var_278 = param1;
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         while(numChildren > 0)
         {
            removeChildAt(numChildren - 1);
         }
         this.var_2794.length = 0;
         if(false && this._map && Boolean(this.var_278))
         {
            _loc1_ = Math.ceil(Number(this._map.method_1901) / Number(const_1233));
            _loc2_ = Math.ceil(Number(this._map.method_5076) / Number(const_1233));
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc1_)
               {
                  _loc3_ = this.var_278.clone() as class_2104;
                  _loc3_.x = _loc4_ * Number(const_1233);
                  _loc3_.y = 0;
                  _loc3_.z = -_loc5_ * Number(const_1233);
                  for each(_loc6_ in _loc3_.method_3953)
                  {
                     _loc6_.bounds.method_5348(0,0,0,const_1233,-300,const_1233);
                  }
                  this.var_2794.push(_loc3_.animator);
                  addChild(_loc3_);
                  _loc5_++;
               }
               _loc4_++;
            }
         }
      }
   }
}
