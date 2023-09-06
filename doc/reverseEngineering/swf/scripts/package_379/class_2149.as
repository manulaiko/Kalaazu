package package_379
{
   import away3d.animators.class_2121;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_19.class_1199;
   import package_19.class_68;
   import package_19.class_70;
   import package_199.class_2478;
   import package_200.class_1781;
   import package_295.class_1752;
   import package_296.class_2479;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_308.class_1777;
   import package_310.class_1780;
   
   public class class_2149 extends class_1752
   {
      
      public static const const_2042:String = "";
      
      public static const const_1376:String = "idle";
       
      
      public const changed:class_68 = new class_70();
      
      public var name_55:Object;
      
      protected var var_891:class_2477;
      
      private var var_4253:class_1752;
      
      private var var_557:Vector.<class_2114>;
      
      private var var_213:int = 0;
      
      private var _vertices:int = 0;
      
      private var var_3940:Vector.<class_2121>;
      
      private var var_3370:Function;
      
      private var var_999:int = 0;
      
      private var var_4287:Vector.<class_1780>;
      
      private var var_4036:class_1199;
      
      private var var_42:class_2480;
      
      private var _alpha:Number = 1;
      
      private const const_666:Dictionary = new Dictionary(true);
      
      private var var_1954:int = 0;
      
      public function class_2149(param1:class_2477, param2:Class, param3:class_1781)
      {
         this.name_55 = {"glow":1};
         this.var_557 = new Vector.<class_2114>();
         this.var_3940 = new Vector.<class_2121>();
         this.var_4287 = new Vector.<class_1780>();
         super();
         this.var_891 = param1;
         this.var_42 = class_2480.method_1034(param1,param3,param2);
         this.log("created");
         this.method_3479();
      }
      
      override public function set zOffset(param1:int) : void
      {
         super.zOffset = param1;
         var _loc2_:int = numChildren - 1;
         while(_loc2_ >= 0)
         {
            getChildAt(_loc2_).zOffset = param1;
            _loc2_--;
         }
      }
      
      public function get method_3545() : class_2480
      {
         return this.var_42;
      }
      
      public function set geometry(param1:class_1752) : void
      {
         if(this.var_4253)
         {
            class_1210.instance.method_3761.method_1645(this.var_4253);
         }
         if(this.var_4036)
         {
            this.var_4036.remove(this.method_4854);
            this.var_4036 = null;
         }
         this.var_4253 = param1;
         if(this.var_4253)
         {
            class_1210.instance.method_3761.method_1440(param1);
         }
         this.method_3035();
         this.changed.dispatch();
      }
      
      public function set alpha(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this._alpha == 1 != (param1 == 1))
         {
            this._alpha = param1;
            this.method_3170();
         }
         else
         {
            this._alpha = param1;
            _loc3_ = numChildren - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = getChildAt(_loc3_) as class_2114;
               if(Boolean(_loc2_) && _loc2_.material is class_1776)
               {
                  class_1776(_loc2_.material).alpha = param1;
               }
               _loc3_--;
            }
         }
      }
      
      override public function dispose() : void
      {
         this.log("- PrefabView3D.dispose " + this.var_891.method_522);
         this.geometry = null;
         if(this.var_42)
         {
            class_2480.method_6261(this.var_42);
            this.var_42 = null;
         }
         if(this.var_4036)
         {
            this.var_4036.remove(this.method_4854);
            this.var_4036 = null;
         }
         super.dispose();
      }
      
      public function addMethod(param1:class_1780) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         this.method_804(param1);
         this.var_4287.push(param1);
         if(this.var_4287.length == 1)
         {
            this.method_3170();
         }
         else
         {
            _loc3_ = numChildren - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = getChildAt(_loc3_) as class_2114;
               if(Boolean(_loc2_) && _loc2_.material is class_1777)
               {
                  class_1777(_loc2_.material).addDynamicMethod(param1);
               }
               _loc3_--;
            }
         }
      }
      
      public function method_804(param1:class_1780) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:int = int(this.var_4287.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_4287.splice(_loc2_,1);
            if(this.var_4287.length == 0)
            {
               this.method_3170();
            }
            else
            {
               _loc4_ = numChildren - 1;
               while(_loc4_ >= 0)
               {
                  _loc3_ = getChildAt(_loc4_) as class_2114;
                  if(Boolean(_loc3_) && _loc3_.material is class_1777)
                  {
                     class_1777(_loc3_.material).removeDynamicMethod(param1);
                  }
                  _loc4_--;
               }
            }
         }
      }
      
      public function method_2531() : void
      {
         while(this.var_4287.length)
         {
            this.method_804(this.var_4287[this.var_4287.length - 1]);
         }
      }
      
      public function method_6420(param1:String, param2:Function = null, param3:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_3370 = param2;
         this.var_999 = 0;
         var _loc4_:int = this.var_3940.length - 1;
         while(_loc4_ >= 0)
         {
            if((_loc5_ = this.var_3940[_loc4_]).animationSet.method_294(param1))
            {
               ++this.var_999;
               _loc5_.play(param1,param3 ? Math.random() * 10000 : 0).addEventListener(class_2478.const_665,this.method_6130);
            }
            else
            {
               _loc5_.stop();
            }
            _loc4_--;
         }
         if(this.var_999 == 0 && this.var_3370 != null)
         {
            _loc6_ = this.var_3370;
            this.var_3370 = null;
            _loc6_();
         }
      }
      
      protected function method_961(param1:class_2114) : void
      {
         param1 = param1.clone() as class_2114;
         param1.pickingCollider = class_2479.const_2591;
         param1.name_55 = this.name_55;
         this.method_2674(param1);
         this.var_557.push(param1);
         param1.zOffset = zOffset;
         if(Boolean(param1.animator) && param1.animator is class_2121)
         {
            this.var_3940.push(param1.animator as class_2121);
         }
         addChild(param1);
      }
      
      private function method_3035() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(this.var_557.length)
         {
            this.var_557.pop().dispose();
         }
         while(this.var_3940.length)
         {
            this.var_3940.pop().dispose();
         }
         this.var_213 = 0;
         this._vertices = 0;
         if(this.var_4253)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_4253.numChildren)
            {
               _loc1_ = this.var_4253.getChildAt(_loc2_);
               if(_loc1_ is class_2114)
               {
                  this.method_961(_loc1_ as class_2114);
               }
               _loc2_++;
            }
            this.method_6420(const_1376,null,true);
         }
      }
      
      private function method_3170() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_557)
         {
            this.method_2674(_loc1_);
         }
      }
      
      private function method_2674(param1:class_2114) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = [];
         if(param1.animator)
         {
            _loc2_.push(param1.animator.animationSet);
         }
         _loc2_.push(this._alpha < 1);
         for each(_loc3_ in this.var_4287)
         {
            _loc2_.push(_loc3_);
         }
         param1.material = this.var_42.method_1034(this.method_397(_loc2_));
         class_1777(param1.material).removeDynamicMethods();
         if(param1.material is class_1777)
         {
            for each(_loc3_ in this.var_4287)
            {
               class_1777(param1.material).addDynamicMethod(_loc3_);
            }
         }
         if(param1.material is class_1776)
         {
            class_1776(param1.material).alpha = this._alpha;
         }
      }
      
      private function method_3479() : void
      {
         this.log("- geometryFileName: " + this.var_891.method_522);
         if(this.var_4036)
         {
            this.var_4036.remove(this.method_4854);
            this.var_4036 = null;
         }
         if(this.var_891.method_522)
         {
            this.var_4036 = class_1210.instance.method_3761.method_3479(this.var_891.method_522,class_1210.const_973);
            this.var_4036.addOnce(this.method_4854);
         }
         else
         {
            this.geometry = null;
         }
      }
      
      private function method_4854(param1:class_1752) : void
      {
         this.geometry = param1;
      }
      
      private function log(param1:String) : void
      {
      }
      
      private function method_6130(param1:class_2478) : void
      {
         var _loc2_:* = null;
         param1.currentTarget.removeEventListener(class_2478.const_665,this.method_6130);
         --this.var_999;
         if(this.var_999 <= 0 && this.var_3370 != null)
         {
            _loc2_ = this.var_3370;
            this.var_3370 = null;
            _loc2_();
         }
      }
      
      private function method_397(param1:Array) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = param1.length - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ += this.method_773(param1[0]);
            _loc3_--;
         }
         return _loc2_;
      }
      
      private function method_773(param1:*) : String
      {
         if(this.const_666[param1] === undefined)
         {
            this.const_666[param1] = this.var_1954++;
         }
         return this.const_666[param1];
      }
   }
}
