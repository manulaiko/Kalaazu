package net.bigpoint.darkorbit.mvc.common.utils
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import package_38.class_117;
   import package_38.class_357;
   import package_38.class_358;
   import package_38.class_359;
   import package_38.class_360;
   
   public class TextUtils
   {
       
      
      public function TextUtils()
      {
         super();
      }
      
      public static function getTooltipText(param1:class_358, param2:Boolean = false) : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(param1.var_2937.length)
         {
            _loc3_ = "";
            _loc4_ = int(param1.var_2937.length);
            _loc5_ = 0;
            while(_loc5_ != _loc4_)
            {
               if((_loc6_ = param1.var_2937[_loc5_]).baseKey)
               {
                  _loc7_ = getTranslationByType(_loc6_.baseKey,_loc6_.var_4872.var_2008) + (_loc5_ != _loc4_ - 1 ? "\n" : "");
                  for each(_loc8_ in _loc6_.var_4257)
                  {
                     _loc9_ = getTranslationByType(_loc8_.replacement,_loc8_.var_2283.var_2008);
                     _loc7_ = _loc7_.split(_loc8_.wildcard).join(_loc9_);
                  }
                  if(!param2)
                  {
                     _loc10_ = getLineColor(_loc6_.var_2445);
                     _loc7_ = "<font color=\'" + _loc10_ + "\'>" + _loc7_ + "</font>";
                  }
                  _loc3_ += _loc7_;
               }
               _loc5_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      private static function getLineColor(param1:int) : String
      {
         var _loc2_:Number = Number(ItemsControlMenuConstants.TOOLTIPS_STYLES_MAP[param1]);
         return "#" + _loc2_.toString(16);
      }
      
      public static function getTranslationByType(param1:String, param2:int = 0) : String
      {
         var _loc3_:String = "-";
         switch(param2)
         {
            case class_117.PLAIN:
               _loc3_ = param1;
               break;
            case class_117.const_2983:
               _loc3_ = class_88.method_734("items","items_" + param1 + "_code");
               break;
            case class_117.const_2693:
               _loc3_ = class_88.method_734("items","items_" + param1 + "_short");
               break;
            case class_117.const_1296:
               _loc3_ = class_88.method_734("items","items_" + param1 + "_fullname");
               break;
            case class_117.const_2401:
               _loc3_ = class_88.method_734("items","items_" + param1 + "_description");
               break;
            case class_117.const_270:
               _loc3_ = class_88.method_734("items","items_" + param1 + "_tooltip_description");
               break;
            case class_117.const_2307:
               _loc3_ = class_126.getInstance().var_1524[param1];
               break;
            case class_117.LOCALIZED:
               _loc3_ = class_88.getItem(param1);
         }
         return _loc3_;
      }
      
      public static function getTooltipTextByMessageLocalizedWildcardCommand(param1:class_359) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:String = getTranslationByType(param1.baseKey,param1.var_4872.var_2008);
         for each(_loc3_ in param1.var_4257)
         {
            _loc4_ = getTranslationByType(_loc3_.replacement,_loc3_.var_2283.var_2008);
            _loc2_ = _loc2_.split(_loc3_.wildcard).join(_loc4_);
         }
         return _loc2_;
      }
   }
}
