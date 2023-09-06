package package_189
{
   import package_38.class_610;
   
   public class class_1116
   {
      
      public static const const_390:String = "_";
      
      public static const const_424:String = ".";
       
      
      public var var_767:Vector.<class_610>;
      
      public var var_2131:int = 0;
      
      public var var_1957:String = "_";
      
      public var complete:Boolean;
      
      protected var word:String;
      
      protected var var_2704:Vector.<String>;
      
      public function class_1116()
      {
         super();
      }
      
      public function initialize(param1:int) : void
      {
         this.var_2131 = param1;
         this.var_2704 = new Vector.<String>(this.var_2131 - 1);
         this.method_1728(this.var_1957);
      }
      
      protected function method_1728(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2131)
         {
            this.var_2704[_loc2_] = param1;
            _loc2_++;
         }
      }
      
      public function method_5485() : String
      {
         this.word = "";
         var _loc1_:int = 0;
         while(_loc1_ < this.var_2131)
         {
            this.word += this.var_2704[_loc1_];
            if(_loc1_ != this.var_2131 - 1)
            {
               this.word += const_424;
            }
            _loc1_++;
         }
         return this.word;
      }
      
      protected function method_5759(param1:String, param2:uint) : void
      {
         if(param2 < this.var_2131)
         {
            this.var_2704[param2] = param1;
         }
      }
      
      public function method_5354(param1:class_1116) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1.var_767)
         {
            this.method_5759(_loc2_.var_3482,_loc2_.var_4042);
         }
         this.complete = param1.complete;
      }
   }
}
