package mx.formatters
{
   import mx.core.mx_internal;
   
   public class NumberBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var decimalSeparatorFrom:String;
      
      public var decimalSeparatorTo:String;
      
      public var isValid:Boolean = false;
      
      public var thousandsSeparatorFrom:String;
      
      public var thousandsSeparatorTo:String;
      
      public function NumberBase(param1:String = ".", param2:String = ",", param3:String = ".", param4:String = ",")
      {
         super();
         this.decimalSeparatorFrom = param1;
         this.thousandsSeparatorFrom = param2;
         this.decimalSeparatorTo = param3;
         this.thousandsSeparatorTo = param4;
         this.isValid = true;
      }
      
      public function formatRounding(param1:String, param2:String) : String
      {
         var _loc3_:Number = Number(param1);
         if(param2 != NumberBaseRoundType.NONE)
         {
            if(param2 == NumberBaseRoundType.UP)
            {
               _loc3_ = Math.ceil(_loc3_);
            }
            else if(param2 == NumberBaseRoundType.DOWN)
            {
               _loc3_ = Math.floor(_loc3_);
            }
            else
            {
               if(param2 != NumberBaseRoundType.NEAREST)
               {
                  this.isValid = false;
                  return "";
               }
               _loc3_ = Math.round(_loc3_);
            }
         }
         return _loc3_.toString();
      }
      
      public function formatRoundingWithPrecision(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:Number = Number(param1);
         if(param2 == NumberBaseRoundType.NONE)
         {
            if(param3 == -1)
            {
               return _loc4_.toString();
            }
         }
         else
         {
            if(param3 < 0)
            {
               param3 = 0;
            }
            _loc4_ *= Math.pow(10,param3);
            _loc4_ = Number(_loc4_.toString());
            if(param2 == NumberBaseRoundType.UP)
            {
               _loc4_ = Math.ceil(_loc4_);
            }
            else if(param2 == NumberBaseRoundType.DOWN)
            {
               _loc4_ = Math.floor(_loc4_);
            }
            else
            {
               if(param2 != NumberBaseRoundType.NEAREST)
               {
                  this.isValid = false;
                  return "";
               }
               _loc4_ = Math.round(_loc4_);
            }
            _loc4_ /= Math.pow(10,param3);
         }
         return _loc4_.toString();
      }
      
      public function formatDecimal(param1:String) : String
      {
         var _loc2_:Array = param1.split(".");
         return _loc2_.join(this.decimalSeparatorTo);
      }
      
      public function formatThousands(param1:String) : String
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc2_:Number = Number(param1);
         var _loc3_:* = _loc2_ < 0;
         var _loc4_:String;
         (_loc4_ = Math.abs(_loc2_).toString()).toLowerCase();
         var _loc5_:int;
         if((_loc5_ = _loc4_.indexOf("e")) != -1)
         {
            _loc4_ = this.expandExponents(_loc4_);
         }
         var _loc6_:Array = _loc4_.split(_loc4_.indexOf(this.decimalSeparatorTo) != -1 ? this.decimalSeparatorTo : ".");
         var _loc7_:int;
         if((_loc7_ = int(String(_loc6_[0]).length)) > 3)
         {
            _loc8_ = int(Math.floor(_loc7_ / 3));
            if(_loc7_ % 3 == 0)
            {
               _loc8_--;
            }
            _loc10_ = (_loc9_ = _loc7_) - 3;
            _loc11_ = [];
            _loc12_ = 0;
            while(_loc12_ <= _loc8_)
            {
               _loc11_[_loc12_] = _loc6_[0].slice(_loc10_,_loc9_);
               _loc10_ = int(Math.max(_loc10_ - 3,0));
               _loc9_ = int(Math.max(_loc9_ - 3,1));
               _loc12_++;
            }
            _loc11_.reverse();
            _loc6_[0] = _loc11_.join(this.thousandsSeparatorTo);
         }
         _loc4_ = _loc6_.join(this.decimalSeparatorTo);
         if(_loc3_)
         {
            _loc4_ = "-" + _loc4_;
         }
         return _loc4_.toString();
      }
      
      public function formatPrecision(param1:String, param2:int) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param2 == -1)
         {
            return param1;
         }
         var _loc3_:Array = param1.split(this.decimalSeparatorTo);
         _loc3_[0] = _loc3_[0].length == 0 ? "0" : _loc3_[0];
         if(param2 > 0)
         {
            _loc5_ = (_loc4_ = !!_loc3_[1] ? String(_loc3_[1]) : "") + "000000000000000000000000000000000";
            param1 = _loc3_[0] + this.decimalSeparatorTo + _loc5_.substr(0,param2);
         }
         else
         {
            param1 = String(_loc3_[0]);
         }
         return param1.toString();
      }
      
      public function formatNegative(param1:String, param2:Boolean) : String
      {
         if(param2)
         {
            if(param1.charAt(0) != "-")
            {
               param1 = "-" + param1;
            }
         }
         else
         {
            if(param2)
            {
               this.isValid = false;
               return "";
            }
            if(param1.charAt(0) == "-")
            {
               param1 = param1.substr(1,param1.length - 1);
            }
            param1 = "(" + param1 + ")";
         }
         return param1;
      }
      
      public function parseNumberString(param1:String) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc2_:Array = param1.split(this.decimalSeparatorFrom);
         if(_loc2_.length > 2)
         {
            return null;
         }
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         var _loc7_:Boolean = false;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.charAt(_loc4_);
            _loc4_++;
            if("0" <= _loc5_ && _loc5_ <= "9" || _loc5_ == this.decimalSeparatorFrom)
            {
               if((_loc8_ = param1.charAt(_loc4_ - 2)) == "-" || param1.charAt(0) == "-")
               {
                  _loc7_ = true;
               }
               _loc6_ = "";
               _loc9_ = --_loc4_;
               while(_loc9_ < _loc3_)
               {
                  _loc5_ = param1.charAt(_loc4_);
                  _loc4_++;
                  if("0" <= _loc5_ && _loc5_ <= "9")
                  {
                     _loc6_ += _loc5_;
                  }
                  else if(_loc5_ == this.decimalSeparatorFrom)
                  {
                     _loc6_ += ".";
                  }
                  else if(_loc5_ != this.thousandsSeparatorFrom || _loc4_ >= _loc3_)
                  {
                     break;
                  }
                  _loc9_++;
               }
            }
         }
         if(_loc6_ != null && param1 != "")
         {
            if((_loc10_ = Number(_loc6_)) == 0)
            {
               return "0";
            }
         }
         if(_loc6_)
         {
            if(_loc6_.charAt(_loc6_.length - 1) == ".")
            {
               if(_loc6_.length >= 2)
               {
                  _loc6_ = _loc6_.substring(0,_loc6_.length - 1);
               }
               else if(_loc6_.length == 1)
               {
                  _loc6_ = "";
                  _loc7_ = false;
               }
            }
         }
         return _loc7_ ? "-" + _loc6_ : _loc6_;
      }
      
      public function expandExponents(param1:String) : String
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:RegExp = /^([+-])?(\d+).?(\d*)[eE]([-+]?\d+)$/;
         var _loc3_:Array = _loc2_.exec(param1);
         var _loc4_:String = _loc3_[1];
         var _loc5_:String = _loc3_[2];
         var _loc6_:String = _loc3_[3];
         var _loc7_:int;
         if(!(_loc7_ = int(_loc3_[4])))
         {
            return (!!_loc4_ ? _loc4_ : "") + (!!_loc5_ ? _loc5_ : "0") + (!!_loc6_ ? "." + _loc6_ : "");
         }
         var _loc8_:String = _loc5_ + _loc6_;
         var _loc9_:* = _loc7_ < 0;
         if(_loc7_ < 0)
         {
            _loc10_ = -1 * (_loc5_.length + _loc7_) + 1;
            return (!!_loc4_ ? _loc4_ : "") + "0." + new Array(_loc10_).join("0") + _loc8_;
         }
         if((_loc11_ = _loc7_ + _loc5_.length) >= _loc8_.length)
         {
            return (!!_loc4_ ? _loc4_ : "") + _loc8_ + new Array(_loc11_ - _loc8_.length + 1).join("0");
         }
         return (!!_loc4_ ? _loc4_ : "") + _loc8_.substr(0,_loc11_) + "." + _loc8_.substr(_loc11_);
      }
   }
}
