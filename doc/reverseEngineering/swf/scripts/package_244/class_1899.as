package package_244
{
   import mx.core.IFlexModuleFactory;
   import spark.components.SkinnableDataContainer;
   import spark.layouts.VerticalLayout;
   
   public class class_1899 extends SkinnableDataContainer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1899()
      {
         super();
         this.layout = this.method_1662();
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
      
      private function method_1662() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.useVirtualLayout = false;
         _loc1_.variableRowHeight = true;
         _loc1_.paddingTop = 0;
         _loc1_.paddingBottom = 0;
         return _loc1_;
      }
   }
}
