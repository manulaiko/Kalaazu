package net.bigpoint.darkorbit.mvc.gui.featuresMenu
{
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   
   public class FeaturesMenuConstants
   {
      
      public static const MENU_ID:String = "featuresMenu";
      
      public static const GAME_FEATURE_BAR:String = "gameFeaturesBar";
      
      public static const GENERIC_FEATURE_BAR:String = "genericFeaturesBar";
      
      public static const NOT_ASSIGNED:String = "notAssigned";
      
      public static const FEATURES_MENU_LIB:String = "featuresMenu";
      
      public static const ICONS_ATLAS_XML:String = "featuresMenu_atlasXml";
      
      public static const ICONS_TEXTURE:String = "featuresMenu_texture";
      
      public static const ICONS_BITMAP_ATLAS:String = "featuresMenuBitmapAtlas";
      
      public static const MENUS_ID_MAP:Object = {
         "0":NOT_ASSIGNED,
         "1":GAME_FEATURE_BAR,
         "2":GENERIC_FEATURE_BAR
      };
      
      public static const MENU_TOP_MARGIN:Number = -1;
      
      public static const MENU_LEFT_MARGIN:Number = -1;
      
      public static const MENU_RIGHT_MARGIN:Number = 2;
      
      public static const LOGOUT:String = "logout";
      
      public static const SETTINGS:String = "settings";
      
      public static const FULLSCREEN:String = "fullscreen";
      
      public static const SHOP:String = "shop";
      
      public static const HELP:String = "help";
      
      public static const SPECIAL_WINDOWS:Vector.<String> = new <String>[GuiConstants.SHIP_WARP_WINDOW];
       
      
      public function FeaturesMenuConstants()
      {
         super();
      }
   }
}
