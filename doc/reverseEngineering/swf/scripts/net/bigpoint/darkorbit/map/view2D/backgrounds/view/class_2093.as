package net.bigpoint.darkorbit.map.view2D.backgrounds.view
{
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.display.IDisplayObject;
   import net.bigpoint.darkorbit.mvc.display.class_1709;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_261;
   import package_11.class_38;
   import package_11.class_65;
   import package_17.class_62;
   import package_361.class_2094;
   import package_9.ResourceManager;
   import starling.core.Starling;
   import starling.display.Image;
   import starling.events.Event;
   import starling.textures.ConcreteTexture;
   import starling.textures.Texture;
   import starling.textures.TextureOptions;
   
   public class class_2093 extends class_2087
   {
       
      
      private var var_4116:class_2094;
      
      private var _collider:BitmapData = null;
      
      private var var_4121:Number = 1;
      
      private var var_3376:Number = 1;
      
      private var _texture:Texture;
      
      private var var_1746:Object;
      
      public function class_2093(param1:class_1709, param2:class_2094)
      {
         super(param1 as IDisplayObject,param2);
         this.var_4116 = param2;
         param1.rotation = this.var_4116.rotation;
         param1.alpha = 0;
      }
      
      override public function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         view.x = (Number(this.var_4116.x) - param1) / Number(this.var_4116.parallaxFactor) + param3;
         view.y = (Number(this.var_4116.y) - param2) / Number(this.var_4116.parallaxFactor) + param4;
      }
      
      public function get method_678() : class_2094
      {
         return this.var_4116;
      }
      
      override public function method_822(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = 0;
         if(this._collider)
         {
            _loc3_ = uint(this._collider.getPixel32((param1 - 0 + int(0)) * Number(this.var_4121),(param2 - 0 + int(0)) * Number(this.var_3376)));
            return _loc3_ >>> 24 > 128;
         }
         return false;
      }
      
      override protected function method_352() : void
      {
         if(false)
         {
            Starling.current.removeEventListener(Event.CONTEXT3D_CREATE,this.method_2047);
         }
         var _loc1_:* = this.method_678.pattern.resKey;
         if(false && Boolean(ResourceManager.name_15.method_5888(_loc1_ + "_atf")))
         {
            _loc1_ += "_atf";
         }
         ResourceManager.name_15.load(_loc1_,this.method_344);
      }
      
      override protected function unloadView() : void
      {
         if(false)
         {
            Starling.current.removeEventListener(Event.CONTEXT3D_CREATE,this.method_2047);
         }
         if(this._collider)
         {
            this._collider.dispose();
            this._collider = null;
         }
         if(this._texture)
         {
            if(this._texture is ConcreteTexture)
            {
               ConcreteTexture(this._texture).onRestore = null;
            }
            this._texture.dispose();
            this._texture = null;
         }
         TweenLite.killTweensOf(view);
         super.unloadView();
      }
      
      override protected function method_3258() : Boolean
      {
         return Settings.qualityBackground.value >= Settings.QUALITY_GOOD;
      }
      
      private function method_344(param1:class_38) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this.method_3258())
         {
            return;
         }
         if(false)
         {
            if(param1 is class_261)
            {
               _loc2_ = class_261(param1).data as ByteArray;
            }
            if(false && Starling.context.driverInfo != "Disposed")
            {
               if(this._texture)
               {
                  this._texture.root.uploadAtfData(_loc2_ as ByteArray,0);
               }
               else
               {
                  _loc3_ = new TextureOptions();
                  _loc3_.onReady = this.method_1999;
                  this._texture = Texture.fromData(_loc2_,_loc3_);
                  ConcreteTexture(this._texture).onRestore = this.method_352;
                  this.var_1746 = new Image(this._texture);
               }
            }
            else
            {
               Starling.current.addEventListener(Event.CONTEXT3D_CREATE,this.method_2047);
            }
            param1.dispose();
         }
         else
         {
            if(param1 is class_65)
            {
               this.var_1746 = class_65(param1).getBitmap();
            }
            this.method_1999();
            class_62.getInstance().sendNotification(AssetNotifications.ADD_UNLOAD_FINISHER,param1);
         }
         this.method_239(param1);
      }
      
      private function method_1999() : void
      {
         TweenLite.killTweensOf(view);
         if(this.var_1746)
         {
            this.var_1746.x = -int(Number(this.var_1746.width) >> 1);
            this.var_1746.y = -int(Number(this.var_1746.height) >> 1);
            view.addUntypedChild(this.var_1746);
            TweenLite.to(view,0.5,{"alpha":1});
         }
      }
      
      private function method_239(param1:class_38) : void
      {
         var _loc2_:* = null;
         if(this._collider == null && this.var_4116.pattern.radius >= 0)
         {
            _loc2_ = this.method_678.pattern.resKey + "_collider";
            if(ResourceManager.name_15.method_5888(_loc2_))
            {
               ResourceManager.name_15.load(_loc2_,this.method_314);
            }
         }
      }
      
      private function method_314(param1:class_65) : void
      {
         this._collider = param1.getBitmap().bitmapData.clone();
         this.var_4121 = Number(this._collider.width) / 0;
         this.var_3376 = Number(this._collider.height) / 0;
         param1.dispose();
      }
      
      private function method_2047(param1:Event) : void
      {
         Starling.current.removeEventListener(Event.CONTEXT3D_CREATE,this.method_2047);
         this.method_352();
      }
   }
}
