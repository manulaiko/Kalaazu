package package_118
{
   import flash.utils.Dictionary;
   
   public class class_325 extends ContentElement
   {
      
      private static const const_200:RegExp = /\w+(?:\.\w+)*/;
      
      public static const const_2870:RegExp = /-?\d/;
      
      private static const const_3315:RegExp = /\{\$?undefined(?:\|(?:undefined|undefined|\{undefined\})+)*\}/;
      
      private static const const_1474:RegExp = /(undefined)/g;
      
      private static const const_2782:String = "|";
      
      private static const const_370:String = "$";
      
      private static const const_1153:String = "Number";
      
      private static const const_1692:String = "DateTime";
      
      private static const const_1252:String = "Price";
      
      private static const const_1078:String = "Timespan";
       
      
      private var _name:String;
      
      public function class_325()
      {
         super();
      }
      
      public static function method_4014(param1:*) : *
      {
         var _loc2_:* = null;
         if(param1 is int || param1 is class_325)
         {
            return param1;
         }
         if(param1 is String)
         {
            _loc2_ = param1 as String;
            if(const_2870.test(param1))
            {
               return param1;
            }
            return class_325.method_6498(_loc2_);
         }
      }
      
      public static function method_1118(param1:*, param2:Dictionary) : int
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         if(param1 is class_325)
         {
            _loc4_ = param1 as class_325;
            _loc3_ = int(_loc4_.getText(param2));
         }
         else if(param1 is String || param1 is uint || param1 is Number)
         {
            _loc3_ = int(param1);
         }
         else
         {
            if(!(param1 is int))
            {
               throw new Error("Could not retrieve integer parameter " + param1 + ".");
            }
            _loc3_ = param1;
         }
         return _loc3_;
      }
      
      public static function method_3649(param1:String) : Array
      {
         return param1.split(const_1474);
      }
      
      public static function method_2772(param1:String) : Boolean
      {
         return Boolean(const_3315.test(param1));
      }
      
      public static function method_6498(param1:String) : class_325
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc2_:String = param1;
         if(method_2772(_loc2_))
         {
            _loc2_ = _loc2_.substring(1,_loc2_.length - 1);
         }
         var _loc3_:Array = _loc2_.split(const_2782);
         var _loc4_:String;
         var _loc5_:* = (_loc4_ = _loc3_[0] as String).charAt(0) == const_370;
         if((_loc4_ = _loc3_[0] as String).charAt(0) == const_370)
         {
            _loc7_ = _loc3_[1];
            switch(_loc7_)
            {
               case const_1153:
                  (_loc9_ = new class_326()).name = _loc4_;
                  if(_loc3_.length > 2)
                  {
                     _loc9_.precision = _loc3_[2];
                  }
                  return _loc9_;
               case const_1692:
                  (_loc12_ = new class_1188()).name = _loc4_;
                  _loc12_.format = _loc3_[2];
                  return _loc12_;
               case const_1252:
                  (_loc11_ = new class_1189()).name = _loc4_;
                  _loc11_.format = _loc3_[2];
                  return _loc11_;
               case const_1078:
                  (_loc10_ = new class_1187()).name = _loc4_;
                  _loc10_.format = _loc3_[2];
                  if(_loc3_.length > 3)
                  {
                     _loc10_.method_5143 = _loc3_[3];
                  }
                  return _loc10_;
               default:
                  (_loc8_ = new class_325()).name = _loc4_;
                  return _loc8_;
            }
         }
         else
         {
            if(class_1183.method_3504(_loc4_))
            {
               (_loc13_ = new class_1183()).name = _loc4_;
               return _loc13_;
            }
            var _loc6_:class_1185;
            (_loc6_ = new class_1185()).name = _loc4_;
            _loc6_.reference = _loc4_;
            _loc6_.quantity = _loc3_[1];
            return _loc6_;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function link() : void
      {
      }
      
      override public function getText(param1:Dictionary) : String
      {
         return param1[this._name];
      }
   }
}
