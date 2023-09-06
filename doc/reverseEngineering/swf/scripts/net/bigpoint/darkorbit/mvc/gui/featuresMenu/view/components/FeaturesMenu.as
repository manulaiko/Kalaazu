package net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components
{
   import package_11.class_39;
   import package_141.class_1895;
   import package_141.class_2008;
   
   public class FeaturesMenu extends class_1895
   {
      
      private static const LINKAGE:String = "featuresMenu";
      
      private static const GAME_FEATURE_BAR:String = "gameFeatureBar";
      
      private static const GENERIC_FEATURE_BAR:String = "genericFeatureBar";
       
      
      public var gameFeatureBar:FeatureBar;
      
      public var genericFeatureBar:FeatureBar;
      
      public function FeaturesMenu(param1:class_39)
      {
         super(param1,this.symbolLinkage);
      }
      
      override public function decorate() : void
      {
         method_4210(this.gameFeatureBar = new FeatureBar(method_4492(GAME_FEATURE_BAR),class_2008.const_1254));
         method_4210(this.genericFeatureBar = new FeatureBar(method_4492(GENERIC_FEATURE_BAR),class_2008.const_2287));
         mouseEnabled = false;
      }
      
      override public function updateLayout() : void
      {
      }
      
      override public function get symbolLinkage() : String
      {
         return LINKAGE;
      }
   }
}
