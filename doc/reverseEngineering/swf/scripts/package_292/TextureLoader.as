package package_292
{
   import flash.utils.ByteArray;
   import net.bigpoint.as3toolbox.filecollection.class_66;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_19.class_1199;
   import package_198.class_1208;
   import package_200.Settings3D;
   import package_369.class_2115;
   
   public class TextureLoader extends class_1747
   {
       
      
      private var _stage3DProxy:class_1208;
      
      public function TextureLoader(param1:class_1208)
      {
         super(this.method_521,5);
         this._stage3DProxy = param1;
      }
      
      public function method_2382(param1:String) : Boolean
      {
         return false && SingleTextureLoader(const_2355[param1]).content != null;
      }
      
      public function loadTexture(param1:String, param2:uint, param3:class_66 = null) : class_1199
      {
         var _loc4_:SingleTextureLoader;
         if((_loc4_ = const_2355[param1] as SingleTextureLoader) == null || Boolean(Settings3D.const_2581.value))
         {
            const_2355[param1] = _loc4_ = new SingleTextureLoader(this._stage3DProxy,param1,param3 || class_1210.instance.name_15);
            _loc4_.load();
         }
         _loc4_.lifetime = Math.max(_loc4_.lifetime,param2);
         return _loc4_.ready;
      }
      
      public function method_3716(param1:ByteArray) : class_1199
      {
         var _loc2_:SingleTextureLoader = new SingleTextureLoader(this._stage3DProxy,null,null);
         _loc2_.loadData(param1);
         return _loc2_.ready;
      }
      
      public function method_4006(param1:class_2115) : void
      {
         method_1708(param1);
      }
      
      public function method_3008(param1:class_2115) : void
      {
         method_5039(param1);
      }
      
      override public function reset(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in const_2355)
         {
            _loc3_ = const_2355[_loc2_];
            if(_loc3_.lifetime <= param1)
            {
               _loc3_.dispose();
               const_2355[_loc2_] = null;
               delete const_2355[_loc2_];
            }
         }
         super.reset(param1);
      }
      
      private function method_521(param1:class_2115) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in const_2355)
         {
            _loc3_ = const_2355[_loc2_];
            if(_loc3_.content == param1 && _loc3_.lifetime <= class_1210.const_973)
            {
               _loc3_.dispose();
               const_2355[_loc2_] = null;
               delete const_2355[_loc2_];
               return;
            }
         }
      }
   }
}

import flash.utils.ByteArray;
import net.bigpoint.as3toolbox.filecollection.class_66;
import package_11.class_261;
import package_11.class_38;
import package_11.class_65;
import package_19.class_1199;
import package_198.class_1208;
import package_369.class_2115;
import package_369.class_2117;
import package_369.class_2118;

class SingleTextureLoader
{
    
   
   public const ready:class_1199 = new class_1199(class_2115);
   
   public var lifetime:uint = 0;
   
   private var _stage3DProxy:class_1208;
   
   private var _resKey:String;
   
   private var _content:class_2115;
   
   private var _fileCollection:class_66;
   
   function SingleTextureLoader(param1:class_1208, param2:String, param3:class_66)
   {
      super();
      this._stage3DProxy = param1;
      this._resKey = param2;
      this._fileCollection = param3;
   }
   
   public function load() : void
   {
      this._fileCollection.load(this._resKey,this.handleBytesLoadComplete,this.handleLoadError);
   }
   
   public function loadData(param1:ByteArray) : void
   {
      var data:ByteArray = param1;
      this.dispose();
      this._content = new class_2118(data,true);
      if(Boolean(this._stage3DProxy.method_4586()) && Boolean(this._stage3DProxy.context3D))
      {
         try
         {
            this._content.method_6425(this._stage3DProxy);
            class_2118(this._content).ready.addOnce(this.dispatchReady);
         }
         catch(e:Error)
         {
            dispatchReady();
         }
      }
      else
      {
         this.dispatchReady();
      }
   }
   
   public function dispose() : void
   {
      if(this._content)
      {
         this._content.dispose();
         this._content = null;
      }
   }
   
   public function get content() : class_2115
   {
      return this._content;
   }
   
   public function get resKey() : String
   {
      return this._resKey;
   }
   
   private function handleBytesLoadComplete(param1:class_38) : void
   {
      if(param1 is class_261)
      {
         this.loadData(class_261(param1).data);
         param1.dispose();
      }
      else if(param1 is class_65)
      {
         this._content = new class_2117(class_65(param1).getBitmap().bitmapData);
         param1.dispose();
         this.ready.dispatch(this._content);
      }
   }
   
   private function dispatchReady() : void
   {
      this.ready.dispatch(this._content);
   }
   
   private function handleLoadError(... rest) : void
   {
      if(Boolean(this._resKey) && this._resKey.indexOf("alpha_") == -1)
      {
      }
      this.ready.dispatch(null);
   }
}
