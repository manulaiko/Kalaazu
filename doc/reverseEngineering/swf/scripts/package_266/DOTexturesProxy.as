package package_266
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AtlasResourceVO;
   import package_11.class_261;
   import package_11.class_262;
   import package_11.class_38;
   import package_11.class_39;
   import package_11.class_65;
   import package_19.class_1199;
   import package_9.ResourceManager;
   
   public class DOTexturesProxy extends DOAbstractProxy
   {
      
      public static const NAME:String = "DOTexturesProxy";
       
      
      private var var_4544:Dictionary;
      
      public function DOTexturesProxy()
      {
         this.var_4544 = new Dictionary();
         super(NAME);
      }
      
      public function getTextureResource(param1:String, param2:String, param3:String = "texture") : class_1713
      {
         var _loc4_:String = param2 + param1;
         var _loc5_:class_1713;
         if((_loc5_ = this.var_4544[_loc4_]) == null)
         {
            _loc5_ = new class_1713(param3);
            this.var_4544[_loc4_] = _loc5_;
            this.load(_loc5_,param1,param2);
         }
         return _loc5_;
      }
      
      public function method_4314(param1:String, param2:String = "texture") : class_1713
      {
         return this.getTextureResource(param1 + "_texture",param1 + "_atlas",param2);
      }
      
      public function method_4991() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.var_4544)
         {
            class_1713(this.var_4544[_loc1_]).dispose();
            this.var_4544[_loc1_] = null;
            delete this.var_4544[_loc1_];
         }
      }
      
      private function load(param1:class_1713, param2:String, param3:String) : void
      {
         var resource:class_1713 = param1;
         var textureResKey:String = param2;
         var atlasResKey:String = param3;
         ResourceManager.name_15.load(textureResKey,function(param1:class_38):void
         {
            if(param1 is class_65)
            {
               resource.setTexture(class_65(param1).getBitmap().bitmapData);
            }
            else if(param1 is class_39)
            {
               resource.setTexture(class_39(param1).getEmbeddedBitmapData(resource.method_2457));
            }
            else if(param1 is class_261)
            {
               resource.setTexture(class_261(param1).data);
            }
            sendNotification(AssetNotifications.ADD_UNLOAD_FINISHER,param1);
         });
         ResourceManager.name_15.load(atlasResKey,function(param1:class_262):void
         {
            resource.method_2501(new class_1937(param1.method_4925()));
            sendNotification(AssetNotifications.ADD_UNLOAD_FINISHER,param1);
         });
      }
      
      public function method_1080(param1:Vector.<AtlasResourceVO>) : class_1199
      {
         var _loc4_:* = null;
         var _loc2_:MacroLoadPromise = new MacroLoadPromise(param1.length);
         var _loc3_:uint = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = param1[_loc5_];
            this.getTextureResource(_loc4_.textureResource,_loc4_.atlasResources).ready.addOnce(_loc2_.atlasLoaded);
            _loc5_++;
         }
         return _loc2_.ready;
      }
   }
}

import package_19.class_1199;

class MacroLoadPromise
{
    
   
   private var _ready:class_1199;
   
   private var _callCounts:uint;
   
   private var _callCountsTotal:uint;
   
   function MacroLoadPromise(param1:uint)
   {
      this._ready = new class_1199();
      super();
      this._callCountsTotal = param1;
   }
   
   public function get ready() : class_1199
   {
      return this._ready;
   }
   
   private function notify() : void
   {
      this._ready.dispatch();
   }
   
   public function atlasLoaded() : void
   {
      ++this._callCounts;
      this.check();
   }
   
   private function check() : void
   {
      if(this._callCounts == this._callCountsTotal)
      {
         this.notify();
      }
   }
}
