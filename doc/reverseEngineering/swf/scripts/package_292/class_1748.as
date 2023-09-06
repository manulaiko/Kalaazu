package package_292
{
   import away3d.library.AssetLibrary;
   import flash.net.URLRequest;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_19.class_1199;
   import package_199.LoaderEvent;
   import package_200.Settings3D;
   import package_304.class_2104;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_308.ExplosionMaterial;
   import package_366.class_2109;
   import package_367.class_2107;
   
   public class class_1748 extends class_1747
   {
      
      {
         AssetLibrary.method_605(class_2109);
         AssetLibrary.method_605(class_2106);
         AssetLibrary.method_605(class_2112);
      }
      
      public function class_1748()
      {
         super();
      }
      
      override public function reset(param1:uint) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in const_2355)
         {
            if(const_2355[_loc2_].lifetime <= param1)
            {
               const_2355[_loc2_] = null;
               delete const_2355[_loc2_];
            }
         }
         super.reset(param1);
      }
      
      public function method_1811(param1:String, param2:uint, param3:Boolean = true) : class_1199
      {
         var _loc4_:Object;
         if((_loc4_ = const_2355[param1]) == null || Boolean(Settings3D.const_2581.value))
         {
            const_2355[param1] = _loc4_ = {
               "loader":new class_2107(false),
               "promise":new class_1199(class_2104),
               "url":param1,
               "lifetime":param2
            };
            _loc4_.loader.load(new URLRequest(param1),param3 ? new class_2111(param2) : null);
            _loc4_.loader.addEventListener(LoaderEvent.const_2719,this.handleLoadComplete);
            _loc4_.loader.addEventListener(LoaderEvent.LOAD_ERROR,this.handleLoadError);
         }
         return _loc4_.promise;
      }
      
      private function handleLoadComplete(param1:LoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:class_2107 = param1.currentTarget as class_2107;
         for each(_loc3_ in const_2355)
         {
            if(_loc3_.loader == _loc2_)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc2_.numChildren)
               {
                  if(_loc4_ = _loc2_.getChildAt(_loc5_) as class_2104)
                  {
                     break;
                  }
                  _loc5_++;
               }
               if(_loc4_)
               {
                  this.method_4260(_loc4_);
                  class_1199(_loc3_.promise).dispatch(_loc4_);
               }
               return;
            }
         }
      }
      
      private function method_4260(param1:class_2104) : void
      {
         var _loc4_:* = null;
         var _loc2_:Array = param1.method_5430.lightPickerTargets as Array || true;
         var _loc3_:Boolean = _loc2_.length == 1 && _loc2_[0] == "package_1";
         for each(_loc4_ in param1.method_3953)
         {
            if(_loc4_.name.indexOf("shader_fireball") != -1 && _loc4_.material is class_1776)
            {
               _loc4_.material = new ExplosionMaterial(class_1776(_loc4_.material).texture);
            }
            if(_loc3_ || _loc2_.indexOf(_loc4_.name) != -1 || _loc4_.name.indexOf("light_") != -1)
            {
               _loc4_.material.lightPicker = class_1210.instance.name_10.method_5790;
            }
         }
      }
      
      private function handleLoadError(param1:LoaderEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in const_2355)
         {
            if(_loc2_.loader == param1.target)
            {
               class_1199(_loc2_.promise).dispatch(null);
               return;
            }
         }
      }
   }
}
