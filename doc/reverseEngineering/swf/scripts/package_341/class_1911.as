package package_341
{
   import flash.utils.getQualifiedClassName;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_1911
   {
       
      
      private var var_662:uint;
      
      private var var_31:class_68;
      
      private var var_1400:Boolean = true;
      
      private var var_4990:Boolean;
      
      private var _alpha:Number = 1;
      
      private var _id:String;
      
      public function class_1911()
      {
         super();
         this.var_31 = new class_70();
      }
      
      public function get method_3795() : uint
      {
         if(this.var_1400)
         {
            this.var_662 = this.method_2965();
            this.var_1400 = false;
         }
         return Number(this.var_662) & 16777215;
      }
      
      public function set method_3795(param1:uint) : void
      {
         if(this.var_662 != param1)
         {
            this.var_662 = param1;
            this.var_1400 = false;
            this.method_3083();
            this.var_31.dispatch();
         }
      }
      
      public function get changed() : class_68
      {
         return this.var_31;
      }
      
      public function equals(param1:class_1912) : Boolean
      {
         return param1.method_3795 == this.method_3795;
      }
      
      public function method_3319() : void
      {
         if(!this.var_4990)
         {
            this.var_4990 = true;
            this.var_31.dispatch();
         }
      }
      
      public function method_5150() : Boolean
      {
         return this.var_4990;
      }
      
      public function copyFrom(param1:class_1912, param2:Boolean = true) : void
      {
         if(param1)
         {
            if(param2)
            {
               this.alpha = param1.alpha;
            }
            this.method_3795 = param1.method_3795;
         }
      }
      
      protected function method_2965() : uint
      {
         return 0;
      }
      
      protected function method_5521() : void
      {
         this.var_1400 = true;
         this.var_4990 = false;
         this.var_31.dispatch();
      }
      
      protected function method_3083() : void
      {
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public final function get method_1526() : String
      {
         var _loc1_:String = (Number(this.method_3795) & 16777215).toString(16);
         while(_loc1_.length < 6)
         {
            _loc1_ = "0" + _loc1_;
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         return this.method_6330() + "[" + this._id + ", " + this.method_1526 + "]";
      }
      
      protected function method_6330() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         return _loc1_.slice(_loc1_.indexOf("::") + 2);
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(this._alpha != param1)
         {
            this._alpha = Math.max(0,Math.min(param1,1));
            this.var_31.dispatch();
         }
      }
   }
}
