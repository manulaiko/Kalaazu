package package_118
{
   import flash.utils.Dictionary;
   
   public class class_1187 extends class_1186
   {
       
      
      private var var_4045;
      
      public function class_1187()
      {
         super();
      }
      
      public function get method_5143() : *
      {
         return this.var_4045;
      }
      
      public function set method_5143(param1:*) : void
      {
         this.var_4045 = class_325.method_4014(param1);
      }
      
      override public function link() : void
      {
         super.link();
         if(this.var_4045 is class_325)
         {
            (this.var_4045 as class_325).link();
         }
      }
      
      override public function getText(param1:Dictionary) : String
      {
         var _loc2_:* = null;
         if(format == null)
         {
            throw new Error("TimespanPlaceholder " + name + " has no format defined.");
         }
         var _loc3_:* = param1[name];
         var _loc4_:Dictionary = new Dictionary();
         if(_loc3_ is Date)
         {
            _loc2_ = _loc3_;
         }
         else
         {
            _loc2_ = new Date(_loc3_);
         }
         var _loc5_:int;
         var _loc6_:int = _loc5_ = int(class_325.method_1118(this.var_4045,param1));
         var _loc7_:int = _loc2_.getUTCFullYear() - 1970;
         var _loc8_:int = _loc2_.getUTCMonth();
         var _loc9_:int = _loc2_.getUTCDate() - 1;
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc7_ == 0)
         {
            _loc4_[class_1183.method_4279] = -1;
         }
         else
         {
            _loc4_[class_1183.method_4279] = _loc7_;
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc8_ == 0)
         {
            _loc4_[class_1183.method_5537] = -1;
         }
         else
         {
            _loc4_[class_1183.method_5537] = _loc8_;
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc9_ == 0)
         {
            _loc4_[class_1183.method_5171] = -1;
         }
         else
         {
            _loc4_[class_1183.method_5171] = _loc9_;
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc2_.getUTCHours() == 0)
         {
            _loc4_[class_1183.method_2952] = -1;
         }
         else
         {
            _loc4_[class_1183.method_2952] = _loc2_.getUTCHours();
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc2_.getUTCMinutes() == 0)
         {
            _loc4_[class_1183.method_1933] = -1;
         }
         else
         {
            _loc4_[class_1183.method_1933] = _loc2_.getUTCMinutes();
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc2_.getUTCSeconds() == 0)
         {
            _loc4_[class_1183.method_2102] = -1;
         }
         else
         {
            _loc4_[class_1183.method_2102] = _loc2_.getUTCSeconds();
            _loc6_--;
         }
         if(_loc6_ == 0 || _loc6_ == this.method_5143 && _loc2_.getUTCMilliseconds() == 0)
         {
            _loc4_[class_1183.method_152] = -1;
         }
         else
         {
            _loc4_[class_1183.method_152] = _loc2_.getUTCMilliseconds();
            _loc6_--;
         }
         return format.getText(_loc4_);
      }
   }
}
