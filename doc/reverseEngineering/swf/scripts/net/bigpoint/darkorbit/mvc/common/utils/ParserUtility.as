package net.bigpoint.darkorbit.mvc.common.utils
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.net.class_74;
   import package_22.FullResourcePattern;
   
   public class ParserUtility
   {
       
      
      public function ParserUtility()
      {
         super();
      }
      
      public static function parseBooleanFromInt(param1:int) : Boolean
      {
         return param1 == 0 ? false : true;
      }
      
      public static function parseBooleanFromString(param1:String) : Boolean
      {
         return param1 == "true" ? true : false;
      }
      
      public static function isBooleanString(param1:String) : Boolean
      {
         return param1 == "true" || param1 == "false";
      }
      
      public static function parseBooleanFromXmlAtribute(param1:String, param2:Boolean = false) : Boolean
      {
         if(param1.length > 0)
         {
            return param1 == "true" ? true : false;
         }
         return param2;
      }
      
      public static function parseStringFromXmlAtribute(param1:String) : String
      {
         if(param1.length > 0)
         {
            return param1;
         }
         return null;
      }
      
      public static function parseCommaCoordinatesList(param1:String) : Vector.<class_73>
      {
         var _loc2_:Array = param1.split(",");
         var _loc3_:Vector.<class_73> = new Vector.<class_73>();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_.push(new class_73(_loc2_[_loc4_],_loc2_[_loc4_ + 1]));
            _loc4_ += 2;
         }
         return _loc3_;
      }
      
      public static function parseFourCommaSeparatedValuesFromXmlAttribute(param1:String) : Rectangle
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1)
         {
            _loc3_ = param1.split(",");
            if(_loc3_.length == 4)
            {
               _loc2_ = new Rectangle(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
            }
         }
         return _loc2_;
      }
      
      public static function parsePointLite(param1:XML) : class_73
      {
         return new class_73(int(param1.attribute("_x")),int(param1.attribute("_y")));
      }
      
      public static function parsePointLiteNumbers(param1:XML) : class_73
      {
         return new class_73(Number(param1.attribute("_x")),Number(param1.attribute("_y")));
      }
      
      public static function removeCommaAtEnd(param1:String) : String
      {
         if(param1.length > 0)
         {
            if(param1.charAt(param1.length - 1) == ",")
            {
               return param1.substring(0,param1.length - 1);
            }
         }
         return param1;
      }
      
      public static function parseFullResourcePattern(param1:XML) : FullResourcePattern
      {
         return new FullResourcePattern(int(param1.attribute("id")),param1.attribute("srcKey").toString(),param1.attribute("resKey").toString(),param1.attribute("resKeyStarling").toString());
      }
      
      public static function parseStringCords(param1:String) : Vector.<class_73>
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:Vector.<class_73> = new Vector.<class_73>();
         var _loc3_:Array = param1.split(class_74.const_3147);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_.split(class_74.const_1012);
            _loc2_.push(new class_73(_loc5_[0],_loc5_[1]));
         }
         return _loc2_;
      }
   }
}
