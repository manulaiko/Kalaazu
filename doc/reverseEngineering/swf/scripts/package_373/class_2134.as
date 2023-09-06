package package_373
{
   import flash.geom.Vector3D;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_10.class_1173;
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_85;
   import package_295.class_1752;
   import package_297.class_2457;
   import package_298.class_2455;
   import package_310.class_1780;
   import package_424.class_2358;
   import package_424.class_2365;
   
   public class class_2134 extends class_1752 implements class_80, IDisposable
   {
       
      
      public const ready:class_68 = new class_70();
      
      public var disposeAnimation:String = null;
      
      protected var _manager:class_2365;
      
      protected var var_397:Boolean;
      
      private var _descriptor:XML;
      
      private var var_988:Number = 0;
      
      private var var_3374:class_1752;
      
      private var var_817:Object;
      
      private var var_1510:int = 0;
      
      private var var_3385:Vector.<class_2456>;
      
      private var _debug:Boolean;
      
      private var var_2773:Boolean = false;
      
      private var var_2553:class_85;
      
      private var _alpha:Number = 1;
      
      private var var_212:Object;
      
      private var var_93:Boolean = true;
      
      private var var_3299:class_1752;
      
      private var var_974:class_2457;
      
      private var var_4124:class_2457;
      
      public const const_172:Vector3D = new Vector3D();
      
      public const const_2015:Vector3D = new Vector3D();
      
      private var var_4629:Number = 2;
      
      private var var_1420:Vector.<class_1780>;
      
      public const const_260:class_68 = new class_70();
      
      public function class_2134(param1:XML, param2:class_1173 = null, param3:class_85 = null, param4:Boolean = false, param5:String = null)
      {
         this.var_817 = {};
         this.var_3385 = new Vector.<class_2456>();
         this.var_1420 = new Vector.<class_1780>();
         super();
         this._descriptor = param1;
         this.var_2553 = param3;
         this._debug = param4;
         this._manager = new class_2365(param2);
         this.var_988 = Math.random() * 0 * 2;
         if(param1)
         {
            this.var_93 = param1.floating.length() > 0;
            this.const_2015.x = param1.floating.@moveX.length() > 0 ? Number(param1.floating.@moveX) : 0;
            this.const_2015.y = param1.floating.@moveY.length() > 0 ? Number(param1.floating.@moveY) : 0;
            this.const_2015.z = param1.floating.@moveZ.length() > 0 ? Number(param1.floating.@moveZ) : 0;
            this.const_172.x = param1.floating.@rotationX.length() > 0 ? Number(param1.floating.@rotationX) : 0;
            this.const_172.y = param1.floating.@rotationY.length() > 0 ? Number(param1.floating.@rotationY) : 0;
            this.const_172.z = param1.floating.@rotationZ.length() > 0 ? Number(param1.floating.@rotationZ) : 0;
            this.var_4629 = param1.floating.@cycleLength.length() > 0 ? Number(param1.floating.@cycleLength) : 2;
            if(param1.@disposeAnimation.length > 0)
            {
               this.disposeAnimation = String(param1.@disposeAnimation);
            }
         }
         this.init();
      }
      
      private function method_5970() : void
      {
         this.var_974 = new class_2457(this.var_4629);
         this.var_4124 = new class_2457(this.var_4629);
         this.var_3299 = new class_1752();
         this.var_3299.addChild(this.var_3374);
         addChild(this.var_3299);
      }
      
      public function method_2788() : void
      {
         if(this.var_3299 == null)
         {
            this.method_5970();
         }
         this.var_93 = true;
      }
      
      public function method_4400() : void
      {
         this.var_93 = false;
         if(this.var_974)
         {
            this.var_974.stop();
         }
         if(this.var_4124)
         {
            this.var_4124.stop();
         }
      }
      
      public function addMethod(param1:class_1780) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = int(this.var_1420.indexOf(param1));
         if(_loc2_ != -1)
         {
            return;
         }
         for each(_loc3_ in this.var_3385)
         {
            _loc3_.addMethod(param1);
         }
         this.var_1420.push(param1);
         this.const_260.dispatch();
      }
      
      public function method_804(param1:class_1780) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = int(this.var_1420.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_1420.splice(_loc2_,1);
            for each(_loc3_ in this.var_3385)
            {
               _loc3_.method_804(param1);
            }
            this.const_260.dispatch();
         }
      }
      
      public function method_2531() : void
      {
         var _loc1_:* = null;
         if(this.var_1420.length)
         {
            this.var_1420.length = 0;
            for each(_loc1_ in this.var_3385)
            {
               _loc1_.method_2531();
            }
            this.const_260.dispatch();
         }
      }
      
      public function method_4434(param1:String) : class_1752
      {
         return this.var_817[param1 || false] as class_1752;
      }
      
      public function updateObj(param1:Number) : void
      {
         this._manager.updateObj(param1);
         if(this.var_3299)
         {
            if(this.var_93)
            {
               this.var_974.updateObj(param1);
               this.var_4124.updateObj(param1);
            }
            this.var_3299.moveTo(Number(this.var_974.x) * Number(this.const_2015.x),Number(this.var_974.y) * Number(this.const_2015.y),Number(this.var_974.z) * Number(this.const_2015.z));
            this.var_3299.method_1973(Number(this.var_4124.x) * Number(this.const_172.x),Number(this.var_4124.y) * Number(this.const_172.y),Number(this.var_4124.z) * Number(this.const_172.z));
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(param1 || this.disposeAnimation == null)
         {
            this._manager.disposeView(param1);
            if(parent)
            {
               parent.removeChild(this);
            }
            class_1210.instance.method_3528.method_3592(this);
         }
         else
         {
            this.method_6420(this.disposeAnimation,this.method_778,true);
         }
         this.var_397 = true;
      }
      
      public function method_6420(param1:String, param2:Function = null, param3:Boolean = false) : void
      {
         this._manager.method_6420(param1,param2,param3);
      }
      
      public function method_5838() : void
      {
         this._manager.method_5838();
      }
      
      protected function method_206() : void
      {
         if(Boolean(this.var_2773) || Boolean(this.var_397))
         {
            return;
         }
         this.var_2773 = true;
         if(this.var_93)
         {
            this.method_5970();
         }
         else
         {
            addChild(this.var_3374);
         }
         this.method_3768();
         this._manager.parseAnimations(this._descriptor,UberAnimation3D,this);
         this.log("ready!");
         setTimeout(this.ready.dispatch,1);
      }
      
      protected function log(param1:String) : void
      {
      }
      
      private function init() : void
      {
         if(this._descriptor != null)
         {
            this.log("init");
            class_1210.instance.method_3528.method_1164(this);
            this.method_4188();
            if(this._debug)
            {
               scale(Number(this._descriptor.@previewScale) || true);
            }
            if(this.var_1510 == 0)
            {
               this.log("no content to wait for");
               this.method_206();
            }
         }
         else
         {
            this.var_3374 = new class_1752();
            this.method_206();
         }
      }
      
      private function method_778() : void
      {
         this.disposeView(true);
      }
      
      private function method_4188() : void
      {
         this.var_1510 = 0;
         this.var_3385.length = 0;
         if(String(this._descriptor.@geometry))
         {
            this.var_3374 = this.method_3385(this._descriptor,"");
            this._manager.method_1697(this.var_3374);
         }
         else
         {
            this.var_3374 = new class_1752();
            this.method_155(this.var_3374,this._descriptor,"");
         }
         this.method_289(this.var_3374,this._descriptor);
      }
      
      private function method_1100() : void
      {
         if(this.var_397)
         {
            return;
         }
         if(--this.var_1510 == 0)
         {
            this.method_206();
         }
      }
      
      private function method_3768() : void
      {
         var _loc1_:* = null;
         this.var_817[""] = this.var_3374;
         for each(_loc1_ in this.var_3385)
         {
            if(_loc1_.mesh)
            {
               this.method_2851(_loc1_.mesh,_loc1_.name + ".");
            }
         }
      }
      
      private function method_2851(param1:class_1752, param2:String) : void
      {
         if(param1.name && param1.name.length > 0 && param1.name != "null")
         {
            if(this.var_817[param2 + param1.name] == null)
            {
               this.var_817[param2 + param1.name] = param1;
            }
            else
            {
               this.log("WARNING, duplicating IDs: " + param1.name);
            }
            param2 += param1.name + ".";
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            this.method_2851(param1.getChildAt(_loc3_),param2);
            _loc3_++;
         }
      }
      
      private function method_155(param1:class_1752, param2:XML, param3:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.var_212 == null)
         {
            this.var_212 = {};
            this.var_212["container"] = this.method_319;
            this.var_212["mesh"] = this.method_3385;
            this.var_212["plane"] = this.method_3004;
            this.var_212["particles"] = this.method_4522;
            this.var_212["pivot"] = this.method_3518;
            this.var_212["display3D"] = this.method_2863;
            this.var_212["tilemap"] = this.method_2594;
         }
         var _loc4_:XMLList = param2.children();
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = null;
            _loc7_ = String(_loc5_.attribute("id")) || this._manager.method_3668(_loc5_.name().toString());
            _loc8_ = param3.length > 0 ? param3 + "." + _loc7_ : _loc7_;
            if((_loc9_ = this.var_212[_loc5_.name().toString()] as Function) != null)
            {
               _loc6_ = _loc9_(_loc5_,_loc8_);
            }
            else
            {
               this.log("parseDisplayChildren: Unknown node type: " + _loc5_.toString());
            }
            if(_loc6_)
            {
               _loc6_.name = _loc7_;
               param1.addChild(_loc6_);
               this.method_289(_loc6_,_loc5_);
               this._manager.method_1697(_loc6_);
               this.var_817[_loc7_] = _loc6_;
            }
         }
      }
      
      private function method_289(param1:class_1752, param2:XML) : void
      {
         var _loc3_:Object = class_2358.method_2917(param2);
         if(_loc3_.x !== undefined)
         {
            param1.x = Number(_loc3_.x);
         }
         if(_loc3_.y !== undefined)
         {
            param1.y = Number(_loc3_.y);
         }
         if(_loc3_.z !== undefined)
         {
            param1.z = Number(_loc3_.z);
         }
         if(_loc3_.sphericalPhi !== undefined && _loc3_.sphericalTheta !== undefined && _loc3_.sphericalR !== undefined)
         {
            param1.x += Number(_loc3_.sphericalR) * Math.sin(Number(_loc3_.sphericalTheta) * 0 / 180) * Math.cos(Number(_loc3_.sphericalPhi) * 0 / 180);
            param1.y -= Number(_loc3_.sphericalR) * Math.cos(Number(_loc3_.sphericalTheta) * 0 / 180);
            param1.z -= Number(_loc3_.sphericalR) * Math.sin(Number(_loc3_.sphericalTheta) * 0 / 180) * Math.sin(Number(_loc3_.sphericalPhi) * 0 / 180);
         }
         if(_loc3_.rotationX !== undefined)
         {
            param1.rotationX = Number(_loc3_.rotationX);
         }
         if(_loc3_.rotationY !== undefined)
         {
            param1.rotationY = Number(_loc3_.rotationY);
         }
         if(_loc3_.rotationZ !== undefined)
         {
            param1.rotationZ = Number(_loc3_.rotationZ);
         }
         if(_loc3_.scaleX !== undefined)
         {
            param1.scaleX = Number(_loc3_.scaleX);
         }
         if(_loc3_.scaleY !== undefined)
         {
            param1.scaleY = Number(_loc3_.scaleY);
         }
         if(_loc3_.scaleZ !== undefined)
         {
            param1.scaleZ = Number(_loc3_.scaleZ);
         }
      }
      
      private function method_319(param1:XML, param2:String) : class_1752
      {
         var _loc3_:class_1752 = new class_2454(param1,this._manager.state);
         this.method_155(_loc3_,param1,param2);
         return _loc3_;
      }
      
      private function method_3385(param1:XML, param2:String) : class_1752
      {
         var _loc3_:class_2456 = new class_2456(param1,this._manager.state);
         _loc3_.alpha = this._alpha;
         this.var_3385.push(_loc3_);
         ++this.var_1510;
         class_2456(_loc3_).ready.addOnce(this.method_1100);
         return _loc3_;
      }
      
      private function method_3004(param1:XML, param2:String) : class_1752
      {
         var _loc3_:class_2458 = new class_2458(param1,this._manager.state);
         ++this.var_1510;
         class_2458(_loc3_).ready.addOnce(this.method_1100);
         return _loc3_;
      }
      
      private function method_2594(param1:XML, param2:String) : class_1752
      {
         return new class_2455(param1,this._manager.state);
      }
      
      private function method_4522(param1:XML, param2:String) : class_1752
      {
         var _loc3_:class_2460 = new class_2460(param1,this._manager.state);
         ++this.var_1510;
         class_2460(_loc3_).ready.addOnce(this.method_1100);
         return _loc3_;
      }
      
      private function method_3518(param1:XML, param2:String) : class_1752
      {
         if(this.var_2553)
         {
            return new class_2459(this.var_2553.method_5851(String(param1.@id)),this);
         }
         return null;
      }
      
      private function method_2863(param1:XML, param2:String) : class_1752
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc3_:Array = String(param1.@templateId).split(":");
         var _loc5_:String = "null";
         if(_loc3_.length == 2)
         {
            _loc5_ = _loc3_[0];
            _loc4_ = _loc3_[1];
         }
         else if(_loc3_.length == 1)
         {
            _loc4_ = _loc3_[0];
         }
         var _loc6_:XML;
         if((_loc6_ = UberAssetsLib.instance.getDescriptor(_loc4_,_loc5_)) != null)
         {
            _loc7_ = new class_2134(_loc6_.display3D[0],this._manager.state,null,this._debug,"child of UberAsset3D");
            ++this.var_1510;
            class_2134(_loc7_).ready.addOnce(this.method_1100);
            return _loc7_;
         }
         this.log(":parseDisplayChildren: Template id not found : " + param1.@templateId);
         return null;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         var _loc2_:* = null;
         this._alpha = param1;
         for each(_loc2_ in this.var_3385)
         {
            _loc2_.alpha = param1;
         }
      }
      
      public function get method_3287() : Vector.<class_2456>
      {
         return this.var_3385;
      }
      
      public function get method_3464() : class_2457
      {
         return this.var_974;
      }
      
      public function get method_5489() : Vector.<class_1780>
      {
         return this.var_1420;
      }
      
      public function get descriptor() : XML
      {
         return this._descriptor;
      }
   }
}
