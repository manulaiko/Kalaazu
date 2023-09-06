package package_360
{
   import com.bigpoint.utils.class_73;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_114.class_1177;
   import package_115.class_1085;
   import package_115.class_316;
   import package_22.class_198;
   
   public class class_2380 implements class_1177, IDisposable
   {
       
      
      private const DEGTORAD:Number = 0.017453292519943295;
      
      private const RADTODEG:Number = 57.29577951308232;
      
      private var _ship:class_86;
      
      private var var_1297:class_2381;
      
      private var var_1810:Boolean = true;
      
      private var var_1425:Vector.<Vector.<String>>;
      
      private var var_1617:Object;
      
      public function class_2380(param1:class_86, param2:class_2381)
      {
         super();
         this._ship = param1;
         this.var_1297 = param2;
         this.var_1297.changed.add(this.method_672);
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_1297.changed.remove(this.method_672);
      }
      
      private function get shipPattern() : class_316
      {
         return this._ship.shipPattern;
      }
      
      private function get method_2941() : class_1085
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.shipPattern.method_6389())
         {
            _loc1_ = 0;
            for each(_loc2_ in class_198.var_4079[this.shipPattern.expansionClassID])
            {
               if(_loc2_.getPatternID() < 1000)
               {
                  _loc1_++;
               }
            }
            return class_198.method_2454(this.shipPattern.expansionClassID,Math.max(_loc1_ - 1,1));
         }
         return null;
      }
      
      public function method_1470() : Vector.<Vector.<String>>
      {
         if(this.var_1810)
         {
            this.validate();
         }
         return this.var_1425;
      }
      
      public function method_1051(param1:String, param2:Vector3D) : void
      {
         if(this.var_1810)
         {
            this.validate();
         }
         var _loc3_:Vector.<class_73> = this.var_1617[param1];
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Number = Number(this._ship.rotation.degrees);
         while(_loc4_ < 0)
         {
            _loc4_ += 360;
         }
         var _loc5_:class_73 = !!_loc3_ ? _loc3_[int((32 * _loc4_ / 360 + 0.5) % 32) % _loc3_.length] : class_73.ZERO;
         param2.x = _loc5_.x;
         param2.y = _loc5_.y;
         param2.z = 0;
      }
      
      private function method_672() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:MovieClip = this.var_1297.clip;
         if(Boolean(_loc1_) && _loc1_.framesLoaded == 1)
         {
            _loc3_ = _loc1_.numChildren - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = _loc1_.getChildAt(_loc3_);
               if(_loc2_.name.search("laser") != -1)
               {
                  _loc2_.visible = false;
               }
               _loc3_--;
            }
         }
         this.var_1810 = true;
      }
      
      private function validate() : void
      {
         this.var_1425 = null;
         this.var_1617 = null;
         var _loc1_:MovieClip = this.var_1297.clip;
         if(Boolean(this.var_1810) && _loc1_ != null)
         {
            if(_loc1_.framesLoaded == 1)
            {
               this.method_4643(_loc1_);
            }
            else if(this.shipPattern.method_6389())
            {
               this.var_1425 = this.method_2941.method_1178;
               this.var_1617 = this.method_2941.method_5261;
            }
         }
         if(this.var_1425 == null || this.var_1617 == null)
         {
            this.var_1425 = new Vector.<Vector.<String>>();
            this.var_1425.push(Vector.<String>["mainCannon"]);
            this.var_1617 = {};
            if(_loc1_ != null)
            {
               this.var_1617["mainCannon"] = this.method_4643(_loc1_);
            }
         }
         this.var_1810 = false;
      }
      
      private function method_4643(param1:MovieClip) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(this.shipPattern.var_682 == null)
         {
            this.shipPattern.var_682 = new Vector.<Vector.<String>>();
            this.shipPattern.var_682.push(new Vector.<String>());
            this.shipPattern.var_3325 = {};
            _loc3_ = param1.numChildren - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = param1.getChildAt(_loc3_);
               if(_loc2_.name.search("laser") != -1)
               {
                  _loc4_ = Math.sqrt(_loc2_.x * _loc2_.x + _loc2_.y * _loc2_.y);
                  _loc5_ = Math.round(Math.atan2(_loc2_.y,_loc2_.x) * 57.29577951308232);
                  _loc7_ = new Vector.<class_73>();
                  _loc8_ = 0;
                  while(_loc8_ < 360)
                  {
                     (_loc6_ = new class_73()).x = int(_loc4_ * Math.cos((_loc8_ + _loc5_) * 0.017453292519943295));
                     _loc6_.y = int(_loc4_ * Math.sin((_loc8_ + _loc5_) * 0.017453292519943295));
                     _loc7_.push(_loc6_);
                     _loc8_++;
                  }
                  this.shipPattern.var_682[0].push("cannon" + _loc3_);
                  this.shipPattern.var_3325["cannon" + _loc3_] = _loc7_;
               }
               _loc3_--;
            }
            if(this.shipPattern.var_682[0].length == 0)
            {
               this.shipPattern.var_682[0].push("mainCannon");
            }
         }
         this.var_1425 = this.shipPattern.var_682;
         this.var_1617 = this.shipPattern.var_3325;
      }
   }
}
