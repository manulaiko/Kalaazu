package package_184
{
   import package_10.class_1920;
   import package_38.class_637;
   import package_38.class_718;
   
   public class class_1648
   {
       
      
      private var var_2176:int;
      
      private var var_1648:String;
      
      private var var_2472:class_1920;
      
      private var var_876:Vector.<class_637>;
      
      private var var_4874:int;
      
      private var var_2681:int;
      
      private var _rewards:Vector.<class_718>;
      
      private var var_3492:Number = -1;
      
      private var var_1454:int = -1;
      
      public function class_1648()
      {
         this.var_2472 = new class_1920(0,1000,0,1000);
         super();
      }
      
      public function get rewards() : Vector.<class_718>
      {
         return this._rewards;
      }
      
      public function set rewards(param1:Vector.<class_718>) : void
      {
         this._rewards = param1;
      }
      
      public function get rank() : int
      {
         return this.var_2176;
      }
      
      public function set rank(param1:int) : void
      {
         if(this.var_1454 != -1)
         {
            this.var_1454 = param1 - Number(this.var_2176);
         }
         else
         {
            this.var_1454 = 0;
         }
         this.var_2176 = param1;
      }
      
      public function get name_124() : String
      {
         return this.var_1648;
      }
      
      public function set name_124(param1:String) : void
      {
         this.var_1648 = param1;
      }
      
      public function get method_1545() : class_1920
      {
         return this.var_2472;
      }
      
      public function get name_60() : Vector.<class_637>
      {
         return this.var_876;
      }
      
      public function set name_60(param1:Vector.<class_637>) : void
      {
         this.var_876 = param1;
      }
      
      public function get name_143() : int
      {
         return this.var_4874;
      }
      
      public function set name_143(param1:int) : void
      {
         this.var_4874 = param1;
      }
      
      public function get name_121() : int
      {
         return this.var_2681;
      }
      
      public function set name_121(param1:int) : void
      {
         this.var_2681 = param1;
      }
      
      public function set method_5956(param1:Number) : void
      {
         this.var_3492 = param1;
      }
      
      public function get method_5956() : Number
      {
         return this.var_3492;
      }
      
      public function get method_5052() : int
      {
         return this.var_1454;
      }
   }
}
