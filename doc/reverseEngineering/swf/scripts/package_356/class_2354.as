package package_356
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Sine;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.model.traits.class_309;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_114.class_1177;
   import package_114.class_312;
   import package_22.class_1088;
   import package_27.class_82;
   import package_29.class_85;
   import package_9.ResourceManager;
   import package_99.class_266;
   
   public class class_2354 extends Sprite implements class_1177
   {
      
      private static var var_4399:Dictionary = new Dictionary();
      
      private static const const_346:Dictionary = new Dictionary(true);
      
      private static const const_436:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
      
      private static const const_704:String = "shieldDamage";
      
      {
         const_436.push(Vector.<String>(["mainCannon"]));
      }
      
      private var _mapView:class_1206;
      
      private const DEGTORAD:Number = 0.017453292519943295;
      
      private const RADTODEG:Number = 57.29577951308232;
      
      private const const_681:Vector3D = new Vector3D();
      
      private var var_849:class_1088;
      
      private var name_64:class_85;
      
      private var name_51:class_85;
      
      private var var_1984:Boolean;
      
      private var var_4360:Boolean;
      
      private var var_733:Vector.<uint>;
      
      private var var_1096:Boolean = false;
      
      private var var_1426:class_1177;
      
      private var var_3348:class_73;
      
      public function class_2354(param1:class_85, param2:class_85, param3:class_1088, param4:Boolean, param5:Boolean, param6:class_1206)
      {
         this.var_733 = new Vector.<uint>();
         this.var_3348 = new class_73();
         super();
         this._mapView = param6;
         this.name_64 = param1;
         this.name_51 = param2;
         this.name_64.const_2402.add(this.stop);
         this.name_51.const_2402.add(this.stop);
         this.var_849 = param3;
         this.var_1984 = param4;
         this.var_4360 = param5;
         var _loc7_:class_312 = class_299(this.name_64.method_1954(class_299)).laser;
         this.var_1426 = _loc7_.var_3526 || true;
         method_284(this);
         this.method_317();
      }
      
      public static function method_913(param1:class_85) : void
      {
         var _loc2_:class_2354 = const_346[param1.id];
         if(_loc2_)
         {
            _loc2_.stop();
            const_346[param1.id] = null;
            delete const_346[param1.id];
         }
      }
      
      private static function method_284(param1:class_2354) : void
      {
         method_913(param1.name_64);
         const_346[param1.name_64.id] = param1;
      }
      
      private function dispose() : void
      {
         this.stop();
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      private function stop() : void
      {
         this.name_64.const_2402.remove(this.stop);
         this.name_51.const_2402.remove(this.stop);
         this.var_1096 = true;
         while(this.var_733.length)
         {
            clearTimeout(this.var_733.pop());
         }
         var _loc1_:class_2354 = const_346[this.name_64.id];
         if(_loc1_ == this)
         {
            const_346[this.name_64.id] = null;
            delete const_346[this.name_64.id];
         }
      }
      
      private function method_317() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:String = this.var_849.getResKey();
         if(Boolean(this.var_4360) && this.var_849.skillResKey != "-1")
         {
            _loc1_ = this.var_849.skillResKey;
         }
         if(this.var_849.method_2556())
         {
            this.method_2223(this.name_51.position,this.name_64.position,_loc1_);
            if(this.var_4360)
            {
               this.var_733.push(setTimeout(this.method_2223,60,this.name_51.position,this.name_64.position,_loc1_));
               this.var_733.push(setTimeout(this.method_2223,440,this.name_51.position,this.name_64.position,_loc1_));
               this.var_733.push(setTimeout(this.method_2223,500,this.name_51.position,this.name_64.position,_loc1_));
            }
         }
         else if(this.var_849.ignoreLaserPoints)
         {
            this.method_2223(this.name_64.position,this.name_51.position,_loc1_);
         }
         else
         {
            _loc2_ = Boolean(this.var_1984);
            if(Settings.qualityShip.value <= Settings.QUALITY_LOW)
            {
               _loc2_ = false;
            }
            _loc3_ = this.var_1426.method_1470() || const_436;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(_loc4_ == 0)
               {
                  this.method_1557(_loc3_[_loc4_],_loc1_,_loc2_,_loc4_ == _loc3_.length - 1);
               }
               else
               {
                  this.var_733.push(setTimeout(this.method_1557,_loc4_ * 200,_loc3_[_loc4_],_loc1_,_loc2_,_loc4_ == _loc3_.length - 1));
               }
               _loc4_++;
            }
         }
         if(this.var_849.method_3142() != -1)
         {
            class_82.playSoundEffect(this.var_849.method_3142(),false,false,this.name_64.position.x,this.name_64.position.y,this.name_64.id == class_81.userID);
         }
      }
      
      private function method_1557(param1:Vector.<String>, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:* = null;
         for each(_loc5_ in param1)
         {
            this.var_1426.method_1051(_loc5_,this.const_681);
            this.var_3348.x = this.name_64.x + this.const_681.x;
            this.var_3348.y = this.name_64.y + this.const_681.y;
            this.method_2223(this.var_3348,this.name_51.position,param2,param3,param4);
         }
      }
      
      private function method_2223(param1:class_73, param2:class_73, param3:String, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc12_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Number = NaN;
         var _loc21_:int = 0;
         if(!ResourceManager.isLoaded(param3))
         {
            ResourceManager.loadAndCall(param3,this.method_2223,arguments,100);
            return;
         }
         var _loc7_:Number = Number(param1.x);
         var _loc8_:Number = Number(param1.y);
         var _loc9_:Number = Number(param2.x);
         var _loc10_:Number = Number(param2.y);
         var _loc11_:MovieClip = ResourceManager.getMovieClip(param3,"mc");
         if(!this.var_849.method_2556())
         {
            if((_loc15_ = _loc11_.width) > 0)
            {
               _loc16_ = _loc7_ - _loc9_;
               _loc17_ = _loc8_ - _loc10_;
               if((_loc18_ = (_loc10_ - _loc8_) * (_loc10_ - _loc8_) + (_loc9_ - _loc7_) * (_loc9_ - _loc7_)) < _loc15_ * _loc15_)
               {
                  return;
               }
               _loc19_ = int(class_266.sqrt(_loc18_));
               _loc9_ = _loc16_ / _loc19_ * _loc15_ + _loc9_;
               _loc10_ = _loc17_ / _loc19_ * _loc15_ + _loc10_;
            }
         }
         _loc11_.play();
         if(!this.var_849.playLoop || Boolean(this.var_1984))
         {
            _loc20_ = Math.atan2(_loc10_ - _loc8_,_loc9_ - _loc7_) * 57.29577951308232;
            _loc21_ = Math.round(_loc20_ + 180);
         }
         if(!this.var_849.playLoop)
         {
            _loc11_.rotation = _loc21_;
         }
         _loc11_.x = _loc7_;
         _loc11_.y = _loc8_;
         addChild(_loc11_);
         var _loc13_:Number = 1;
         var _loc14_:Number = 1;
         if(this.var_849.method_2556())
         {
            _loc12_ = Linear.easeNone;
            _loc13_ = 0.1;
            _loc14_ = 0.1;
         }
         else if(this.var_849.method_6106())
         {
            _loc12_ = Back.easeIn;
         }
         else
         {
            _loc12_ = Sine.easeOut;
         }
         TweenLite.to(_loc11_,this.var_849.method_4447(),{
            "ease":Linear.easeNone,
            "x":_loc9_,
            "y":_loc10_,
            "scaleX":_loc13_,
            "scaleY":_loc14_,
            "onComplete":this.method_6248,
            "onCompleteParams":[_loc11_,param4,_loc21_,param5]
         });
      }
      
      private function method_6248(param1:MovieClip, param2:Boolean, param3:Number, param4:Boolean) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.gotoAndStop(1);
            param1.parent.removeChild(param1);
         }
         if(param2)
         {
            this.method_290(param1,param4,param3);
         }
         else if(Boolean(this.var_1096) || param4)
         {
            this.dispose();
         }
      }
      
      private function method_290(param1:MovieClip, param2:Boolean, param3:Number) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         if(!ResourceManager.isLoaded(const_704))
         {
            ResourceManager.loadAndCall(const_704,this.method_290,arguments,100);
            return;
         }
         if(this.name_51 != null && (true || true))
         {
            if(!(_loc5_ = this._mapView.method_5826.method_6501(this.name_51.method_1954(class_309)) as DisplayObjectContainer))
            {
               return;
            }
            if(!(_loc6_ = this.name_51.method_1954(class_319) as class_319))
            {
               return;
            }
            _loc8_ = (_loc7_ = int(_loc6_.clickRadius)) / 100;
            (_loc9_ = ResourceManager.getMovieClip(const_704,"mc")).scaleX = _loc8_;
            _loc9_.scaleY = _loc8_;
            _loc9_.x = int(_loc7_ * Math.cos(param3 * 0.017453292519943295));
            _loc9_.y = int(_loc7_ * Math.sin(param3 * 0.017453292519943295));
            _loc9_.rotation = param3;
            _loc11_ = (_loc10_ = _loc9_.framesLoaded) / 30;
            _loc5_.addChild(_loc9_);
            TweenLite.to(_loc9_,_loc11_,{
               "ease":Linear.easeNone,
               "frame":_loc10_,
               "onComplete":this.method_5563,
               "onCompleteParams":[_loc9_,param2]
            });
            if(true)
            {
               var_4399[this.name_51.id] = 0;
            }
            ++var_4399[this.name_51.id];
         }
         else if(Boolean(this.var_1096) || param2)
         {
            this.dispose();
         }
      }
      
      private function method_5563(param1:MovieClip, param2:Boolean) : void
      {
         if(param1 != null && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
            if(this.name_51 != null)
            {
               --var_4399[this.name_51.id];
            }
         }
         if(Boolean(this.var_1096) || param2)
         {
            this.dispose();
         }
      }
      
      public function method_1470() : Vector.<Vector.<String>>
      {
         return const_436;
      }
      
      public function method_1051(param1:String, param2:Vector3D) : void
      {
         param2.setTo(0,0,0);
      }
   }
}
