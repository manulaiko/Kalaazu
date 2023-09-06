package package_118
{
   import flash.utils.Dictionary;
   
   class class_1184
   {
       
      
      private var var_2619:Vector.<ContentElement>;
      
      private var var_1159:int;
      
      private var var_3421:Boolean;
      
      function class_1184(param1:String, param2:int = 0, param3:Boolean = false)
      {
         super();
         this.var_2619 = this.method_5836(param1);
         this.var_1159 = param2;
         this.var_3421 = param3;
      }
      
      public function get quantity() : int
      {
         return this.var_1159;
      }
      
      public function set quantity(param1:int) : void
      {
         this.var_1159 = param1;
      }
      
      public function get method_1672() : Boolean
      {
         return this.var_3421;
      }
      
      public function set method_1672(param1:Boolean) : void
      {
         this.var_3421 = param1;
      }
      
      public function link() : void
      {
         var _loc2_:* = null;
         var _loc1_:uint = uint(this.var_2619.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.var_2619[_loc3_] as class_325;
            if(_loc2_ != null)
            {
               _loc2_.link();
            }
            _loc3_++;
         }
      }
      
      public function setText(param1:String) : void
      {
         this.var_2619 = this.method_5836(param1);
      }
      
      public function getText(param1:Dictionary) : String
      {
         var _loc2_:uint = uint(this.var_2619.length);
         var _loc3_:String = "";
         var _loc4_:Number = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ += this.var_2619[_loc4_].getText(param1);
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function method_5836(param1:String) : Vector.<ContentElement>
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc2_:Vector.<ContentElement> = new Vector.<ContentElement>();
         var _loc3_:Array = class_325.method_3649(param1);
         var _loc6_:uint = _loc3_.length;
         var _loc7_:Number = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = null;
            _loc5_ = _loc3_[_loc7_];
            if(class_325.method_2772(_loc5_))
            {
               _loc4_ = class_325.method_6498(_loc5_);
            }
            else
            {
               (_loc8_ = new class_1690()).text = _loc3_[_loc7_];
               _loc4_ = _loc8_;
            }
            if(_loc4_ == null)
            {
               throw new Error("Trying to add a null reference as element to content vector in content string \'" + param1 + "\'");
            }
            _loc2_.push(_loc4_);
            _loc7_++;
         }
         return _loc2_;
      }
   }
}
