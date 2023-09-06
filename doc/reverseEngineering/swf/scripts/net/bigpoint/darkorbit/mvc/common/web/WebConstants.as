package net.bigpoint.darkorbit.mvc.common.web
{
   import flash.utils.Dictionary;
   import package_38.class_539;
   
   public class WebConstants
   {
      
      public static const TECH_FACTORY_ACTION:String = "internalNanoTechFactory";
      
      public static const TECH_FACTORY_TEXTKEY:String = "seo_tittle_techfactory";
      
      public static const WEB_URL_ACTIONS_MAP:Dictionary = new Dictionary();
      
      public static const WEB_URL_TEXTKEYS_MAP:Dictionary = new Dictionary();
      
      {
         WEB_URL_ACTIONS_MAP[class_539.TECH_FACTORY] = TECH_FACTORY_ACTION;
         WEB_URL_TEXTKEYS_MAP[class_539.TECH_FACTORY] = TECH_FACTORY_TEXTKEY;
      }
      
      public function WebConstants()
      {
         super();
      }
   }
}
