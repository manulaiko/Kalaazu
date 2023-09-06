package package_250
{
   import mx.core.IFlexModuleFactory;
   import mx.graphics.SolidColor;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class class_1539 extends SparkSkin
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1539()
      {
         super();
         mx_internal::_document = this;
         this.name = "CustomProgressBarTrackSkin";
         this.height = 3;
         this.mxmlContent = [this.method_2685()];
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
      
      private function method_2685() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 2;
         _loc1_.bottom = 1;
         _loc1_.height = 3;
         _loc1_.fill = this.method_1041();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function method_1041() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 1118481;
         return _loc1_;
      }
   }
}
