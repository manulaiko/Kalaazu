package package_3
{
   import mx.core.IFlexModuleFactory;
   import package_151.class_1511;
   import package_92.class_996;
   
   public class class_2290 extends class_2289
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_2290()
      {
         super();
         mx_internal::_document = this;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:class_1511 = param1 as class_1511;
         if(_loc2_)
         {
            _text = _loc2_.method_4954;
            _color = class_996.const_187;
         }
      }
   }
}
