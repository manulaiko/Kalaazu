package net.bigpoint.darkorbit.map.model.traits
{
   import package_10.class_1173;
   import package_19.class_70;
   import package_29.class_267;
   
   public class class_306 extends class_267
   {
       
      
      public const const_820:class_70 = new class_70(String);
      
      public const state:class_1173 = new class_1173("");
      
      public var debug:Boolean = false;
      
      private var _descriptor:XML;
      
      private var var_390:Vector.<Object>;
      
      private var var_3647:Number;
      
      public function class_306(param1:XML)
      {
         this.var_390 = new Vector.<Object>();
         super();
         this._descriptor = param1;
         this.var_3647 = this._descriptor.display3D.length() > 0 ? Number(this._descriptor.display3D[0].@visualSize) || true : 1;
      }
      
      public static function method_2989(param1:XML, param2:Boolean = true) : class_306
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.display2D.length() > 0 || param1.display3D.length() > 0)
         {
            _loc3_ = new class_306(param1);
            if(param2)
            {
               for each(_loc4_ in param1.decorator)
               {
                  _loc3_.var_390.push({
                     "id":String(_loc4_.@type),
                     "xml":_loc4_
                  });
               }
            }
         }
         return _loc3_;
      }
      
      public function get descriptor() : XML
      {
         return this._descriptor;
      }
      
      public function get decorators() : Vector.<Object>
      {
         return this.var_390;
      }
      
      public function method_6420(param1:String) : void
      {
         this.const_820.dispatch(param1);
      }
      
      public function get method_4449() : Number
      {
         return this.var_3647;
      }
   }
}
