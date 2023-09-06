package package_385
{
   import package_307.class_2496;
   import package_310.class_2252;
   
   public class class_2668
   {
       
      
      private var var_1630:uint;
      
      private var var_2809:uint;
      
      private var var_3806:uint;
      
      private var var_4041:uint;
      
      private var var_3858:uint;
      
      private var var_342:uint;
      
      private var var_155:uint;
      
      private var var_3773:Boolean = false;
      
      private var var_1458:uint;
      
      private var var_4350:uint;
      
      public function class_2668()
      {
         super();
      }
      
      public function reset() : void
      {
         this.var_1630 = 0;
         this.var_2809 = 0;
         this.var_3806 = 0;
         this.var_4041 = 0;
         this.var_3858 = 0;
         this.var_342 = 0;
         this.var_155 = 0;
         this.var_3773 = false;
      }
      
      public function method_6510(param1:uint, param2:uint) : void
      {
         this.var_1458 = param1;
         this.var_4350 = param2;
      }
      
      public function method_878(param1:class_2252) : void
      {
         if(param1.var_1986)
         {
            ++this.var_1630;
         }
         if(param1.var_4475)
         {
            ++this.var_342;
            if(param1.var_4342)
            {
               this.var_3773 = true;
            }
         }
         else if(param1.var_4342)
         {
            ++this.var_342;
            this.var_3773 = true;
         }
         if(param1.var_10)
         {
            ++this.var_2809;
         }
         if(param1.var_3863)
         {
            ++this.var_155;
         }
         if(param1.var_3475)
         {
            ++this.var_3806;
         }
         if(param1.var_3859)
         {
            ++this.var_4041;
         }
         if(param1.var_1737)
         {
            ++this.var_3858;
         }
      }
      
      public function get method_6281() : uint
      {
         return this.var_155;
      }
      
      public function get method_3227() : Boolean
      {
         return this.var_3773;
      }
      
      public function get method_1238() : uint
      {
         return this.var_1630;
      }
      
      public function get method_2419() : uint
      {
         return this.var_2809;
      }
      
      public function get method_2081() : uint
      {
         return this.var_3806;
      }
      
      public function get method_5110() : uint
      {
         return this.var_4041;
      }
      
      public function get method_2865() : uint
      {
         return this.var_3858;
      }
      
      public function get method_1841() : uint
      {
         return this.var_342;
      }
      
      public function method_6352(param1:Boolean) : void
      {
         if(this.var_3806 > 0)
         {
            ++this.var_342;
         }
         if(this.var_1458 > 0 && Boolean(Number(this.var_4350) & 0))
         {
            ++this.var_342;
            if(param1)
            {
               this.var_3773 = true;
            }
         }
      }
   }
}
