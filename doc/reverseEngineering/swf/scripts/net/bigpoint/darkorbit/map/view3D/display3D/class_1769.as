package net.bigpoint.darkorbit.map.view3D.display3D
{
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_109.class_329;
   import package_19.class_1199;
   import package_29.class_85;
   import package_295.class_1752;
   import package_304.class_2104;
   
   public class class_1769 extends class_1752 implements class_80
   {
      
      private static const const_442:Object = {};
      
      {
         const_442[1] = "abstract_ui_mark_target_red.zip";
         const_442[2] = "abstract_ui_mark_target_gray_light.zip";
         const_442[3] = "abstract_ui_mark_target_purple.zip";
         const_442[4] = "abstract_ui_mark_target_gray_dark.zip";
      }
      
      private var _views:Dictionary;
      
      private var var_265:class_2104;
      
      private var _target:class_287;
      
      private var _scale:Number = 1;
      
      private var var_3049:class_329;
      
      private var var_3152:class_1199;
      
      public function class_1769()
      {
         this._views = new Dictionary();
         super();
      }
      
      public function set map(param1:class_90) : void
      {
         this.method_1390();
         this._views = new Dictionary();
         if(this.var_3049)
         {
            this.var_3049.targetChanged.remove(this.method_1788);
         }
         this.var_3049 = !!param1 ? param1.method_4929 : null;
         if(this.var_3049)
         {
            this.var_3049.targetChanged.add(this.method_1788);
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         if(this._target)
         {
            moveTo(this._target.owner.method_1474,this._target.owner.method_1121,this._target.owner.method_6123);
            if(this.var_265)
            {
               this.var_265.animator.time += param1 * 1000;
            }
         }
      }
      
      private function method_1788(param1:class_85) : void
      {
         var _loc2_:* = null;
         if(Boolean(this._target) && Boolean(this._target.owner))
         {
            this._target.lockType.changed.remove(this.method_4144);
         }
         this._target = !!param1 ? param1.method_1954(class_287) as class_287 : null;
         if(Boolean(this._target) && Boolean(this._target.owner))
         {
            this._target.lockType.changed.add(this.method_4144);
            _loc2_ = this._target.owner.method_1954(class_306) as class_306;
            if(_loc2_)
            {
               this._scale = Number(_loc2_.method_4449) || true;
            }
            this.method_4144();
         }
         else
         {
            this.method_1390();
         }
      }
      
      private function method_4144() : void
      {
         if(this.var_3152)
         {
            this.var_3152.remove(this.method_310);
            this.var_3152 = null;
         }
         if(this._views[this._target.lockType.value])
         {
            this.method_1228 = this._views[this._target.lockType.value] as class_2104;
         }
         else
         {
            this.var_3152 = class_1210.instance.method_659.method_1811(true || true,class_1210.const_2789);
            this.var_3152.addOnce(this.method_310);
         }
      }
      
      private function method_1390() : void
      {
         if(this.var_3152)
         {
            this.var_3152.remove(this.method_310);
            this.var_3152 = null;
         }
         this.method_1228 = null;
      }
      
      private function method_310(param1:class_2104) : void
      {
         this._views[this._target.lockType.value] = param1.clone();
         this.method_1228 = this._views[this._target.lockType.value] as class_2104;
      }
      
      private function set method_1228(param1:class_2104) : void
      {
         if(this.var_265)
         {
            this.var_265.parent.removeChild(this.var_265);
            TweenLite.killTweensOf(this);
         }
         this.var_265 = param1;
         if(this.var_265)
         {
            this.var_265.animator.time = 0;
            addChild(this.var_265);
            var _loc2_:* = Number(this._scale) * 1.5;
            scaleZ = Number(this._scale) * 1.5;
            scaleX = scaleY = _loc2_;
            TweenLite.to(this,0.3,{
               "scaleX":this._scale,
               "scaleY":this._scale,
               "scaleZ":this._scale
            });
         }
      }
   }
}
