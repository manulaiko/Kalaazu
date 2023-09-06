package package_381
{
   import com.greensock.TweenNano;
   import com.greensock.easing.Quad;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_19.class_1199;
   import package_22.class_1081;
   import package_22.class_198;
   import package_27.class_82;
   import package_295.class_1752;
   import package_304.class_2104;
   import package_364.PointLight;
   import package_75.class_1816;
   
   public class RepairRobotEffect3D extends class_1752 implements IDisposable, class_80
   {
       
      
      private var _effect:class_1816;
      
      private var var_1114:class_1081;
      
      private var var_1635:Vector.<RobotBehavior3D>;
      
      private var _sparks:class_2104;
      
      private var var_3413:PointLight;
      
      private var var_2802:class_1081;
      
      private var var_3988:class_1199;
      
      public function RepairRobotEffect3D(param1:class_1211, param2:class_1816)
      {
         this.var_1635 = new Vector.<RobotBehavior3D>();
         super();
         this._effect = param2;
         this._effect.repairBotId.changed.add(this.reload);
         this._effect.repairSkillLevel.changed.add(this.reload);
         this.reload();
      }
      
      private function reload() : void
      {
         this.cleanup();
         this.init();
      }
      
      private function init() : void
      {
         this.var_1114 = class_198.method_5078(this._effect.repairBotId.value);
         if(this.var_1114 == null)
         {
            this.var_1114 = class_198.method_5078("_default");
         }
         this.var_2802 = class_198.method_1466(this._effect.repairSkillLevel.value);
         if(this.var_2802 == null)
         {
            this.var_2802 = class_198.method_1466(0);
         }
         this.var_3988 = class_1210.instance.method_659.method_1811(this.var_2802.asset3D,class_1210.const_2984);
         this.var_3988.addOnce(this.method_310);
      }
      
      private function method_310(param1:class_2104) : void
      {
         var _loc3_:* = null;
         this._sparks = param1.clone() as class_2104;
         this._sparks.scaleX = this._sparks.scaleY = this._sparks.scaleZ = 0.6;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1114.robotsNum)
         {
            _loc3_ = new RobotBehavior3D(this.var_1114.asset3D,this._sparks,class_86(this._effect.source).hitArea.clickRadius + 10);
            addChild(_loc3_);
            this.var_1635.push(_loc3_);
            _loc2_++;
         }
         class_82.playSoundEffect(class_126.const_2891);
         class_82.playSoundEffect(class_126.const_1798,true,true,this._effect.source.position.x,this._effect.source.position.y,true,true);
         this.var_3413 = class_1210.instance.name_10.method_2960(true);
         this.var_3413.color = this._effect.repairSkillLevel.value == 0 ? 16777088 : 7182048;
         this.var_3413.specular = 12;
         this.var_3413.fallOff = 60;
         this.var_3413.diffuse = 10;
         this.method_3295();
         class_1210.instance.method_3528.method_1616.addChild(this);
         class_1210.instance.method_3528.method_1164(this);
      }
      
      private function method_3295() : void
      {
         this.var_3413.fallOff = Math.random() * 70;
         TweenNano.delayedCall(0.07,this.method_3295);
      }
      
      private function cleanup() : void
      {
         while(this.var_1635.length)
         {
            this.var_1635.pop().disposeView(true);
         }
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         if(this.var_3988)
         {
            this.var_3988.remove(this.method_310);
            this.var_3988 = null;
         }
         class_1210.instance.method_3528.method_3592(this);
         class_82.method_3212(class_126.const_2891,false);
         class_82.method_3212(class_126.const_1798,false);
         if(this.var_3413)
         {
            class_1210.instance.name_10.method_5202(this.var_3413);
            TweenNano.killTweensOf(this.method_3295);
            this.var_3413 = null;
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.cleanup();
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         moveTo(this._effect.source.method_1474,this._effect.source.method_1121,this._effect.source.method_6123);
         rotationY = param1 > 0 ? Quad.easeOut(param1,rotationY,this.method_2166(rotationY,this.method_233),1) : Number(this.method_233);
         for each(_loc2_ in this.var_1635)
         {
            _loc2_.update(param1);
         }
         if(this.var_3413)
         {
            this.var_3413.moveTo(this.x,this.y + 10,this.z);
         }
      }
      
      private function get method_233() : Number
      {
         return (this._effect.source as class_86).rotation.degrees;
      }
      
      private function method_2166(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = (param2 - param1) % 360;
         if(_loc3_ != _loc3_ % 180)
         {
            _loc3_ = _loc3_ < 0 ? _loc3_ + 360 : _loc3_ - 360;
         }
         return _loc3_;
      }
   }
}

