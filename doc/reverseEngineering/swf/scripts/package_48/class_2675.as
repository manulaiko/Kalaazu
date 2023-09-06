package package_48
{
   import mx.core.IFlexModuleFactory;
   import package_488.class_2713;
   
   public class class_2675 extends class_2674
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_2675()
      {
         super();
         this.styleName = "filterOptionButton";
         this.percentWidth = 100;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.skinClass = class_2713;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
   }
}
