package net.bigpoint.darkorbit.fui.system.modules
{
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
   
   public class UISetupModule implements IUISetupModule
   {
       
      
      private var _initialized:Boolean = false;
      
      private var _uiTemplateStructure:Object;
      
      private var _skinStructure:Object;
      
      private var _textStylesStructure:Object;
      
      private var _uiStructure:Object;
      
      public function UISetupModule()
      {
         super();
      }
      
      public final function setUp() : void
      {
         if(!this.isInitialized())
         {
            this.registerTextStyles();
            this.registerSkins();
            this.prepareViewsTemplates();
            this._initialized = true;
         }
      }
      
      public function isInitialized() : Boolean
      {
         return this._initialized;
      }
      
      protected function registerTextStyles() : void
      {
         if(this._textStylesStructure)
         {
            UISystem.getInstance().build(this._textStylesStructure);
         }
      }
      
      protected function registerSkins() : void
      {
         if(this._skinStructure)
         {
            UISystem.getInstance().build(this._skinStructure);
         }
      }
      
      protected function prepareViewsTemplates() : void
      {
         if(this._uiTemplateStructure)
         {
            UISystem.getInstance().build(this._uiTemplateStructure);
         }
      }
      
      protected final function registerTextStyle(param1:TextStyleVO) : void
      {
         TextStyleRepository.getInstance().register(param1);
      }
      
      public function set templatesStructure(param1:Object) : void
      {
         this._uiTemplateStructure = param1;
      }
      
      public function set skinsStructure(param1:Object) : void
      {
         this._skinStructure = param1;
      }
      
      public function set textStylesStructure(param1:Object) : void
      {
         this._textStylesStructure = param1;
      }
      
      public function set uiStructure(param1:Object) : void
      {
         this._uiStructure = param1;
      }
      
      public function get uiStructure() : Object
      {
         return this._uiStructure;
      }
   }
}
