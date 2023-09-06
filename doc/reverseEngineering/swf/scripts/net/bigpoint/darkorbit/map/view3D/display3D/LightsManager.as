package net.bigpoint.darkorbit.map.view3D.display3D
{
   import com.greensock.TweenMax;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.settings.BindableSettings;
   import package_10.class_19;
   import package_200.Settings3D;
   import package_200.class_1771;
   import package_363.class_2101;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2102;
   
   public class LightsManager
   {
       
      
      private var var_3944:class_19;
      
      private var var_204:DirectionalLight;
      
      private var var_3697:Vector.<PointLight>;
      
      private var var_4901:Vector.<PointLight>;
      
      private var var_1810:Boolean = true;
      
      private var _bindings:Vector.<LightToSettingsBinding>;
      
      private var var_1554:int = 2;
      
      private var var_1605:Dictionary;
      
      private var var_3095:class_2101;
      
      private var var_1173:class_2101;
      
      private var var_1385:DirectionalLight;
      
      private var var_1282:PointLight;
      
      public function LightsManager()
      {
         this.var_3944 = Settings3D.effects.high;
         this.var_3697 = new Vector.<PointLight>();
         this.var_4901 = new Vector.<PointLight>();
         this._bindings = new Vector.<LightToSettingsBinding>();
         this.var_1605 = new Dictionary();
         super();
         this.var_204 = new DirectionalLight();
         this.var_204.ambient = this.var_204.specular = this.var_204.diffuse = 0;
         this.var_1385 = new DirectionalLight();
         this.method_974();
         this.method_974();
         this.method_974();
         this.var_1282 = new PointLight();
         this.var_3095 = new class_2101([]);
         this.var_1173 = new class_2101([]);
         this.var_3944.changed.add(this.method_1931);
         this.method_1931();
         this.method_4463(this.var_1385,Settings3D.const_685);
         this.method_4463(this.var_1282,Settings3D.const_1860);
         Settings3D.name_10.changed.add(this.method_3925);
         this.method_3925();
      }
      
      public function get method_1066() : class_2101
      {
         return this.var_3095;
      }
      
      public function get method_5790() : class_2101
      {
         return this.var_1173;
      }
      
      public function get method_1827() : class_2102
      {
         return this.var_1385;
      }
      
      public function get hero() : PointLight
      {
         return this.var_1282;
      }
      
      public function method_5498() : int
      {
         return this.var_1554;
      }
      
      public function update(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(Boolean(this.var_1810) || param1)
         {
            _loc2_ = [];
            if(this.var_1385.visible)
            {
               _loc2_.push(this.var_1385);
            }
            if(this.var_1282.visible)
            {
               _loc2_.push(this.var_1282);
            }
            for each(_loc3_ in this.var_3697)
            {
               if(_loc3_.visible)
               {
                  _loc2_.push(_loc3_);
               }
            }
            this.var_3095.name_10 = _loc2_;
            this.method_1931();
            this.var_1810 = false;
         }
      }
      
      public function dispose() : void
      {
         while(this._bindings.length)
         {
            LightToSettingsBinding(this._bindings.pop()).dispose();
         }
         this.var_3944.changed.remove(this.method_1931);
      }
      
      public function method_6370(param1:Number, param2:Number, param3:Number, param4:uint, param5:Number, param6:Number = 1, param7:Number = 1, param8:Number = 0.06, param9:Number = 0) : void
      {
         var _loc10_:PointLight;
         (_loc10_ = this.method_2960(false)).moveTo(param1,param2,param3);
         _loc10_.color = param4;
         TweenMax.to(_loc10_,param9,{
            "diffuse":param6,
            "specular":param7,
            "fallOff":param5
         });
         this.var_1605[_loc10_] = setTimeout(this.method_456,param8 * 1000,_loc10_,param9);
         class_1210.instance.method_3528.method_1616.addChild(_loc10_);
      }
      
      public function method_2960(param1:Boolean) : PointLight
      {
         var _loc2_:PointLight = this.var_4901.shift();
         clearTimeout(this.var_1605[_loc2_]);
         if(!(param1 && this.var_4901.length > 0))
         {
            this.var_4901.push(_loc2_);
         }
         return _loc2_;
      }
      
      public function method_5202(param1:PointLight) : void
      {
         param1.fallOff = 0;
         param1.radius = 0;
         var _loc2_:int = int(this.var_4901.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_4901.splice(_loc2_,1);
         }
         this.var_4901.push(param1);
      }
      
      private function method_3925() : void
      {
         this.var_1554 = Settings3D.name_10.value;
         var _loc1_:int = 0;
         switch(this.var_1554)
         {
            case BindableSettings.LOW:
               this.method_1827.visible = false;
               this.hero.visible = false;
               break;
            case BindableSettings.MEDIUM:
               this.method_1827.visible = true;
               this.hero.visible = false;
               _loc1_ = 1;
               break;
            case BindableSettings.HIGH:
               this.method_1827.visible = true;
               this.hero.visible = true;
               _loc1_ = 0;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3697.length)
         {
            this.var_3697[_loc2_].visible = _loc2_ < _loc1_;
            _loc2_++;
         }
         this.update(true);
      }
      
      private function method_974() : void
      {
         var _loc1_:PointLight = new PointLight();
         _loc1_.fallOff = 0;
         _loc1_.radius = 0;
         this.var_3697.push(_loc1_);
         this.var_4901.push(_loc1_);
      }
      
      private function method_4463(param1:class_2102, param2:class_1771) : void
      {
         param2.visible.changed.add(this.method_672);
         this._bindings.push(new LightToSettingsBinding(param1,param2));
      }
      
      private function method_672() : void
      {
         this.var_1810 = true;
      }
      
      private function method_1931() : void
      {
         this.var_1173.name_10 = Boolean(this.var_3944.value) && Boolean(this.var_1385.visible) ? [this.var_1385] : [];
      }
      
      private function method_456(param1:PointLight, param2:Number = 0) : void
      {
         TweenMax.to(param1,param2,{
            "specular":0,
            "ambient":0
         });
      }
   }
}

