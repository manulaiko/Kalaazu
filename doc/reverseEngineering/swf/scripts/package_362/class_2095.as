package package_362
{
   import flash.display.BitmapData;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_1181;
   import net.bigpoint.darkorbit.map.view2D.backgrounds.view.class_2087;
   import net.bigpoint.darkorbit.mvc.display.IDisplayObject;
   import net.bigpoint.darkorbit.mvc.display.class_1200;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.IAnimatedViewContainer;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_65;
   import package_17.class_62;
   import package_361.class_2089;
   import package_9.ResourceManager;
   
   public class class_2095 extends class_2087
   {
      
      private static const const_2191:Object = {};
      
      {
         const_2191["trainingArenaScore"] = class_2387;
      }
      
      private var _builder:class_1200;
      
      private var _collider:BitmapData;
      
      private var var_2041:int = 0;
      
      private var var_4614:int = 0;
      
      private var var_3610:Number = 1;
      
      private var var_390:Vector.<class_2386>;
      
      private var var_176:class_1181;
      
      private var _descriptor:IAnimatedViewContainer;
      
      public function class_2095(param1:class_1200, param2:class_1181)
      {
         this.var_390 = new Vector.<class_2386>();
         super(param1.method_2524() as IDisplayObject,new class_2089(0,1));
         this.var_176 = param2;
         this._builder = param1;
      }
      
      public function get descriptor() : IAnimatedViewContainer
      {
         return this._descriptor;
      }
      
      override public function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         view.x = (Number(this.var_176.owner.x) - param1) / Number(this.var_176.parallaxFactor) + param3;
         view.y = (Number(this.var_176.owner.y) - param2) / Number(this.var_176.parallaxFactor) + param4;
      }
      
      override protected function method_3258() : Boolean
      {
         return true;
      }
      
      override protected function method_352() : void
      {
         var _loc1_:* = null;
         super.method_352();
         while(this.var_390.length)
         {
            _loc1_ = this.var_390.pop();
            if(_loc1_ is IDisposable)
            {
               IDisposable(_loc1_).disposeView();
            }
         }
         Settings.qualityBackground.changed.add(this.method_4425);
         Settings.autoQualityReduction.changed.add(this.method_4425);
         class_62.getInstance().sendNotification(MapAssetNotification.LOAD_MAPASSET_VIEW,new ViewCreateDTO(this.var_176.method_1489,this.initView,this._builder,null,this.var_176.debug));
      }
      
      override protected function unloadView() : void
      {
         var _loc1_:* = null;
         while(this.var_390.length)
         {
            _loc1_ = this.var_390.pop();
            if(_loc1_ is IDisposable)
            {
               IDisposable(_loc1_).disposeView();
            }
         }
         if(this._collider)
         {
            this._collider.dispose();
            this._collider = null;
         }
         Settings.qualityBackground.changed.remove(this.method_4425);
         Settings.autoQualityReduction.changed.remove(this.method_4425);
         super.unloadView();
      }
      
      override public function method_822(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = 0;
         if(this._collider)
         {
            _loc3_ = uint(this._collider.getPixel32((param1 - 0 - Number(this.var_2041)) * Number(this.var_3610),(param2 - 0 - Number(this.var_4614)) * Number(this.var_3610)));
            return _loc3_ >>> 24 > 128;
         }
         return false;
      }
      
      protected function initView(param1:IAnimatedViewContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this._descriptor = param1;
         view.addUntypedChild(this._descriptor.view);
         this.method_4425();
         for each(_loc2_ in this.var_176.decorators)
         {
            if(false)
            {
               _loc3_ = new const_2191[_loc2_]();
               this.var_390.push(_loc3_);
               _loc3_.method_1804(this,this.var_176);
            }
         }
         this.method_239(this._descriptor.dto.xmlData.collision);
      }
      
      private function method_4425() : void
      {
         if(this._descriptor)
         {
            this._descriptor.userQuality = Settings.qualityBackground.value;
            this._descriptor.reductionLevel = Settings.autoQualityReduction.value;
         }
      }
      
      private function method_239(param1:XMLList) : void
      {
         var _loc2_:String = param1.@resKey;
         this.var_2041 = int(param1.@x);
         this.var_4614 = int(param1.@y);
         this.var_3610 = Number(param1.@scale) || true;
         if(ResourceManager.name_15.method_5888(_loc2_))
         {
            ResourceManager.name_15.load(_loc2_,this.method_314);
         }
      }
      
      private function method_314(param1:class_65) : void
      {
         this._collider = param1.getBitmap().bitmapData.clone();
         param1.dispose();
      }
   }
}
