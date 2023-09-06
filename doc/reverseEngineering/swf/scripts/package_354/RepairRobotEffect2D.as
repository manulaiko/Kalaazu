package package_354
{
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_102.class_1727;
   import package_14.class_52;
   import package_17.class_62;
   import package_22.class_1081;
   import package_22.class_198;
   import package_266.DOTexturesProxy;
   import package_266.class_1713;
   import package_27.class_82;
   import package_286.class_2019;
   import package_75.class_1816;
   import package_9.class_50;
   
   public class RepairRobotEffect2D extends class_2019 implements IDisposable, class_52
   {
       
      
      private var var_4778:Vector.<RobotClipBehavior>;
      
      private var var_1114:class_1081;
      
      private var var_2802:class_1081;
      
      private var var_1065:class_1713;
      
      private var var_3105:class_1713;
      
      private var var_2075:class_1816;
      
      private var var_294:Number = 0;
      
      public function RepairRobotEffect2D(param1:class_1206, param2:class_1816)
      {
         super(param1,param2);
         this.var_2075 = param2;
         this.var_2075.repairBotId.changed.add(this.method_3131);
         this.var_2075.repairSkillLevel.changed.add(this.method_3131);
         this.method_3131();
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         this.method_165();
         super.disposeView(param1);
      }
      
      private function method_165() : void
      {
         class_82.method_3212(class_126.const_2891,false);
         class_82.method_3212(class_126.const_1798,false);
         class_50.removeObserver(this);
         if(this.var_4778 != null)
         {
            while(this.var_4778.length > 0)
            {
               RobotClipBehavior(this.var_4778.pop()).dispose();
            }
            this.var_4778 = null;
         }
         if(this.var_3105)
         {
            this.var_3105.ready.remove(this.method_5533);
         }
         if(this.var_1065)
         {
            this.var_1065.ready.remove(this.method_6400);
         }
      }
      
      private function get method_4228() : class_1816
      {
         return this.var_2075;
      }
      
      private function method_3131() : void
      {
         this.var_1114 = class_198.method_5078(this.method_4228.repairBotId.value);
         if(this.var_1114 == null)
         {
            this.var_1114 = class_198.method_5078("_default");
         }
         this.var_2802 = class_198.method_1466(this.method_4228.repairSkillLevel.value);
         if(this.var_2802 == null)
         {
            this.var_2802 = class_198.method_1466(0);
         }
         if(this.var_1114)
         {
            this.var_1065 = this.assetsProxy.method_4314(this.var_1114.resKey);
            this.var_1065.ready.addOnce(this.method_6400);
         }
      }
      
      private function get assetsProxy() : DOTexturesProxy
      {
         return class_62.getInstance().retrieveProxy(DOTexturesProxy.NAME) as DOTexturesProxy;
      }
      
      private function method_6400() : void
      {
         this.var_3105 = this.assetsProxy.method_4314(this.var_2802.resKey);
         this.var_3105.ready.addOnce(this.method_5533);
      }
      
      private function method_5533() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.method_165();
         class_82.playSoundEffect(class_126.const_2891);
         class_82.playSoundEffect(class_126.const_1798,true,true,this.method_4228.source.position.x,this.method_4228.source.position.y,true,true);
         class_50.method_5621(this);
         var _loc1_:* = Settings.qualityShip.value >= Settings.QUALITY_GOOD;
         this.var_4778 = new Vector.<RobotClipBehavior>();
         var _loc4_:int = int(this.var_1114.robotsNum);
         while(_loc4_ > 0)
         {
            _loc2_ = new Sprite();
            (_loc5_ = new class_1727(this.var_1065,"",30)).x = this.var_1114.offsetX;
            _loc5_.y = this.var_1114.offsetY;
            _loc2_.addChild(_loc5_);
            if(_loc1_)
            {
               if(this.var_2802)
               {
                  _loc3_ = new Sprite();
                  (_loc6_ = new class_1727(this.var_3105,"",30)).x = this.var_2802.offsetX;
                  _loc6_.y = this.var_2802.offsetY;
                  _loc6_.currentFrame = int(Number(_loc6_.numFrames) * Math.random());
                  _loc3_.addChild(_loc6_);
                  addChild(_loc3_);
               }
            }
            else
            {
               _loc5_.stop();
            }
            addChild(_loc2_);
            this.var_4778.push(new RobotClipBehavior(_loc2_,_loc3_));
            _loc4_--;
         }
         this.updateTimer(1);
      }
      
      public function updateTimer(param1:Number) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_4778)
         {
            _loc2_.nextMoveTimer += param1;
            _loc2_.ownerRotationRadians = class_86(this.method_4228.source).rotation.radians;
            if(_loc2_.nextMoveTimer > 0)
            {
               _loc2_.nextMoveTimer = this.randomBetween(-2000,-3000);
               _loc2_.moveTo(Number(this.randomBetween(1,1.2)) * Number(class_86(this.method_4228.source).hitArea.clickRadius),this.method_2420());
            }
            _loc2_.update(param1);
         }
      }
      
      private function method_2420() : Number
      {
         this.var_294 += Number(this.randomBetween(0.2,1)) * 0;
         return this.var_294;
      }
      
      private function randomBetween(param1:Number, param2:Number) : Number
      {
         return param1 + Math.random() * (param2 - param1);
      }
   }
}

