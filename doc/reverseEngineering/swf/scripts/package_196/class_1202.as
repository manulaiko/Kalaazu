package package_196
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.common.class_1201;
   import package_287.class_1735;
   import package_287.class_1736;
   import package_287.class_1737;
   import package_287.class_1738;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_1202 extends class_1201
   {
       
      
      private const _map:Object = {};
      
      private var _view:class_87;
      
      private var _container:DisplayObjectContainer;
      
      public function class_1202(param1:class_87, param2:DisplayObjectContainer)
      {
         this._view = param1;
         this._container = param2;
         this._map[class_338.const_88] = class_1735;
         this._map[class_338.const_606] = class_1738;
         this._map[class_338.const_1460] = class_1736;
         this._map[class_338.const_3041] = class_1737;
         super();
      }
      
      override protected function method_3190(param1:Effect) : Object
      {
         var _loc3_:* = null;
         var _loc2_:Class = this._map[param1.id] as Class;
         if(_loc2_ != null)
         {
            _loc3_ = new _loc2_(this._view,param1) as DisplayObject;
            this._container.addChild(_loc3_);
         }
         return _loc3_;
      }
   }
}
