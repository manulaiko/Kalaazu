package package_60
{
   import mx.core.IFlexModuleFactory;
   import spark.components.SkinnableContainer;
   
   public class class_1027 extends SkinnableContainer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1027()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
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
   }
}
