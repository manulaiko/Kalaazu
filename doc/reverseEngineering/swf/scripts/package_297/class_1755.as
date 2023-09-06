package package_297
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.Stage;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_120.class_1196;
   import package_120.class_431;
   import package_193.class_1197;
   import package_200.Settings3D;
   import package_299.class_1758;
   import package_305.class_1767;
   
   public class class_1755
   {
      
      private static var var_379:Number = 0;
       
      
      private const const_2061:Number = 25;
      
      private const const_1819:Number = 0;
      
      private var _ship:class_2135;
      
      private var _map:class_90;
      
      private var var_988:Number = 0;
      
      private var var_116:class_1767;
      
      private var _stage:Stage;
      
      private var var_2443:EventDispatcher;
      
      private var var_1784:Boolean;
      
      private var var_495:Number;
      
      private var var_4488:Number;
      
      private var var_2259:Boolean;
      
      private var _mapView:class_1211;
      
      private var updateCamera:Boolean = false;
      
      private var var_898:Vector.<class_431>;
      
      private var _inZone:Boolean = false;
      
      private var _cam:class_1764;
      
      public function class_1755(param1:class_1767, param2:class_1211)
      {
         this.var_898 = new Vector.<class_431>();
         this._cam = new class_1764();
         super();
         this.var_116 = param1;
         this._mapView = param2;
         Settings.show_debug_objects.changed.add(this.method_4402);
      }
      
      public function get zones() : Vector.<class_431>
      {
         return this.var_898;
      }
      
      public function get method_2430() : Boolean
      {
         return this._inZone;
      }
      
      public function get method_4821() : class_1764
      {
         return this._cam;
      }
      
      public function get zoom() : Number
      {
         return this._cam.zoom;
      }
      
      public function set zoom(param1:Number) : void
      {
         this._cam.zoom = param1;
      }
      
      private function get pan() : Number
      {
         return this._cam.pan.value;
      }
      
      private function set pan(param1:Number) : void
      {
         if(Settings3D.const_634.value)
         {
            param1 %= 360;
            while(param1 < 0)
            {
               param1 += 360;
            }
         }
         this._cam.pan.value = param1;
      }
      
      public function get tilt() : Number
      {
         return this._cam.tilt.value;
      }
      
      public function set tilt(param1:Number) : void
      {
         if(Settings3D.const_634.value)
         {
            if(param1 > this._cam.const_996)
            {
               param1 = Number(this._cam.const_996);
            }
            if(param1 < this._cam.const_3257)
            {
               param1 = Number(this._cam.const_3257);
            }
         }
         this._cam.tilt.value = param1;
      }
      
      private function get hero() : class_86
      {
         return this._map.hero;
      }
      
      public function init(param1:Stage, param2:EventDispatcher) : void
      {
         this._stage = param1;
         this.var_2443 = param2;
         this._stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.method_2280,true,1000);
         this.var_2443.addEventListener(MouseEvent.MOUSE_WHEEL,this.method_2737);
         this._stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this.method_5497);
      }
      
      public function dispose() : void
      {
         this._stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.method_2280,true);
         this.var_2443.removeEventListener(MouseEvent.MOUSE_WHEEL,this.method_2737);
         this._stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this.method_5497);
         this.stopDragging();
      }
      
      public function updateObj(param1:Number) : void
      {
      }
      
      public function method_2626(param1:class_90, param2:Boolean) : void
      {
         if(this._map)
         {
            this._map.const_1216.remove(this.method_3033);
         }
         this._map = param1;
         if(param1)
         {
            this._map.const_1216.add(this.method_3033);
         }
         this.stopDragging();
         this.method_3033();
         this.var_2259 = param2;
         this._cam.var_465 = param2;
         if(this.var_2259)
         {
            this._cam.method_2212 = 0;
            this._cam.pan.value = 25;
            if(this._map.hero)
            {
               this.method_2104(this._map.hero.id);
            }
            else
            {
               this._map.const_1154.add(this.method_2104);
            }
         }
         else
         {
            this._cam.restoreDefaults(true);
         }
      }
      
      public function update(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         this.var_988 += param1;
         if(this.var_988 > 1 && Boolean(this.var_2259) && Boolean(this.updateCamera))
         {
            this.var_988 = 0;
            _loc4_ = this.getCurrentCameraZone();
            if(this._inZone != Boolean(_loc4_))
            {
               if(Boolean(_loc4_) && this._map.storage[_loc4_] != true)
               {
                  this._map.storage[_loc4_] = true;
                  this._cam.zoomIn();
               }
               else
               {
                  this.stopDragging();
                  this._cam.restoreDefaults(false,true);
               }
            }
            this._inZone = Boolean(_loc4_);
         }
         if(Boolean(this.method_2430) || Settings3D.const_634.value == false)
         {
            if(this.var_1784)
            {
               this.pan -= 0.5 * (Number(this._stage.mouseX) - Number(this.var_495));
               this.tilt += 0.5 * (Number(this._stage.mouseY) - Number(this.var_4488));
               this.var_495 = this._stage.mouseX;
               this.var_4488 = this._stage.mouseY;
            }
         }
         this._cam.method_1154(param2,0,-param3);
         this.var_116.position = this._cam.position;
         this.var_116.method_1154(this._cam.method_4267,Vector3D.Y_AXIS);
         this.var_116.lens.method_5049 = 10;
         this.var_116.lens.method_1840 = 80000;
         class_1758(this.var_116.lens).fieldOfView = this.method_4821.const_433.value;
      }
      
      public function zoomIn() : void
      {
         if(this.method_3015())
         {
            this._cam.zoom *= 1.2;
         }
      }
      
      public function zoomOut() : void
      {
         if(this.method_3015())
         {
            this._cam.zoom *= 0.8;
         }
      }
      
      private function method_2104(param1:Number) : void
      {
         if(param1 == class_81.userID)
         {
            this._map.const_1154.remove(this.method_2104);
            this._ship = this._mapView.method_3658.method_6501(this._map.hero.method_1954(class_306)) as class_2135;
            this._ship.ready.add(this.method_4378);
         }
      }
      
      private function method_4378() : void
      {
         this._ship.ready.remove(this.method_4378);
         TweenLite.delayedCall(0.2,function():void
         {
            var _loc1_:class_1196 = getCurrentCameraZone();
            if(_loc1_)
            {
               _map.storage[_loc1_] = true;
               _inZone = true;
               _cam.zoomIn();
            }
            else
            {
               _cam.restoreDefaults(false,true);
            }
            updateCamera = true;
         });
      }
      
      private function getCurrentCameraZone() : class_1196
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!this.hero)
         {
            return null;
         }
         var _loc1_:Number = Number(this.var_898.length);
         var _loc2_:Point = this.hero.position.method_3137();
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            if((_loc5_ = (_loc4_ = this.var_898[_loc3_]).method_1954(class_1196) as class_1196).contains(_loc2_))
            {
               return _loc5_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function method_3033() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         this.var_898.length = 0;
         if(Boolean(this._map) && this._map.method_3763.display3D.length() > 0)
         {
            _loc1_ = UberAssetsLib.instance.getDescriptor(String(this._map.method_3763.display3D.@templateId),UberAssetsLib.LIB_MAPS);
            if(_loc1_)
            {
               _loc3_ = _loc1_.display3D[0].child("cameraZone");
               for each(_loc4_ in _loc3_)
               {
                  _loc2_ = _loc4_;
                  _loc5_ = Number(_loc2_.@x);
                  _loc6_ = Number(_loc2_.@y);
                  _loc7_ = Number(_loc2_.@scale);
                  _loc8_ = new class_1197(class_90.method_5486,class_431.const_941,new class_73(_loc5_,_loc6_,0),_loc7_,false,0);
                  this.var_898.push(_loc8_);
               }
            }
         }
         this.method_4402();
      }
      
      private function method_4402() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         if(Settings.show_debug_objects.value)
         {
            _loc1_ = Number(this.var_898.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this._map.method_2402.method_4008("cameraZone" + var_379++,this.var_898[_loc2_],"");
               _loc2_++;
            }
         }
         else
         {
            _loc1_ = Number(this.var_898.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this._map.method_2402.method_2368("cameraZone" + this.var_898[_loc2_].id);
               _loc2_++;
            }
            var_379 = 0;
         }
      }
      
      private function stopDragging() : void
      {
         if(this.var_1784)
         {
            if(Settings3D.const_634.value)
            {
               this._cam.restoreDefaults(false,false);
            }
            this.var_1784 = false;
         }
      }
      
      private function method_2280(param1:MouseEvent) : void
      {
         if(param1.target == this.var_2443 && (Boolean(this.var_2259) && Boolean(this.method_2430) || Settings3D.const_634.value == false))
         {
            this.var_1784 = true;
            this.var_495 = this._stage.mouseX;
            this.var_4488 = this._stage.mouseY;
            param1.stopImmediatePropagation();
            this._cam.method_1943();
         }
      }
      
      private function method_5497(param1:MouseEvent) : void
      {
         this.stopDragging();
      }
      
      private function method_2737(param1:MouseEvent) : void
      {
         if(param1.altKey == false && Boolean(this.method_3015()))
         {
            this._cam.zoom *= param1.delta < 0 ? 0.8 : 1.2;
         }
      }
      
      private function method_3015() : Boolean
      {
         return true;
      }
   }
}
