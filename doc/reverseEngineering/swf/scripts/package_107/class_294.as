package package_107
{
   public class class_294
   {
      
      private static const EMPTY:String = "";
      
      private static const const_379:int = -1;
      
      private static const WHITE:uint = 32;
      
      private static const const_2264:uint = 8192;
       
      
      public function class_294()
      {
         super();
      }
      
      public static function method_3278(param1:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return param1.match(/[A-Z]/g).join("").toLowerCase();
      }
      
      public static function method_2745(param1:String) : String
      {
         return method_5223(param1,"(\r\n|\r|\n)");
      }
      
      public static function method_5223(param1:String, param2:String) : String
      {
         if(Boolean(isEmpty(param1)) || param2 == null)
         {
            return param1;
         }
         return param1.replace(new RegExp(param2 + "$",""),"");
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return param1.replace(/^\s*/,"").replace(/\s*$/,"");
      }
      
      public static function method_3820(param1:String) : String
      {
         return method_236(param1,/\t|\r|\n|\b/g);
      }
      
      public static function method_3775(param1:String) : String
      {
         return method_236(param1,/\s/g);
      }
      
      private static function method_236(param1:String, param2:RegExp) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return param1.replace(param2,"");
      }
      
      public static function left(param1:String, param2:int) : String
      {
         if(param1 == null)
         {
            return null;
         }
         if(param2 < 0)
         {
            return EMPTY;
         }
         if(param1.length <= param2)
         {
            return param1;
         }
         return param1.substring(0,param2);
      }
      
      public static function center(param1:String, param2:int, param3:String) : String
      {
         if(param1 == null || param2 <= 0)
         {
            return param1;
         }
         if(isEmpty(param3))
         {
            param3 = " ";
         }
         var _loc4_:int = param1.length;
         var _loc5_:int;
         if((_loc5_ = param2 - _loc4_) <= 0)
         {
            return param1;
         }
         param1 = method_6066(param1,_loc4_ + _loc5_ / 2,param3);
         return method_811(param1,param2,param3);
      }
      
      public static function method_6066(param1:String, param2:int, param3:String) : String
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(isEmpty(param3))
         {
            param3 = " ";
         }
         var _loc4_:int = param3.length;
         var _loc5_:int = param1.length;
         var _loc6_:int;
         if((_loc6_ = param2 - _loc5_) <= 0)
         {
            return param1;
         }
         if(_loc4_ == 1 && _loc6_ <= const_2264)
         {
            return method_5127(param1,param2,param3.charAt(0));
         }
         if(_loc6_ == _loc4_)
         {
            return param3.concat(param1);
         }
         if(_loc6_ < _loc4_)
         {
            return param3.substring(0,_loc6_).concat(param1);
         }
         _loc7_ = [];
         _loc8_ = param3.split("");
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc7_[_loc9_] = _loc8_[_loc9_ % _loc4_];
            _loc9_++;
         }
         return _loc7_.join("").concat(param1);
      }
      
      public static function method_5127(param1:String, param2:int, param3:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:int;
         if((_loc4_ = param2 - param1.length) <= 0)
         {
            return param1;
         }
         if(_loc4_ > const_2264)
         {
            return method_6066(param1,param2,param3);
         }
         return padding(_loc4_,param3).concat(param1);
      }
      
      public static function method_811(param1:String, param2:int, param3:String) : String
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(isEmpty(param3))
         {
            param3 = " ";
         }
         var _loc4_:int = param3.length;
         var _loc5_:int = param1.length;
         var _loc6_:int;
         if((_loc6_ = param2 - _loc5_) <= 0)
         {
            return param1;
         }
         if(_loc4_ == 1 && _loc6_ <= const_2264)
         {
            return method_2746(param1,param2,param3.charAt(0));
         }
         if(_loc6_ == _loc4_)
         {
            return param1.concat(param3);
         }
         if(_loc6_ < _loc4_)
         {
            return param1.concat(param3.substring(0,_loc6_));
         }
         _loc7_ = [];
         _loc8_ = param3.split("");
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc7_[_loc9_] = _loc8_[_loc9_ % _loc4_];
            _loc9_++;
         }
         return param1.concat(_loc7_.join(""));
      }
      
      public static function method_2746(param1:String, param2:int, param3:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:int;
         if((_loc4_ = param2 - param1.length) <= 0)
         {
            return param1;
         }
         if(_loc4_ > const_2264)
         {
            return method_811(param1,param2,param3);
         }
         return param1.concat(padding(_loc4_,param3));
      }
      
      private static function padding(param1:int, param2:String) : String
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_ += param2;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         if(param1 == null || Boolean(isEmpty(param2)) || param3 == null)
         {
            return param1;
         }
         return param1.replace(new RegExp(param2,"g"),param3);
      }
      
      public static function method_997(param1:String, param2:String, param3:String, param4:int) : String
      {
         if(param1 == null || Boolean(isEmpty(param2)) || param3 == null || param4 == 0)
         {
            return param1;
         }
         var _loc5_:String = "";
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while((_loc7_ = param1.indexOf(param2,_loc6_)) != -1)
         {
            _loc5_ += param1.substring(_loc6_,_loc7_) + param3;
            _loc6_ = _loc7_ + param2.length;
            if(--param4 == 0)
            {
               break;
            }
         }
         var _loc8_:* = _loc5_ + param1.substring(_loc6_);
         _loc5_ += param1.substring(_loc6_);
         return _loc8_;
      }
      
      public static function method_5459(param1:String, param2:String, param3:String) : String
      {
         if(param1 == null || Boolean(isEmpty(param2)) || param3 == null)
         {
            return param1;
         }
         return param1.replace(new RegExp(param2,""),param3);
      }
      
      public static function method_705(param1:String, param2:String) : String
      {
         return !!isEmpty(param1) ? param2 : param1;
      }
      
      public static function isEmpty(param1:String) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         return param1.length == 0;
      }
      
      public static function method_5523(param1:String) : Boolean
      {
         return !isEmpty(param1);
      }
      
      public static function method_539(param1:String) : Boolean
      {
         return isEmpty(method_4570(param1));
      }
      
      public static function method_2934(param1:String) : Boolean
      {
         return !method_539(param1);
      }
      
      public static function method_6382(param1:String) : String
      {
         var _loc2_:String = trim(param1);
         return !!isEmpty(_loc2_) ? null : _loc2_;
      }
      
      public static function method_4570(param1:String) : String
      {
         return param1 == null ? EMPTY : trim(param1);
      }
      
      public static function method_4180(param1:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return param1.charAt(0).toUpperCase() + param1.substring(1);
      }
      
      public static function method_3905(param1:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return param1.charAt(0).toLowerCase() + param1.substring(1);
      }
      
      public static function method_3970(param1:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         var _loc2_:Array = param1.toLowerCase().split(" ");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_] = method_4180(_loc2_[_loc3_]);
            _loc3_++;
         }
         return _loc2_.join(" ");
      }
      
      public static function method_1629(param1:String, param2:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         if(param2 == null)
         {
            return EMPTY;
         }
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ == const_379)
         {
            return EMPTY;
         }
         return param1.substring(_loc3_ + param2.length);
      }
      
      public static function method_4026(param1:String, param2:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         if(isEmpty(param2))
         {
            return EMPTY;
         }
         var _loc3_:int = param1.lastIndexOf(param2);
         if(_loc3_ == const_379 || _loc3_ == param1.length - param2.length)
         {
            return EMPTY;
         }
         return param1.substring(_loc3_ + param2.length);
      }
      
      public static function method_1261(param1:String, param2:String) : String
      {
         if(Boolean(isEmpty(param1)) || param2 == null)
         {
            return param1;
         }
         if(param2.length == 0)
         {
            return EMPTY;
         }
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ == const_379)
         {
            return param1;
         }
         return param1.substring(0,_loc3_);
      }
      
      public static function method_50(param1:String, param2:String) : String
      {
         if(Boolean(isEmpty(param1)) || Boolean(isEmpty(param2)))
         {
            return param1;
         }
         var _loc3_:int = param1.lastIndexOf(param2);
         if(_loc3_ == const_379)
         {
            return param1;
         }
         return param1.substring(0,_loc3_);
      }
      
      public static function method_4781(param1:String, param2:String, param3:String) : String
      {
         var _loc5_:int = 0;
         if(param1 == null || param2 == null || param3 == null)
         {
            return null;
         }
         var _loc4_:int;
         if((_loc4_ = param1.indexOf(param2)) != const_379)
         {
            if((_loc5_ = param1.indexOf(param3,_loc4_ + param2.length)) != const_379)
            {
               return param1.substring(_loc4_ + param2.length,_loc5_);
            }
         }
         return null;
      }
      
      public static function method_4452(param1:String, param2:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return method_5541(method_3422(param1,param2),param2);
      }
      
      public static function method_3422(param1:String, param2:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         var _loc3_:RegExp = new RegExp("^[" + (param2 != null ? param2 : " ") + "]*","");
         return param1.replace(_loc3_,"");
      }
      
      public static function method_5541(param1:String, param2:String) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         var _loc3_:RegExp = new RegExp("[" + (param2 != null ? param2 : " ") + "]*$","");
         return param1.replace(_loc3_,"");
      }
      
      public static function method_935(param1:String, param2:int, param3:int) : String
      {
         if(param1 == null)
         {
            return param1;
         }
         if(param3 < 4)
         {
            throw new class_1151("Minimum abbreviation width is 4");
         }
         if(param1.length <= param3)
         {
            return param1;
         }
         if(param2 > param1.length)
         {
            param2 = param1.length;
         }
         if(param1.length - param2 < param3 - 3)
         {
            param2 = param1.length - (param3 - 3);
         }
         if(param2 <= 4)
         {
            return param1.substring(0,param3 - 3) + "...";
         }
         if(param3 < 7)
         {
            throw new class_1151("Minimum abbreviation width with offset is 7");
         }
         if(param2 + (param3 - 3) < param1.length)
         {
            return "..." + method_935(param1.substring(param2),0,param3 - 3);
         }
         return "..." + param1.substring(param1.length - (param3 - 3));
      }
      
      public static function method_3389(param1:String, param2:String, param3:int) : int
      {
         if(param1 == null || param2 == null || param3 <= 0)
         {
            return const_379;
         }
         if(param2.length == 0)
         {
            return 0;
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(const_379);
         while((_loc5_ = param1.indexOf(param2,_loc5_ + 1)) >= 0)
         {
            _loc4_++;
            if(_loc4_ >= param3)
            {
               return _loc5_;
            }
         }
         return _loc5_;
      }
      
      public static function method_4719(param1:String, param2:String) : int
      {
         if(Boolean(isEmpty(param1)) || Boolean(isEmpty(param2)))
         {
            return 0;
         }
         return param1.match(new RegExp("(" + param2 + ")","g")).length;
      }
      
      public static function contains(param1:String, param2:String) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         return new RegExp("(" + param2 + ")","g").test(param1);
      }
      
      public static function method_4553(param1:String, param2:String) : Boolean
      {
         if(Boolean(isEmpty(param1)) || param2 == null)
         {
            return true;
         }
         return new RegExp("^[^" + param2 + "]*$","").test(param1);
      }
      
      public static function method_6105(param1:String, param2:String) : Boolean
      {
         if(param1 == null || Boolean(isEmpty(param2)))
         {
            return false;
         }
         if(param1.length == 0)
         {
            return true;
         }
         return new RegExp("^[" + param2 + "]*$","g").test(param1);
      }
      
      public static function method_4669(param1:String, param2:String) : int
      {
         if(Boolean(isEmpty(param1)) || Boolean(isEmpty(param2)))
         {
            return const_379;
         }
         return param1.search(new RegExp("[" + param2 + "]",""));
      }
      
      public static function method_394(param1:String, param2:String) : int
      {
         if(Boolean(isEmpty(param1)) || Boolean(isEmpty(param2)))
         {
            return const_379;
         }
         return param1.search(new RegExp("[^" + param2 + "]",""));
      }
      
      public static function difference(param1:String, param2:String) : String
      {
         if(param1 == null)
         {
            return param2;
         }
         if(param2 == null)
         {
            return param1;
         }
         var _loc3_:int = int(method_4791(param1,param2));
         if(_loc3_ == -1)
         {
            return EMPTY;
         }
         return param2.substring(_loc3_);
      }
      
      public static function method_4791(param1:String, param2:String) : int
      {
         var _loc3_:int = 0;
         if(param1 == param2)
         {
            return const_379;
         }
         if(Boolean(isEmpty(param1)) || Boolean(isEmpty(param2)))
         {
            return 0;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length && _loc3_ < param2.length)
         {
            if(param1.charAt(_loc3_) != param2.charAt(_loc3_))
            {
               break;
            }
            _loc3_++;
         }
         if(_loc3_ < param2.length || _loc3_ < param1.length)
         {
            return _loc3_;
         }
         return const_379;
      }
      
      public static function equals(param1:String, param2:String) : Boolean
      {
         return param1 === param2;
      }
      
      public static function method_3568(param1:String, param2:String) : Boolean
      {
         if(param1 == null && param2 == null)
         {
            return true;
         }
         if(param1 == null || param2 == null)
         {
            return false;
         }
         return equals(param1.toLowerCase(),param2.toLowerCase());
      }
      
      public static function method_5329(param1:String) : Boolean
      {
         return method_1596(param1,/^[a-zA-Z]*$/);
      }
      
      public static function method_2099(param1:String) : Boolean
      {
         return method_1596(param1,/^[a-zA-Z\s]*$/);
      }
      
      public static function method_528(param1:String) : Boolean
      {
         return method_1596(param1,/^[a-zA-Z0-9]*$/);
      }
      
      public static function method_6377(param1:String) : Boolean
      {
         return method_1596(param1,/^[a-zA-Z0-9\s]*$/);
      }
      
      public static function method_900(param1:String) : Boolean
      {
         return method_1596(param1,/^[0-9]*$/);
      }
      
      public static function method_4363(param1:String) : Boolean
      {
         return method_1596(param1,/^[0-9\s]*$/);
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         return method_1596(param1,/^[\s]*$/);
      }
      
      private static function method_1596(param1:String, param2:RegExp) : Boolean
      {
         return param1 != null && param2.test(param1);
      }
      
      public static function overlay(param1:String, param2:String, param3:int, param4:int) : String
      {
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param2 == null)
         {
            param2 = EMPTY;
         }
         var _loc5_:int = param1.length;
         if(param3 < 0)
         {
            param3 = 0;
         }
         if(param3 > _loc5_)
         {
            param3 = _loc5_;
         }
         if(param4 < 0)
         {
            param4 = 0;
         }
         if(param4 > _loc5_)
         {
            param4 = _loc5_;
         }
         if(param3 > param4)
         {
            _loc6_ = param3;
            param3 = param4;
            param4 = _loc6_;
         }
         return param1.substring(0,param3).concat(param2).concat(param1.substring(param4));
      }
      
      public static function remove(param1:String, param2:String) : String
      {
         return method_3920(param1,new RegExp(param2,"g"));
      }
      
      public static function method_6217(param1:String, param2:String) : String
      {
         return method_3920(param1,new RegExp(param2 + "$",""));
      }
      
      public static function method_3805(param1:String, param2:String) : String
      {
         return method_3920(param1,new RegExp("^" + param2,""));
      }
      
      private static function method_3920(param1:String, param2:RegExp) : String
      {
         if(isEmpty(param1))
         {
            return param1;
         }
         return param1.replace(param2,"");
      }
      
      public static function endsWith(param1:String, param2:String) : Boolean
      {
         return method_1596(param1,new RegExp(param2 + "$",""));
      }
      
      public static function method_1364(param1:String, param2:String) : Boolean
      {
         return method_1596(param1,new RegExp("^" + param2,""));
      }
      
      public static function method_1292(param1:String, param2:String) : int
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         return compareTo(param1.toLowerCase(),param2.toLowerCase());
      }
      
      public static function compareTo(param1:String, param2:String) : int
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         return param1.localeCompare(param2);
      }
      
      public static function method_565(param1:String, param2:*, param3:int) : String
      {
         if(param3 > param1.length)
         {
            param3 = param1.length;
         }
         var _loc4_:String = param1.substring(0,param3);
         var _loc5_:String = param1.substring(param3,param1.length);
         return _loc4_ + param2 + _loc5_;
      }
      
      public static function method_929(param1:String, param2:*, param3:int, param4:int) : String
      {
         param3 = Math.max(param3,0);
         param4 = Math.min(param4,param1.length);
         var _loc5_:String = param1.substr(0,param3);
         var _loc6_:String = param1.substr(param4,param1.length);
         return _loc5_ + param2 + _loc6_;
      }
      
      public static function method_6127(param1:String, param2:int, param3:int) : String
      {
         return class_294.method_929(param1,"",param2,param3);
      }
      
      public static function method_3981(param1:String) : String
      {
         return param1.replace(/\r\n/gm,"\n");
      }
      
      public static function method_4582(param1:String) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         return class_294.trim(param1).length > 0;
      }
      
      public static function method_2115(param1:String) : String
      {
         return method_4873(param1,"\n\t\n ");
      }
      
      public static function method_6018(param1:String) : String
      {
         return method_3050(param1,"\n\t\n ");
      }
      
      public static function method_4873(param1:String, param2:String) : String
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = param1.length;
         while(_loc3_ < _loc4_ && param2.indexOf(param1.charAt(_loc3_)) >= 0)
         {
            _loc3_++;
         }
         return _loc3_ > 0 ? param1.substr(_loc3_,_loc4_) : param1;
      }
      
      public static function method_3050(param1:String, param2:String) : String
      {
         var _loc4_:Number = param1.length - 1;
         while(0 < _loc4_ && param2.indexOf(param1.charAt(_loc4_)) >= 0)
         {
            _loc4_--;
         }
         return _loc4_ >= 0 ? param1.substr(0,_loc4_ + 1) : param1;
      }
      
      public static function method_3343(param1:String, param2:String) : String
      {
         if(param2.length != 1)
         {
            throw new class_1151("The Second Attribute char [" + param2 + "] must exactly one character.");
         }
         return method_4873(param1,param2);
      }
      
      public static function method_3171(param1:String, param2:String) : String
      {
         if(param2.length != 1)
         {
            throw new class_1151("The Second Attribute char [" + param2 + "] must exactly one character.");
         }
         return method_3050(param1,param2);
      }
      
      public static function method_1829(param1:String, param2:uint, param3:String, param4:Number = 0) : int
      {
         var _loc6_:int = 0;
         var _loc5_:int = param4;
         if(param2 >= 1)
         {
            _loc5_ = param1.indexOf(param3,_loc5_);
            _loc6_ = 1;
            while(_loc5_ != -1 && _loc6_ < param2)
            {
               _loc5_ = param1.indexOf(param3,_loc5_ + 1);
               _loc6_++;
            }
         }
         return _loc5_;
      }
      
      public static function method_2666(param1:String) : Boolean
      {
         return param1.charCodeAt(0) <= 32;
      }
      
      public static function method_2224(param1:String) : Boolean
      {
         var _loc2_:Number = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public static function method_5213(param1:String, param2:String) : int
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!param1)
         {
            param1 = "";
         }
         if(!param2)
         {
            param2 = "";
         }
         var _loc11_:Boolean = false;
         if(param1.toLocaleLowerCase() == param2.toLocaleLowerCase())
         {
            _loc11_ = true;
         }
         else
         {
            param1 = param1.toLowerCase();
            param2 = param2.toLowerCase();
         }
         while(true)
         {
            _loc5_ = _loc6_ = 0;
            _loc7_ = param1.charAt(_loc3_);
            _loc8_ = param2.charAt(_loc4_);
            while(Boolean(class_294.method_2666(_loc7_)) || _loc7_ == "0")
            {
               if(_loc7_ == "0")
               {
                  _loc5_++;
               }
               else
               {
                  _loc5_ = 0;
               }
               _loc7_ = param1.charAt(++_loc3_);
            }
            while(Boolean(class_294.method_2666(_loc8_)) || _loc8_ == "0")
            {
               if(_loc8_ == "0")
               {
                  _loc6_++;
               }
               else
               {
                  _loc6_ = 0;
               }
               _loc8_ = param2.charAt(++_loc4_);
            }
            if(Boolean(class_294.method_2224(_loc7_)) && Boolean(class_294.method_2224(_loc8_)))
            {
               if((_loc9_ = int(method_820(param1.substring(_loc3_),param2.substring(_loc4_)))) != 0)
               {
                  break;
               }
            }
            if(_loc7_.length == 0 && _loc8_.length == 0)
            {
               return _loc5_ - _loc6_;
            }
            if(_loc11_)
            {
               if(_loc7_ != _loc8_)
               {
                  if(_loc7_ < _loc8_)
                  {
                     return 1;
                  }
                  if(_loc7_ > _loc8_)
                  {
                     return -1;
                  }
               }
            }
            if(_loc7_ < _loc8_)
            {
               return -1;
            }
            if(_loc7_ > _loc8_)
            {
               return 1;
            }
            _loc3_++;
            _loc4_++;
         }
         return _loc9_;
      }
      
      private static function method_820(param1:String, param2:String) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(true)
         {
            _loc6_ = param1.charAt(_loc4_);
            _loc7_ = param2.charAt(_loc5_);
            if(!class_294.method_2224(_loc6_) && !class_294.method_2224(_loc7_))
            {
               break;
            }
            if(!class_294.method_2224(_loc6_))
            {
               return -1;
            }
            if(!class_294.method_2224(_loc7_))
            {
               return 1;
            }
            if(_loc6_ < _loc7_)
            {
               if(_loc3_ == 0)
               {
                  _loc3_ = -1;
               }
            }
            else if(_loc6_ > _loc7_)
            {
               if(_loc3_ == 0)
               {
                  _loc3_ = 1;
               }
            }
            else if(_loc6_.length == 0 && _loc7_.length == 0)
            {
               return _loc3_;
            }
            _loc4_++;
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function method_5894(param1:String, param2:String) : Array
      {
         var _loc8_:* = null;
         var _loc3_:* = [];
         var _loc4_:int = param1.length;
         var _loc6_:String = "";
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc8_ = param1.charAt(_loc7_);
            if(param2.indexOf(_loc8_) == -1)
            {
               _loc6_ += _loc8_;
            }
            else
            {
               _loc3_.push(_loc6_);
               _loc6_ = "";
            }
            if(_loc7_ == _loc4_ - 1)
            {
               _loc3_.push(_loc6_);
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc4_:* = null;
         var _loc6_:* = undefined;
         if(param1 == null)
         {
            return "";
         }
         var _loc3_:uint = uint(rest.length);
         if(_loc3_ == 1 && rest[0] is Array)
         {
            _loc3_ = (_loc4_ = rest[0] as Array).length;
         }
         else
         {
            _loc4_ = rest;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = _loc4_[_loc5_];
            param1 = param1.split("{" + _loc5_.toString() + "}").join(_loc6_ != null ? _loc6_.toString() : "[null]");
            _loc5_++;
         }
         return param1;
      }
   }
}