import com.greensock.easing.Linear;
import flash.display.Sprite;
import flash.geom.Point;

class RobotClipBehavior
{
    
   
   private var _view:Sprite;
   
   private var _sparks:Sprite;
   
   private var _ownerRotationRadians:Number = 0;
   
   public var nextMoveTimer:Number = 0;
   
   public var robotRadius:Number = 0;
   
   public var robotRelativeRotationRadians:Number = 0;
   
   public var sparksRadius:Number = 0;
   
   public var sparksRelativeRotationRadians:Number = 0;
   
   private var _robotDesiredPosition:Point;
   
   private var _sparksDesiredPosition:Point;
   
   function RobotClipBehavior(param1:Sprite, param2:Sprite)
   {
      super();
      this._view = param1;
      this._sparks = param2;
   }
   
   public function dispose() : void
   {
      this._view.parent.removeChild(this._view);
      this._view = null;
      if(this._sparks != null)
      {
         this._sparks.parent.removeChild(this._sparks);
         this._sparks = null;
      }
   }
   
   public function moveTo(param1:Number, param2:Number) : void
   {
      this.robotRadius = param1;
      this.robotRelativeRotationRadians = param2;
      this.sparksRadius = Number(this.randomBetween(0.3,0.6)) * param1;
      this.sparksRelativeRotationRadians = param2 + this.randomBetween(-0.1,0.1);
      this.updateDesiredPositions();
   }
   
   public function set ownerRotationRadians(param1:Number) : void
   {
      if(this._ownerRotationRadians != param1)
      {
         this._ownerRotationRadians = param1;
         this.updateDesiredPositions();
      }
   }
   
   public function update(param1:Number) : void
   {
      this.tweenObject(this._view,this._robotDesiredPosition,param1);
      this._view.scaleX = Math.abs(this._view.scaleX) * (Number(this._view.x > 0 ? -1 : 1));
      if(this._sparks != null)
      {
         this.tweenObject(this._sparks,this._sparksDesiredPosition,param1);
      }
   }
   
   private function tweenObject(param1:Sprite, param2:Point, param3:Number) : void
   {
      var _loc4_:Number = Math.min(param3 / 1000,0.2);
      param1.x = Linear.easeNone(_loc4_,param1.x,param2.x - param1.x,0.2);
      param1.y = Linear.easeNone(_loc4_,param1.y,param2.y - param1.y,0.2);
   }
   
   private function updateDesiredPositions() : void
   {
      this._robotDesiredPosition = Point.polar(this.robotRadius,this._ownerRotationRadians + this.robotRelativeRotationRadians);
      this._sparksDesiredPosition = Point.polar(this.sparksRadius,this._ownerRotationRadians + this.sparksRelativeRotationRadians);
   }
   
   private function randomBetween(param1:Number, param2:Number) : Number
   {
      return param1 + Math.random() * (param2 - param1);
   }
}