import com.greensock.TweenNano;
import flash.geom.Vector3D;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
import package_295.class_1752;
import package_304.class_2104;
import package_371.class_2451;
import package_373.class_2134;
import package_99.class_266;

class RobotBehavior3D extends class_1752 implements IDisposable
{
   
   private static const MOVE_TIME:Number = 3;
    
   
   private var _sparks:class_2104;
   
   private var _waitingTime:Number;
   
   private var _currentWaitTime:Number = 0;
   
   private var _currentMoveTime:Number = 0;
   
   private var _desireQuaternion:class_2451;
   
   private var _currQuaternion:class_2451;
   
   private var _rotTmp:Vector3D;
   
   private var _uberAsset:class_2134;
   
   private var b:Boolean = true;
   
   function RobotBehavior3D(param1:String, param2:class_2104, param3:Number)
   {
      super();
      this._sparks = param2.clone() as class_2104;
      this._sparks.y = param3 * 0.45;
      addChild(this._sparks);
      this._uberAsset = new class_2134(UberAssetsLib.instance.getDescriptor(param1,UberAssetsLib.LIB_DEFAULT).display3D[0]);
      this._uberAsset.y = param3;
      addChild(this._uberAsset);
      this._desireQuaternion = new class_2451();
      this._currQuaternion = new class_2451();
      this.reset();
   }
   
   public function update(param1:Number) : void
   {
      if(this._currentMoveTime < 1)
      {
         this._currQuaternion.method_4408(this._currQuaternion,this._desireQuaternion,this._currentMoveTime);
         this._rotTmp = this._currQuaternion.method_4229(this._rotTmp);
         this._rotTmp.scaleBy(class_266.RADTODEG);
         rotationX = this._rotTmp.x;
         rotationY = this._rotTmp.y;
         rotationZ = this._rotTmp.z;
         this.switchSparksOnOff();
         this._currentMoveTime += param1 / Number(MOVE_TIME);
      }
      else if(this._currentWaitTime < 1)
      {
         this._currentWaitTime += param1 / Number(this._waitingTime);
      }
      else
      {
         this.reset();
      }
      this._sparks.animator.time += param1 * 1000 * Number(this._sparks.animator.playbackSpeed);
   }
   
   private function switchSparksOnOff() : void
   {
      if(this.b)
      {
         this._sparks.visible = false;
         TweenNano.delayedCall(Number(this._waitingTime) - 0.1,this.sparksOff);
         this.b = false;
      }
   }
   
   private function sparksOff() : void
   {
      this._sparks.visible = true;
   }
   
   private function reset() : void
   {
      this._desireQuaternion.method_6528(this.randomBetween(0,Math.PI) + 0,0,this.randomBetween(0,Math.PI) + 0);
      this._currentWaitTime = 0;
      this._currentMoveTime = 0;
      this._waitingTime = this.randomBetween(0,3.5);
      this.b = true;
   }
   
   public function disposeView(param1:Boolean = false) : void
   {
      if(this._uberAsset != null)
      {
         this._uberAsset.disposeView();
         this._uberAsset = null;
      }
      if(parent)
      {
         parent.removeChild(this);
      }
   }
   
   private function randomBetween(param1:Number, param2:Number) : Number
   {
      return param1 + Math.random() * (param2 - param1);
   }
}