import package_200.class_1771;
import package_364.class_2102;

class LightToSettingsBinding
{
    
   
   private var _light:class_2102;
   
   private var _settings:class_1771;
   
   function LightToSettingsBinding(param1:class_2102, param2:class_1771)
   {
      super();
      this._light = param1;
      this._settings = param2;
      this._settings.visible.changed.add(this.updateLight);
      this._settings.color.changed.add(this.updateLight);
      this._settings.diffuse.changed.add(this.updateLight);
      this._settings.specular.changed.add(this.updateLight);
      this._settings.ambientColor.changed.add(this.updateLight);
      this._settings.ambient.changed.add(this.updateLight);
      this._settings.radius.changed.add(this.updateLight);
      this._settings.fallOff.changed.add(this.updateLight);
      this._settings.directionTilt.changed.add(this.updateLight);
      this._settings.directionPan.changed.add(this.updateLight);
      this.updateLight();
   }
   
   public function dispose() : void
   {
      this._settings.visible.changed.remove(this.updateLight);
      this._settings.color.changed.remove(this.updateLight);
      this._settings.diffuse.changed.remove(this.updateLight);
      this._settings.specular.changed.remove(this.updateLight);
      this._settings.ambientColor.changed.remove(this.updateLight);
      this._settings.ambient.changed.remove(this.updateLight);
      this._settings.radius.changed.remove(this.updateLight);
      this._settings.fallOff.changed.remove(this.updateLight);
      this._settings.directionTilt.changed.remove(this.updateLight);
      this._settings.directionPan.changed.remove(this.updateLight);
      this._settings = null;
      this._light = null;
   }
   
   private function updateLight() : void
   {
      this._settings.apply(this._light);
   }
}
