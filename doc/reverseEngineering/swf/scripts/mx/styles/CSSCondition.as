package mx.styles
{
   public class CSSCondition
   {
       
      
      private var _kind:String;
      
      private var _value:String;
      
      public function CSSCondition(param1:String, param2:String)
      {
         super();
         this._kind = param1;
         this._value = param2;
      }
      
      public function get kind() : String
      {
         return this._kind;
      }
      
      public function get specificity() : int
      {
         if(this.kind == CSSConditionKind.ID)
         {
            return 100;
         }
         if(this.kind == CSSConditionKind.CLASS)
         {
            return 10;
         }
         if(this.kind == CSSConditionKind.PSEUDO)
         {
            return 10;
         }
         return 0;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function matchesStyleClient(param1:IAdvancedStyleClient) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:Number = 0;
         var _loc2_:Boolean = false;
         if(this.kind == CSSConditionKind.CLASS)
         {
            if(param1.styleName != null && param1.styleName is String)
            {
               _loc3_ = param1.styleName.split(/\s+/);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == this.value)
                  {
                     _loc2_ = true;
                     break;
                  }
                  _loc4_++;
               }
            }
         }
         else if(this.kind == CSSConditionKind.ID)
         {
            if(param1.id == this.value)
            {
               _loc2_ = true;
            }
         }
         else if(this.kind == CSSConditionKind.PSEUDO)
         {
            if(param1.matchesCSSState(this.value))
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = null;
         if(this.kind == CSSConditionKind.CLASS)
         {
            _loc1_ = "." + this.value;
         }
         else if(this.kind == CSSConditionKind.ID)
         {
            _loc1_ = "#" + this.value;
         }
         else if(this.kind == CSSConditionKind.PSEUDO)
         {
            _loc1_ = ":" + this.value;
         }
         else
         {
            _loc1_ = "";
         }
         return _loc1_;
      }
   }
}
