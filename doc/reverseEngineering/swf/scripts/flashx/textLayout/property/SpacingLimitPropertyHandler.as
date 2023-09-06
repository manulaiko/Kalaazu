package flashx.textLayout.property
{
   import flashx.textLayout.tlf_internal;
   
   public class SpacingLimitPropertyHandler extends PropertyHandler
   {
      
      private static const _spacingLimitPattern:RegExp = /\d+%/g;
      
      private static const _spacingLimitArrayPattern:RegExp = /^\s*(\d+%)(\s*,\s*)(\d+%)?(\s*,\s*)(\d+%)?\s*$/;
       
      
      private var _minPercentValue:String;
      
      private var _maxPercentValue:String;
      
      public function SpacingLimitPropertyHandler(param1:String, param2:String)
      {
         super();
         this._minPercentValue = param1;
         this._maxPercentValue = param2;
      }
      
      override public function get customXMLStringHandler() : Boolean
      {
         return true;
      }
      
      override public function toXMLString(param1:Object) : String
      {
         if(param1.hasOwnProperty("optimumSpacing") && param1.hasOwnProperty("minimumSpacing") && param1.hasOwnProperty("maximumSpacing"))
         {
            return param1.optimumSpacing.toString() + "," + param1.minimumSpacing.toString() + "," + param1.maximumSpacing.toString();
         }
         return param1.toString();
      }
      
      override public function owningHandlerCheck(param1:*) : *
      {
         if(param1 is String)
         {
            if(_spacingLimitArrayPattern.test(param1))
            {
               return param1;
            }
         }
         else if(Boolean(param1.hasOwnProperty("optimumSpacing")) && Boolean(param1.hasOwnProperty("minimumSpacing")) && Boolean(param1.hasOwnProperty("maximumSpacing")))
         {
            return param1;
         }
         return undefined;
      }
      
      private function checkValue(param1:*) : Boolean
      {
         var _loc2_:Number = Property.toNumberIfPercent(this._minPercentValue);
         var _loc3_:Number = Property.toNumberIfPercent(this._maxPercentValue);
         var _loc4_:Number;
         if((_loc4_ = Property.toNumberIfPercent(param1.optimumSpacing)) < _loc2_ || _loc4_ > _loc3_)
         {
            return false;
         }
         var _loc5_:Number;
         if((_loc5_ = Property.toNumberIfPercent(param1.minimumSpacing)) < _loc2_ || _loc5_ > _loc3_)
         {
            return false;
         }
         var _loc6_:Number;
         if((_loc6_ = Property.toNumberIfPercent(param1.maximumSpacing)) < _loc2_ || _loc6_ > _loc3_)
         {
            return false;
         }
         if(_loc4_ < _loc5_ || _loc4_ > _loc6_)
         {
            return false;
         }
         if(_loc5_ > _loc6_)
         {
            return false;
         }
         return true;
      }
      
      override public function setHelper(param1:*) : *
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:String = param1 as String;
         if(_loc2_ == null)
         {
            return param1;
         }
         if(_spacingLimitArrayPattern.test(param1))
         {
            _loc3_ = new Object();
            if((_loc4_ = _loc2_.match(_spacingLimitPattern)).length == 1)
            {
               _loc3_.optimumSpacing = _loc4_[0];
               _loc3_.minimumSpacing = _loc3_.optimumSpacing;
               _loc3_.maximumSpacing = _loc3_.optimumSpacing;
            }
            else
            {
               if(_loc4_.length != 3)
               {
                  return undefined;
               }
               _loc3_.optimumSpacing = _loc4_[0];
               _loc3_.minimumSpacing = _loc4_[1];
               _loc3_.maximumSpacing = _loc4_[2];
            }
            if(this.checkValue(_loc3_))
            {
               return _loc3_;
            }
         }
         return undefined;
      }
   }
}
