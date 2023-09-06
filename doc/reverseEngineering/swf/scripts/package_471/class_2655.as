package package_471
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import net.bigpoint.darkorbit.settings.BindableSettings;
   import package_200.Settings3D;
   import package_22.class_198;
   import package_22.class_221;
   import package_27.class_82;
   import package_304.class_2104;
   import package_373.class_2456;
   import package_379.class_2648;
   import package_445.*;
   
   public class class_2655 implements class_80, IDisposable
   {
      
      private static const const_976:BindableSettings = Settings3D.effects;
      
      public static var var_699:Boolean = true;
      
      public static const const_481:String = "thruster.zip";
      
      private static const const_2815:String = "speed_buff.zip";
       
      
      public var tilt:Number = 0;
      
      private var var_2602:Vector.<class_2104>;
      
      private var var_4009:class_2710;
      
      private var var_127:class_2469;
      
      private var _ship:class_86;
      
      private var var_432:class_2648;
      
      private var _path:String = "thruster.zip";
      
      private var var_962:Vector.<class_2104>;
      
      private var var_3274:class_299;
      
      public function class_2655(param1:class_2469)
      {
         var _loc2_:* = null;
         this.var_2602 = new Vector.<class_2104>();
         this.var_962 = new Vector.<class_2104>();
         super();
         this.var_127 = param1;
         this._ship = this.var_127.ship;
         this.var_3274 = this._ship.method_1954(class_299) as class_299;
         if(Boolean(this.var_127.view) && this.var_127.view.method_3287.length > 0)
         {
            _loc2_ = this.var_127.view.method_3287[0];
            this.var_432 = class_2648(_loc2_.mesh);
            const_976.changed.add(this.reload);
            this._ship.const_1925.changed.add(this.method_279);
            this.var_3274.targetChanged.add(this.method_3855);
            this.reload();
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_432 = null;
         const_976.changed.remove(this.reload);
         this._ship.const_1925.changed.remove(this.method_279);
         this.method_4945(0);
         class_82.method_3212(this.method_1615.method_3142(),true);
      }
      
      public function method_3855() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_962)
         {
            _loc1_.visible = this.var_3274.target == null;
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Boolean = Boolean(this.var_127.ship.method_6406);
         var _loc5_:Number = (_loc5_ = _loc3_ ? 1 : (!!this._ship.isNPC ? 0 : 0.7)) * (Number(!!this._ship.const_1925.value ? 3 : 1.5));
         _loc4_ = this.var_2602.length - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = this.var_2602[_loc4_];
            _loc2_.scaleX = _loc2_.scaleY = _loc2_.scaleZ = Linear.easeNone(0.1,_loc2_.scaleX,_loc5_ / (Number(_loc2_.parent.scaleX) * Number(_loc2_.parent.parent.scaleX)) - Number(_loc2_.scaleX),0.5);
            _loc2_.rotationY = Number(this.tilt) / 4;
            if(_loc2_.scaleX > 0.01)
            {
               _loc2_.visible = true;
               _loc2_.animator.time += int(param1 * 1000);
            }
            else
            {
               _loc2_.visible = false;
            }
            _loc4_--;
         }
         if(this.var_4009)
         {
            this.var_4009.updateObj(param1);
         }
         if(Boolean(this._ship.method_6225()) && this.method_1615.method_3142() != -1)
         {
            if(this._ship.method_6406)
            {
               class_82.playSoundEffect(this.method_1615.method_3142(),true,true,-1,-1,true,true);
            }
            else
            {
               class_82.method_3212(this.method_1615.method_3142(),true);
            }
         }
      }
      
      private function reload(param1:Number = 0.3) : void
      {
         this.method_4945(param1);
         if(this.var_432)
         {
            if(this.method_6423())
            {
               class_1210.instance.method_659.method_1811(this._path,class_1210.const_2789).addOnce(this.method_5737);
            }
            if(this.method_6229())
            {
               this.var_4009 = new class_2710(this._ship,this.var_432.const_2560,this.var_127.view.method_3287[0]);
               class_1210.instance.method_3528.method_1616.addChild(this.var_4009);
            }
         }
      }
      
      private function method_5737(param1:class_2104) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this.method_6423())
         {
            return;
         }
         if(this.var_432)
         {
            for each(_loc2_ in this.var_432.const_2560)
            {
               _loc3_ = param1.clone() as class_2104;
               _loc3_.animator.time = Math.random() * 1000;
               _loc3_.position = _loc2_;
               _loc3_.scale(0);
               _loc3_.rotationX = 180;
               _loc3_.method_5430.slot = _loc2_;
               this.var_2602.push(_loc3_);
               this.var_127.view.method_3287[0].addChild(_loc3_);
            }
         }
      }
      
      private function method_6423() : Boolean
      {
         if(!var_699)
         {
            return false;
         }
         if(Settings3D.effects.high.value)
         {
            return true;
         }
         if(Settings3D.effects.medium.value)
         {
            return !this._ship.isNPC;
         }
         return false;
      }
      
      private function method_6229() : Boolean
      {
         if(!var_699)
         {
            return false;
         }
         if(Settings3D.effects.high.value)
         {
            return true;
         }
         if(Settings3D.effects.medium.value)
         {
            return !this._ship.isNPC;
         }
         return false;
      }
      
      private function method_4945(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         while(this.var_2602.length)
         {
            _loc2_ = this.var_2602.pop() as class_2104;
            if(param1)
            {
               TweenLite.to(_loc2_,param1,{
                  "scaleX":0,
                  "scaleY":0,
                  "scaleZ":0,
                  "onComplete":_loc2_.parent.removeChild,
                  "onCompleteParams":[_loc2_]
               });
            }
            else
            {
               _loc2_.parent.removeChild(_loc2_);
            }
         }
         if(this.var_4009)
         {
            this.var_4009.parent.removeChild(this.var_4009);
            this.var_4009.dispose();
            this.var_4009 = null;
         }
         while(this.var_962.length)
         {
            _loc3_ = this.var_962.pop();
            _loc3_.animator.stop();
            if(_loc3_.parent)
            {
               _loc3_.parent.removeChild(_loc3_);
            }
         }
      }
      
      private function method_279() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._ship.const_1925.value)
         {
            if(this.var_962.length <= 0)
            {
               class_1210.instance.method_659.method_1811(const_2815,class_1210.const_2789).addOnce(this.method_546);
            }
            else
            {
               for each(_loc1_ in this.var_962)
               {
                  _loc1_.animator.start();
                  this.var_127.view.method_3287[0].addChild(_loc1_);
               }
            }
         }
         else
         {
            for each(_loc2_ in this.var_962)
            {
               _loc2_.animator.stop();
               if(_loc2_.parent)
               {
                  _loc2_.parent.removeChild(_loc2_);
               }
            }
         }
      }
      
      private function method_546(param1:class_2104) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc2_ in this.var_962)
         {
            _loc2_.animator.start();
            this.var_127.view.method_3287[0].addChild(_loc2_);
         }
         if(this.var_432)
         {
            for each(_loc3_ in this.var_432.const_2560)
            {
               (_loc4_ = param1.clone() as class_2104).position = _loc3_;
               _loc4_.rotationX = 180;
               _loc4_.animator.start();
               this.var_127.view.method_3287[0].addChild(_loc4_);
               this.var_962.push(_loc4_);
            }
         }
      }
      
      private function get method_1615() : class_221
      {
         return class_198.var_441[this._ship.shipPattern.method_2493()];
      }
   }
}
