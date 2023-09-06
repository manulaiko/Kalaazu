package net.bigpoint.as3toolbox.bplocale
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import package_117.class_320;
   import package_117.class_321;
   import package_117.class_322;
   import package_117.class_323;
   import package_118.class_324;
   import package_118.class_326;
   
   public class class_88
   {
      
      public static const const_2183:uint = 0;
      
      public static const const_1244:uint = 1;
      
      public static const const_311:uint = 2;
      
      private static var var_1692:String;
      
      private static var var_4882:Vector.<String> = new Vector.<String>();
      
      private static var var_715:URLLoader;
      
      private static var var_104:URLRequest;
      
      private static var var_1977:Dictionary = new Dictionary();
      
      private static var var_3547:EventDispatcher;
      
      private static var _parser:class_320 = new class_322();
      
      public static var var_3200:String = ",";
      
      public static var var_4795:String = ".";
      
      public static var var_2537:Vector.<int> = method_1782();
      
      public static var var_4049:Number;
      
      private static var var_229:uint = const_2183;
       
      
      public function class_88()
      {
         super();
      }
      
      private static function method_1782() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         _loc1_.push(3);
         return _loc1_;
      }
      
      public static function method_1619(param1:uint) : void
      {
         switch(param1)
         {
            case class_323.const_1323:
               _parser = new class_321();
               break;
            case class_323.const_2686:
               _parser = new class_322();
               break;
            default:
               throw new Error("Could not find a parser associated with the parameter \"" + param1 + "\"");
         }
      }
      
      public static function method_249(param1:class_320) : void
      {
         if(!param1)
         {
            throw new Error("IBPLocaleParser is null");
         }
         _parser = param1;
      }
      
      public static function get thousandsSeparator() : String
      {
         return var_3200;
      }
      
      public static function set thousandsSeparator(param1:String) : void
      {
         var_3200 = param1;
      }
      
      public static function get decimalMark() : String
      {
         return var_4795;
      }
      
      public static function set decimalMark(param1:String) : void
      {
         var_4795 = param1;
      }
      
      public static function get method_6168() : String
      {
         return var_1692;
      }
      
      public static function set method_6168(param1:String) : void
      {
         var_1692 = param1;
      }
      
      public static function get method_6172() : uint
      {
         return var_229;
      }
      
      public static function set method_6172(param1:uint) : void
      {
         var_229 = param1;
      }
      
      public static function method_3570(param1:Number, param2:uint = 0) : String
      {
         var _loc3_:class_326 = new class_326();
         _loc3_.precision = param2;
         _loc3_.name = "$number";
         return _loc3_.getText(method_5845("number",param1));
      }
      
      public static function load(... rest) : void
      {
         var _loc4_:* = null;
         var _loc2_:Array = rest.length == 1 && rest[0] is Array ? rest[0] : rest;
         var _loc3_:uint = _loc2_.length;
         var _loc5_:Number = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = _loc2_[_loc5_] as String) == null)
            {
               throw new Error("BPLocale: couldn\'t load XML localization file: " + _loc2_[_loc5_] + " is not a valid string Object.");
            }
            method_3870(_loc4_);
            _loc5_++;
         }
      }
      
      private static function method_3870(param1:String) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(var_4882[_loc3_] == param1)
            {
               dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_1717,param1));
               return;
            }
            _loc3_++;
         }
         var_4882.push(param1);
         if(var_715 == null)
         {
            method_4830();
         }
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(var_3547 == null)
         {
            var_3547 = new EventDispatcher();
         }
         var_3547.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(var_3547 == null)
         {
            return;
         }
         var_3547.removeEventListener(param1,param2,param3);
      }
      
      public static function dispatchEvent(param1:Event) : void
      {
         if(var_3547 == null)
         {
            var_3547 = new EventDispatcher();
         }
         var_3547.dispatchEvent(param1);
      }
      
      private static function method_4830() : void
      {
         if(var_715 != null)
         {
            var_715.removeEventListener(Event.COMPLETE,method_5262);
            var_715.removeEventListener(IOErrorEvent.IO_ERROR,method_2459);
            var_715 = null;
            var_104 = null;
         }
         if(true)
         {
            method_6521();
            dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_3138));
            return;
         }
         var _loc1_:String = var_4882.shift();
         var_715 = new URLLoader();
         var_715.addEventListener(Event.COMPLETE,method_5262);
         var_715.addEventListener(IOErrorEvent.IO_ERROR,method_2459);
         var_104 = new URLRequest(_loc1_);
         var_715.load(var_104);
      }
      
      private static function method_2459(param1:IOErrorEvent) : void
      {
         var_3547.dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_676,param1.text));
         method_4830();
      }
      
      private static function method_5262(param1:Event) : void
      {
         var _loc2_:XML = new XML((param1.target as URLLoader).data);
         if(_parser != null)
         {
            _parser.method_2367(_loc2_);
            dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_796,var_104.url));
            method_4830();
            return;
         }
         throw new Error("No IBPLocaleParser has been found. BPLocale.PARSER is null.");
      }
      
      public static function method_2268(param1:XML) : void
      {
         _parser.method_2367(param1);
         method_6521();
      }
      
      public static function method_1588(param1:String, param2:Dictionary) : void
      {
         var _loc3_:* = null;
         for(_loc3_ in param2)
         {
            method_1639(param1,_loc3_,param2[_loc3_]);
         }
      }
      
      public static function method_540(param1:Dictionary) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
            method_4884(_loc2_,param1[_loc2_]);
         }
      }
      
      public static function method_6521() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for(_loc3_ in var_1977)
         {
            _loc1_ = var_1977[_loc3_] as Dictionary;
            for(_loc4_ in _loc1_)
            {
               _loc2_ = _loc1_[_loc4_] as class_324;
               _loc2_.link();
            }
         }
      }
      
      public static function method_5845(... rest) : Dictionary
      {
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:uint = uint(rest.length);
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_ - 1)
         {
            _loc2_["$" + rest[_loc4_]] = rest[_loc4_ + 1];
            _loc4_ += 2;
         }
         return _loc2_;
      }
      
      public static function method_4884(param1:String, param2:String, param3:int = 0, param4:Boolean = true) : void
      {
         var _loc7_:* = null;
         var _loc5_:Array = param1.split(/\.(\w+$)/);
         var _loc6_:String = "";
         if(_loc5_.length > 1)
         {
            _loc6_ = _loc5_[0];
            _loc7_ = _loc5_[1];
         }
         else
         {
            _loc7_ = _loc5_[0];
         }
         method_1639(_loc6_,_loc7_,param2,param3,param4);
      }
      
      public static function method_1639(param1:String, param2:String, param3:String, param4:int = 0, param5:Boolean = true) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(var_1977.hasOwnProperty(param1))
         {
            _loc6_ = var_1977[param1];
         }
         else
         {
            _loc6_ = new Dictionary();
            var_1977[param1] = _loc6_;
         }
         if(_loc6_.hasOwnProperty(param2))
         {
            _loc7_ = _loc6_[param2] as class_324;
         }
         else
         {
            _loc7_ = new class_324(param2);
            _loc6_[param2] = _loc7_;
         }
         _loc7_.setContent(param3,param4,param5);
      }
      
      public static function getItem(param1:String, param2:Dictionary = null, param3:int = 0) : String
      {
         var _loc6_:* = null;
         var _loc4_:Array = param1.split(/\.(\w+$)/);
         var _loc5_:String = "";
         if(_loc4_.length > 1)
         {
            _loc5_ = _loc4_[0];
            _loc6_ = _loc4_[1];
         }
         else
         {
            _loc6_ = _loc4_[0];
         }
         return method_734(_loc5_,_loc6_,param2,param3);
      }
      
      public static function method_5982(param1:String) : class_324
      {
         var _loc2_:Array = param1.split(/\.(\w+$)/);
         if(_loc2_.length <= 1)
         {
            throw new Error(param1 + " is not a valid key to retrieve an item from a category. Category and item name need to be separated with a \'.\' character.");
         }
         return method_5602(_loc2_[0],_loc2_[1]);
      }
      
      public static function method_734(param1:String, param2:String, param3:Dictionary = null, param4:int = 0) : String
      {
         var _loc5_:class_324;
         return (_loc5_ = method_5602(param1,param2)) != null ? _loc5_.getContent(param3,param4) : "{" + param1 + (param1.length > 0 ? "." : "") + param2 + "}";
      }
      
      public static function method_5602(param1:String, param2:String) : class_324
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!var_1977.hasOwnProperty(param1))
         {
            switch(var_229)
            {
               case const_2183:
                  throw new Error("BPLocale Error: Cannot find category \'" + param1 + "\' while trying to retrieve item \'" + param2 + "\'.");
               case const_1244:
                  dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_778,"BPLocale could not find category \'" + param1 + "\' while trying to retrieve item \'" + param2 + "\'."));
            }
            return null;
         }
         _loc3_ = var_1977[param1];
         if(!_loc3_.hasOwnProperty(param2))
         {
            switch(var_229)
            {
               case const_2183:
                  throw new Error("BPLocale Error: Cannot find item \'" + param2 + "\' in category \'" + param1 + "\'.");
               case const_1244:
                  dispatchEvent(new BPLocaleEvent(BPLocaleEvent.const_2259,"BPLocale could not find item \'" + param2 + "\' in category \'" + param1 + "\'."));
            }
            return null;
         }
         return _loc3_[param2] as class_324;
      }
   }
}
