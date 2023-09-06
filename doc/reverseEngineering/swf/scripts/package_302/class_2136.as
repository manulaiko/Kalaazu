package package_302
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.errors.IllegalOperationError;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_39;
   import package_120.class_2010;
   import package_120.class_431;
   import package_22.class_1066;
   import package_22.class_1069;
   import package_22.class_198;
   import package_295.class_1752;
   import package_307.class_1772;
   import package_307.class_1776;
   import package_307.class_2448;
   import package_369.class_2117;
   import package_9.ResourceManager;
   
   public class class_2136 extends class_1752 implements IDisposable
   {
       
      
      private var var_394:class_431;
      
      public function class_2136(param1:class_431)
      {
         super();
         this.var_394 = param1;
         this.var_394.zoneTypeSpecification.changed.add(this.redraw);
         this.var_394.scaling.changed.add(this.redraw);
         this.var_394.rotationSpeed.changed.add(this.redraw);
         this.var_394.pulseSpeed.changed.add(this.redraw);
         this.var_394.pulseSpeed.changed.add(this.redraw);
         this.var_394.movingSpeedX.changed.add(this.redraw);
         this.var_394.movingSpeedY.changed.add(this.redraw);
         if(this.var_394.useCustomShader)
         {
            this.var_394.useCustomShader.changed.add(this.redraw);
         }
         Settings.qualityPoizone.changed.add(this.redraw);
         this.redraw();
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_394.zoneTypeSpecification.changed.remove(this.redraw);
         this.var_394.scaling.changed.remove(this.redraw);
         this.var_394.rotationSpeed.changed.remove(this.redraw);
         this.var_394.pulseSpeed.changed.remove(this.redraw);
         this.var_394.movingSpeedX.changed.remove(this.redraw);
         this.var_394.movingSpeedY.changed.remove(this.redraw);
         if(this.var_394.useCustomShader)
         {
            this.var_394.useCustomShader.changed.remove(this.redraw);
         }
         Settings.qualityPoizone.changed.remove(this.redraw);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      protected function method_224(param1:class_1772) : void
      {
         throw new IllegalOperationError("Abstract method");
      }
      
      protected function redraw() : void
      {
         var _loc1_:String = "null";
         var _loc2_:class_1066 = class_198.var_4779[this.var_394.method_3350];
         if(_loc2_ != null)
         {
            _loc1_ = _loc2_.designType;
         }
         switch(_loc1_)
         {
            case class_1066.const_2303:
               if(Settings.qualityPoizone.value < Settings.QUALITY_GOOD)
               {
                  this.method_6027();
                  break;
               }
               while(this.numChildren > 0)
               {
                  this.removeChildAt(0);
               }
               break;
            case class_1066.const_2109:
               if(_loc2_ is class_1069)
               {
                  ResourceManager.name_15.load(class_1069(_loc2_).resKey,this.method_4200);
                  break;
               }
               break;
            default:
               this.method_6027();
         }
      }
      
      private function method_843(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_1066 = class_198.var_4779[this.var_394.method_3350];
         if(param1 != null)
         {
            if(Boolean(_loc2_) && Boolean(_loc2_.useCustomShader))
            {
               _loc3_ = new POIZoneMaterial(new class_2117(param1));
               (_loc3_ as POIZoneMaterial).scaling = this.method_1818.scaling.value != 0 ? Number(this.method_1818.scaling.value) : Number(_loc2_.textureSize);
               (_loc3_ as POIZoneMaterial).rotationSpeed = this.method_1818.rotationSpeed.value;
               (_loc3_ as POIZoneMaterial).pulseSpeed = this.method_1818.pulseSpeed.value;
               (_loc3_ as POIZoneMaterial).movingSpeedX = this.method_1818.movingSpeedX.value;
               (_loc3_ as POIZoneMaterial).movingSpeedY = this.method_1818.movingSpeedY.value;
            }
            else
            {
               _loc3_ = new class_1776(new class_2117(param1));
            }
         }
         else
         {
            _loc3_ = new class_2448(class_2010.method_1388(this.method_1818),class_2010.method_5228(this.method_1818));
         }
         _loc3_.blendMode = BlendMode.LAYER;
         this.method_224(_loc3_);
      }
      
      private function method_6027() : void
      {
         var _loc2_:* = null;
         var _loc1_:uint = uint(class_2010.method_1227(this.var_394));
         if(_loc1_ == class_2010.const_1607)
         {
            _loc2_ = ResourceManager.getBitmapData("simple_patterns",this.var_394.method_807);
         }
         this.method_843(_loc2_);
      }
      
      private function method_4200(param1:class_39) : void
      {
         var _loc3_:BitmapData = param1.getEmbeddedBitmapData("image");
         this.method_843(_loc3_);
      }
      
      protected function get method_1818() : class_431
      {
         return this.var_394;
      }
   }
}
