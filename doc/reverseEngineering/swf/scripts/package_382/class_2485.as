package package_382
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_114.class_1177;
   import package_114.class_312;
   import package_199.class_2453;
   import package_200.Settings3D;
   import package_200.class_1771;
   import package_22.class_1088;
   import package_27.class_82;
   import package_29.class_85;
   import package_297.class_2483;
   import package_304.class_2104;
   import package_445.class_2654;
   import package_473.class_2661;
   
   public class class_2485 implements class_1177
   {
      
      private static const const_346:Dictionary = new Dictionary(true);
      
      private static const const_436:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
      
      private static const const_396:Vector3D = new Vector3D();
      
      private static const const_2650:Vector3D = new Vector3D();
      
      private static const const_1142:Vector3D = new Vector3D();
      
      {
         const_436.push(Vector.<String>(["mainCannon"]));
      }
      
      private const const_681:Vector3D = new Vector3D();
      
      private var var_3328:Number;
      
      private var var_849:class_1088;
      
      private var name_64:class_85;
      
      private var name_51:class_85;
      
      private var var_1984:Boolean;
      
      private var var_4360:Boolean;
      
      private var var_733:Vector.<uint>;
      
      private var var_1096:Boolean = false;
      
      private var var_1426:class_1177;
      
      private var _debug:Boolean;
      
      private var var_424:class_2104;
      
      private var var_2936:uint = 0;
      
      private var var_84:Dictionary;
      
      private var _resKey:String;
      
      public function class_2485(param1:class_85, param2:class_85, param3:class_1088, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         this.var_733 = new Vector.<uint>();
         this.var_84 = new Dictionary(true);
         super();
         this.name_64 = param1;
         this.name_51 = param2;
         this.name_64.const_2402.add(this.stop);
         this.name_51.const_2402.add(this.stop);
         this.var_849 = param3;
         this.var_1984 = param4;
         this.var_4360 = param5;
         var _loc7_:class_312 = class_299(this.name_64.method_1954(class_299)).laser;
         this.var_1426 = _loc7_.var_3526 || true;
         this._debug = param6;
         this.var_3328 = 1;
         var _loc8_:class_306;
         if((Boolean(_loc8_ = this.name_51.method_1954(class_306) as class_306)) && _loc8_.descriptor.display3D.length() > 0)
         {
            this.var_3328 = Number(_loc8_.descriptor.display3D[0].@visualSize) || true;
         }
         this.method_317();
      }
      
      public static function method_284(param1:class_2485) : void
      {
         method_913(param1.name_64);
         const_346[param1.name_64.id] = param1;
      }
      
      public static function method_913(param1:class_85) : void
      {
         var _loc2_:class_2485 = const_346[param1.id];
         if(_loc2_)
         {
            _loc2_.stop();
            const_346[param1.id] = null;
            delete const_346[param1.id];
         }
      }
      
      private static function method_5509(param1:class_2485) : void
      {
         if(const_346[param1.name_64.id] == param1)
         {
            method_913(param1.name_64);
         }
      }
      
      private function get shield() : int
      {
         var _loc2_:int = 0;
         var _loc1_:class_308 = this.name_51.method_1954(class_308) as class_308;
         if(Boolean(_loc1_) && _loc1_.shield.value > 0)
         {
            _loc2_ = int(_loc1_.shield.value);
         }
         return _loc2_;
      }
      
      public function method_1470() : Vector.<Vector.<String>>
      {
         return const_436;
      }
      
      public function method_1051(param1:String, param2:Vector3D) : void
      {
         param2.setTo(0,0,0);
      }
      
      private function method_317() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         this._resKey = this.var_849.getResKey();
         var _loc1_:String = this.var_849.muzzleFlashResKey;
         if(Settings3D.effects.high.value)
         {
            this.var_2936 = this.var_849.lightColor;
            if(_loc1_)
            {
               class_1210.instance.method_659.method_1811(_loc1_ + ".zip",class_1210.const_2984).addOnce(this.method_2807);
            }
         }
         if(Boolean(this.var_4360) && this.var_849.skillResKey != "-1")
         {
            this._resKey = this.var_849.skillResKey;
         }
         if(this.var_849.method_2556())
         {
            this.const_681.setTo(0,0,0);
            if(this.var_4360)
            {
               this.method_2223(this.const_681,false);
               this.var_733.push(setTimeout(this.method_2223,60,this.const_681,false));
               this.var_733.push(setTimeout(this.method_2223,440,this.const_681,false));
               this.var_733.push(setTimeout(this.method_2223,500,this.const_681,true));
            }
            else
            {
               this.method_2223(this.const_681,true);
            }
            if(this.var_849.method_3142() != -1)
            {
               class_82.playSoundEffect(this.var_849.method_3142(),false,false,this.name_64.x,this.name_64.y,this.name_64.id == class_81.userID);
            }
         }
         else if(this.var_849.ignoreLaserPoints)
         {
            this.const_681.setTo(0,0,0);
            this.method_2223(this.const_681,true);
         }
         else
         {
            _loc2_ = this.var_1426.method_1470() || const_436;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc3_ == 0)
               {
                  this.method_1557(_loc2_[_loc3_],_loc3_ == _loc2_.length - 1);
               }
               else
               {
                  this.var_733.push(setTimeout(this.method_1557,_loc3_ * 200,_loc2_[_loc3_],_loc3_ == _loc2_.length - 1));
               }
               _loc3_++;
            }
         }
         if(!this._debug)
         {
         }
      }
      
      private function method_2807(param1:class_2104) : void
      {
         this.var_424 = param1;
      }
      
      private function method_1557(param1:Vector.<String>, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.var_849.method_3142() != -1)
         {
            class_82.playSoundEffect(this.var_849.method_3142(),false,false,this.name_64.x,this.name_64.y,this.name_64.id == class_81.userID);
         }
         if(!this._debug)
         {
         }
         for each(_loc3_ in param1)
         {
            this.var_1426.method_1051(_loc3_,this.const_681);
            this.method_2223(this.const_681,param2);
            if(this.var_1426 is class_2654 && Boolean(Settings3D.effects.high.value))
            {
               if((Boolean(_loc5_ = (_loc4_ = this.var_1426 as class_2654).method_3101(_loc3_))) && Boolean(this.var_424))
               {
                  (_loc6_ = class_2483.retrieve("LaserSalvo3D_flash_" + this.var_849.muzzleFlashResKey) as class_2104 || this.var_424.clone() as class_2104).moveTo(_loc5_.x,_loc5_.y,_loc5_.z);
                  var _loc10_:* = 1 / Number(_loc4_.method_2294.scaleX);
                  _loc6_.scaleZ = 1 / Number(_loc4_.method_2294.scaleX);
                  _loc6_.scaleX = _loc6_.scaleY = _loc10_;
                  _loc4_.method_2294.addChild(_loc6_);
                  _loc6_.animator.addEventListener(class_2453.const_786,this.method_256);
                  _loc6_.animator.method_1819(0);
                  _loc6_.animator.start();
                  this.var_84[_loc6_.animator] = _loc6_;
               }
               if(this.var_2936 != 0)
               {
                  _loc7_ = Settings3D.const_718;
                  class_1210.instance.name_10.method_6370(this.name_64.method_1474 + this.const_681.x,this.name_64.method_1121 + this.const_681.y,this.name_64.method_6123 + this.const_681.z,uint(_loc7_.color.value) || uint(this.var_2936),_loc7_.fallOff.value,_loc7_.diffuse.value,_loc7_.specular.value);
               }
            }
         }
      }
      
      private function method_2223(param1:Vector3D, param2:Boolean) : void
      {
         var _loc8_:* = null;
         var _loc3_:class_2664 = class_2483.retrieve(class_2664.method_1938(this.var_849,this._resKey)) as class_2664 || new class_2664(this.var_849,this._resKey);
         var _loc4_:Vector3D;
         (_loc4_ = const_396).x = this.name_64.method_1474;
         _loc4_.y = this.name_64.method_1121;
         _loc4_.z = this.name_64.method_6123;
         _loc4_.incrementBy(param1);
         var _loc5_:Vector3D;
         (_loc5_ = const_2650).x = this.name_51.method_1474;
         _loc5_.y = this.name_51.method_1121;
         _loc5_.z = this.name_51.method_6123;
         if(!this.method_4001(_loc5_,_loc4_,_loc3_))
         {
            class_2483.method_3917(_loc3_,class_2664.method_1938(this.var_849,this._resKey));
            return;
         }
         var _loc6_:Vector3D;
         (_loc6_ = const_1142).setTo(_loc5_.x - _loc4_.x,_loc5_.y - _loc4_.y,_loc5_.z - _loc4_.z);
         _loc6_.normalize();
         if(this.shield > 0)
         {
            _loc5_.x -= Number(this.var_3328) * 50 * _loc6_.x;
            _loc5_.y -= Number(this.var_3328) * 50 * _loc6_.y;
            _loc5_.z -= Number(this.var_3328) * 50 * _loc6_.z;
         }
         if(!this.method_4001(_loc5_,_loc4_,_loc3_))
         {
            class_2483.method_3917(_loc3_,class_2664.method_1938(this.var_849,this._resKey));
            return;
         }
         if(this.var_849.method_2556())
         {
            _loc8_ = _loc5_;
            _loc5_ = _loc4_;
            _loc4_ = _loc8_;
         }
         _loc3_.scaleX = _loc3_.scaleY = _loc3_.scaleZ = 1;
         _loc3_.moveTo(_loc4_.x,_loc4_.y,_loc4_.z);
         _loc3_.method_4027(_loc5_);
         var _loc7_:Object = {
            "ease":Linear.easeNone,
            "x":_loc5_.x - _loc6_.x * Number(_loc3_.method_1159),
            "y":_loc5_.y - _loc6_.y * Number(_loc3_.method_1159),
            "z":_loc5_.z - _loc6_.z * Number(_loc3_.method_1159),
            "onComplete":this.method_1475,
            "onCompleteParams":[_loc3_,param2,_loc5_.x,_loc5_.y,_loc5_.z]
         };
         if(this.var_849.method_2556())
         {
            _loc7_.scaleX = _loc7_.scaleY = _loc7_.scaleZ = 0.4;
         }
         class_1210.instance.method_3528.method_1616.addChild(_loc3_);
         TweenLite.to(_loc3_,this.var_849.method_4447(),_loc7_);
      }
      
      private function method_4001(param1:Vector3D, param2:Vector3D, param3:class_2664) : Boolean
      {
         var _loc4_:Number = param1.x - param2.x;
         var _loc5_:Number = param1.y - param2.y;
         var _loc6_:Number = param1.z - param2.z;
         return Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_) > param3.method_1159;
      }
      
      private function method_1475(param1:class_2664, param2:Boolean, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:int = 0;
         if(this.shield > 0 && Boolean(Settings3D.effects.medium.value))
         {
            _loc6_ = !!this.var_1984 ? 0 : int(class_2661.const_1794);
            new class_2661(param3,param4,param5,this.name_51,_loc6_);
         }
         class_2483.method_3917(param1,class_2664.method_1938(this.var_849,this._resKey));
         if(param2)
         {
            this.stop();
         }
      }
      
      private function stop() : void
      {
         if(!this.var_1096)
         {
            this.var_1096 = true;
            this.name_64.const_2402.remove(this.stop);
            this.name_51.const_2402.remove(this.stop);
            while(this.var_733.length)
            {
               clearTimeout(this.var_733.pop());
            }
            method_5509(this);
         }
      }
      
      private function method_256(param1:class_2453) : void
      {
         param1.currentTarget.removeEventListener(class_2453.const_786,this.method_256);
         var _loc2_:class_2104 = this.var_84[param1.currentTarget];
         _loc2_.animator.stop();
         _loc2_.parent.removeChild(_loc2_);
         class_2483.method_3917(_loc2_,"LaserSalvo3D_flash_" + this.var_849.muzzleFlashResKey);
         this.var_84[param1.currentTarget] = null;
         delete this.var_84[param1.currentTarget];
      }
   }
}
