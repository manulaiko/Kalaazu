package package_380
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.geom.Vector3D;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationModule;
   import package_19.class_1199;
   import package_200.Settings3D;
   import package_22.class_1090;
   import package_22.class_198;
   import package_22.class_222;
   import package_22.class_426;
   import package_294.class_2429;
   import package_295.class_1752;
   import package_297.class_2483;
   import package_297.class_2486;
   import package_304.class_2104;
   import package_304.class_2114;
   import package_307.class_2448;
   import package_36.class_184;
   import package_364.PointLight;
   import package_436.PlaneGeometry;
   import package_436.SphereGeometry;
   import package_446.Merge;
   import package_472.class_2656;
   import package_473.class_2661;
   import package_75.class_349;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_2482 extends class_1752 implements class_80
   {
      
      public static var var_2334:class_2104 = null;
      
      private static var var_3344:class_2429;
      
      private static var var_2210:class_2429;
      
      public static const UP:Vector3D = Vector3D.Z_AXIS.clone();
      
      private static const const_2697:class_2448 = new class_2448(16711680,0.5);
       
      
      private const const_1171:Vector3D = new Vector3D();
      
      private const const_558:Vector3D = new Vector3D();
      
      private var var_2766:class_1090;
      
      private var var_460:class_299;
      
      private var var_2688:class_287;
      
      private var var_907:class_426;
      
      private var var_4249:Boolean;
      
      private var var_337:Boolean;
      
      private var var_85:Boolean;
      
      private var var_4102:Vector3D;
      
      private var var_1333:class_2114;
      
      private var _light:PointLight;
      
      private var var_4009:class_2104;
      
      private var var_506:class_1199;
      
      private var var_3456:Boolean;
      
      private var var_4812:Boolean = false;
      
      private var var_4892:Number = 0;
      
      private var var_4621:class_2114;
      
      private var _duration:Number;
      
      public function class_2482(param1:class_299, param2:class_287, param3:Boolean, param4:class_426, param5:class_1090, param6:Boolean, param7:Boolean = false, param8:Number = 0)
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         this.var_4102 = new Vector3D();
         super();
         this.var_460 = param1;
         this.var_2688 = param2;
         this.var_85 = param3;
         this._duration = Math.max(1,Number(class_73.method_5461(param1.owner.position,param2.owner.position)) / 500);
         this.var_4812 = this.var_460.owner is BattleStationModule;
         if(param7)
         {
            this._duration += 0.3;
         }
         this.var_2766 = param5;
         this.var_337 = param6;
         this.var_4249 = param7;
         this.var_907 = param4;
         if(var_3344 == null || var_3344.subGeometries.length == 0)
         {
            _loc12_ = new class_2114(new PlaneGeometry(1,1,1,1,true,true));
            (_loc13_ = new class_2114(new PlaneGeometry(1,1,1,1,true,true))).rotationX = 90;
            (_loc14_ = new Merge(false,true,false)).apply(_loc12_,_loc13_);
            class_2656.method_1468(_loc12_,-0.5,0,0);
            _loc12_.x = _loc12_.y = _loc12_.z = 0;
            _loc12_.rotationY = 90;
            class_2656.method_5615(_loc12_);
            var_3344 = _loc12_.geometry;
         }
         if(var_2210 == null)
         {
            var_2210 = new SphereGeometry(5);
         }
         this.var_1333 = class_2483.retrieve("Rocket3D_" + this.var_907.resKey) as class_2114;
         if(this.var_1333 == null)
         {
            _loc15_ = ResourceManager.getMovieClip(this.var_907.resKey,"mc");
            this.var_1333 = class_2486.method_6114(this.var_907.resKey,_loc15_,var_3344);
            this.var_1333.scaleX = _loc15_.height;
            this.var_1333.scaleY = _loc15_.height;
            this.var_1333.scaleZ = _loc15_.width;
         }
         addChild(this.var_1333);
         x = this.var_460.owner.method_1474;
         y = this.var_460.owner.method_1121 + (!!this.var_4812 ? 70 : 0);
         z = this.var_460.owner.method_6123;
         this.const_1171.setTo(x,y,z);
         this._light = class_1210.instance.name_10.method_2960(true);
         Settings3D.const_718.apply(this._light);
         var _loc9_:Object = {
            "dynamicProps":{
               "x":this.method_791,
               "y":this.method_853,
               "z":this.method_1712
            },
            "delay":param8,
            "onUpdate":this.onUpdate,
            "onComplete":this.method_2178
         };
         if(Boolean(this.var_4249) || Boolean(this.var_337) || Boolean(this.var_4812))
         {
            this.var_4102.x = this.var_460.rocketLauncher.direction.x;
            this.var_4102.y = this.var_460.rocketLauncher.direction.y;
            this.var_4102.z = this.var_460.rocketLauncher.direction.z;
            TweenLite.to(this.var_4102,Number(this._duration) * 0.7,{
               "x":0,
               "y":0,
               "z":0,
               "delay":_loc9_.delay
            });
         }
         else
         {
            _loc9_.ease = Linear.easeNone;
         }
         var _loc10_:Number = 1;
         var _loc11_:class_306;
         if((Boolean(_loc11_ = param2.owner.method_1954(class_306) as class_306)) && _loc11_.descriptor.display3D.length() > 0)
         {
            _loc10_ = Number(Number(_loc11_.descriptor.display3D[0].@visualSize) || true);
         }
         this.var_4892 = _loc10_ * (Number(!!this.var_4812 ? 30 : 60));
         this.var_4892 *= this.var_4892;
         TweenLite.to(this,this._duration,_loc9_);
         if(Settings3D.effects.medium.value)
         {
            if(var_2334)
            {
               this.method_5595(var_2334);
            }
            else
            {
               this.var_506 = class_1210.instance.method_659.method_1811(this.var_2766.fx3D,class_1210.const_2984);
               this.var_506.addOnce(this.method_5595);
            }
         }
         if(this.var_337)
         {
            this.var_4621 = new class_2114(var_2210,const_2697);
            addChild(this.var_4621);
            this.var_4621.z = 25;
         }
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
      
      public function updateObj(param1:Number) : void
      {
         if(this.var_4009)
         {
            this.var_4009.animator.time += param1 * 1000 * Number(this.var_4009.animator.playbackSpeed);
         }
      }
      
      private function method_5470() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:class_308 = Boolean(this.var_2688) && Boolean(this.var_2688.owner) ? this.var_2688.owner.method_1954(class_308) as class_308 : null;
         if(_loc1_)
         {
            _loc2_ = class_1210.const_396;
            _loc2_.setTo(Number(x) - Number(this.var_2688.owner.method_1474),Number(y) - Number(this.var_2688.owner.method_1121),Number(z) - Number(this.var_2688.owner.method_6123));
            _loc3_ = _loc1_.shield.value > 0 ? Number(this.var_4892) : 0.5 * Number(this.var_4892);
            if((_loc4_ = _loc2_.x * _loc2_.x + _loc2_.y * _loc2_.y + _loc2_.z * _loc2_.z) < _loc3_)
            {
               this.var_3456 = true;
               if(_loc1_.shield.value > 0 && Boolean(Settings3D.effects.medium.value))
               {
                  new class_2661(_loc2_.x + x,_loc2_.y + y,_loc2_.z + z,this.var_2688.owner,class_2661.const_1794);
               }
               TweenLite.killTweensOf(this);
               TweenLite.killTweensOf(this.var_4102);
               this.method_2178();
            }
         }
         else
         {
            this.var_3456 = true;
         }
      }
      
      private function method_5595(param1:class_2104) : void
      {
         this.var_4009 = class_2483.retrieve("Rocket3D_trail_" + this.var_2766.fx3D) as class_2104 || param1.clone() as class_2104;
         this.var_4009.animator.method_1819(0);
         addChild(this.var_4009);
         class_1210.instance.method_3528.method_1164(this);
      }
      
      private function method_5300() : void
      {
         class_1210.instance.method_3528.method_3592(this);
         if(parent)
         {
            parent.removeChild(this);
         }
         if(this.var_4009)
         {
            this.var_4009.parent.removeChild(this.var_4009);
            class_2483.method_3917(this.var_4009,"Rocket3D_trail_" + this.var_2766.fx3D);
            this.var_4009 = null;
         }
         if(this.var_506)
         {
            this.var_506.remove(this.method_5595);
            this.var_506 = null;
         }
         if(this._light)
         {
            class_1210.instance.name_10.method_5202(this._light);
            this._light = null;
         }
         if(this.var_1333)
         {
            this.var_1333.parent.removeChild(this.var_1333);
            class_2483.method_3917(this.var_1333,"Rocket3D_" + this.var_907.resKey);
            this.var_1333 = null;
         }
         if(this.var_4621)
         {
            if(this.var_4621.parent)
            {
               this.var_4621.parent.removeChild(this.var_4621);
            }
            this.var_4621 = null;
         }
      }
      
      private function method_2178() : void
      {
         if(!this.var_85)
         {
            if(this.var_2688.owner.id == class_81.userID || this.var_460.owner.id == class_81.userID)
            {
               class_50.getInstance().map.effects.method_5084(new class_349(this.var_2688.owner,0));
            }
            this.method_5577(class_198.method_1020(class_222.const_964,1));
         }
         if(Boolean(this.var_85) || Boolean(this.var_4249))
         {
            this.method_5577(class_198.method_1020(class_222.const_2635,1));
            this.method_2682(2,1);
         }
         if(this._light)
         {
            class_1210.instance.name_10.method_5202(this._light);
            this._light = null;
         }
         z += 100000;
         setTimeout(this.method_5300,1500);
      }
      
      private function method_2682(param1:int, param2:int = 1) : void
      {
      }
      
      private function method_5577(param1:class_222) : void
      {
         if(Settings3D.effects.medium.value)
         {
            class_50.getInstance().map.effects.method_269(new class_184(x,-Number(z),y,param1));
         }
      }
      
      private function onUpdate() : void
      {
         var _loc1_:Vector3D = this.const_558;
         _loc1_.setTo(Number(x) - Number(this.const_1171.x),Number(y) - Number(this.const_1171.y),Number(z) - Number(this.const_1171.z));
         if(_loc1_.lengthSquared > 1)
         {
            _loc1_.incrementBy(position);
            method_1154(_loc1_,Vector3D.Y_AXIS);
            this.const_1171.copyFrom(position);
         }
         this._light.specular = 1.9 + Math.random() * 0.3;
         this._light.moveTo(x,y,z);
         if(!this.var_3456 && Boolean(this.var_85))
         {
            this.method_5470();
         }
      }
      
      private function method_791() : Number
      {
         return this.var_2688.owner.method_1474 + this.var_4102.x;
      }
      
      private function method_853() : Number
      {
         return this.var_2688.owner.method_1121 + this.var_4102.y;
      }
      
      private function method_1712() : Number
      {
         return this.var_2688.owner.method_6123 + this.var_4102.z;
      }
   }
}
