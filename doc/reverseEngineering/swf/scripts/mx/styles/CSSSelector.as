package mx.styles
{
   import mx.core.mx_internal;
   
   public class CSSSelector
   {
       
      
      private var _ancestor:CSSSelector;
      
      private var _conditions:Array;
      
      private var _subject:String;
      
      public function CSSSelector(param1:String, param2:Array = null, param3:CSSSelector = null)
      {
         super();
         this._subject = param1;
         this._conditions = param2;
         this._ancestor = param3;
      }
      
      public function get ancestor() : CSSSelector
      {
         return this._ancestor;
      }
      
      public function get conditions() : Array
      {
         return this._conditions;
      }
      
      public function get specificity() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if("package_1" != this.subject && "global" != this.subject && "" != this.subject)
         {
            _loc1_ = 1;
         }
         if(this.conditions != null)
         {
            for each(_loc2_ in this.conditions)
            {
               _loc1_ += _loc2_.specificity;
            }
         }
         if(this.ancestor != null)
         {
            _loc1_ += this.ancestor.specificity;
         }
         return _loc1_;
      }
      
      public function get subject() : String
      {
         return this._subject;
      }
      
      public function matchesStyleClient(param1:IAdvancedStyleClient) : Boolean
      {
         var _loc4_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         if(this.ancestor)
         {
            if(this.conditions)
            {
               for each(_loc3_ in this.conditions)
               {
                  _loc2_ = _loc3_.matchesStyleClient(param1);
                  if(!_loc2_)
                  {
                     return false;
                  }
               }
            }
            _loc2_ = false;
            _loc4_ = param1.styleParent;
            while(_loc4_ != null)
            {
               if(_loc4_.matchesCSSType(this.ancestor.subject) || "package_1" == this.ancestor.subject)
               {
                  _loc2_ = this.ancestor.matchesStyleClient(_loc4_);
                  if(_loc2_)
                  {
                     break;
                  }
               }
               _loc4_ = _loc4_.styleParent;
            }
         }
         else
         {
            if(this.subject == "package_1" || this.subject == "" || param1.matchesCSSType(this.subject))
            {
               _loc2_ = true;
            }
            if(_loc2_ && this.conditions != null)
            {
               for each(_loc3_ in this.conditions)
               {
                  _loc2_ = _loc3_.matchesStyleClient(param1);
                  if(!_loc2_)
                  {
                     return false;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      mx_internal function getPseudoCondition() : String
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(this.conditions)
         {
            for each(_loc2_ in this.conditions)
            {
               if(_loc2_.kind == CSSConditionKind.PSEUDO)
               {
                  _loc1_ = _loc2_.value;
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this.ancestor != null)
         {
            _loc1_ = this.ancestor.toString() + " " + this.subject;
         }
         else
         {
            _loc1_ = this.subject;
         }
         if(this.conditions != null)
         {
            for each(_loc2_ in this.conditions)
            {
               _loc1_ += _loc2_.toString();
            }
         }
         return _loc1_;
      }
   }
}
