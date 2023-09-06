package package_307
{
   import away3d.arcane;
   import package_309.class_2690;
   import package_369.class_2570;
   
   public class class_2587 extends class_1772
   {
       
      
      private var var_1201:class_2570;
      
      private var var_3812:class_2690;
      
      public function class_2587(param1:class_2570)
      {
         super();
         this.var_1201 = param1;
         method_5388(this.var_3812 = new class_2690());
         this.var_3812.method_6530 = this.var_1201;
      }
      
      public function get method_3253() : class_2570
      {
         return this.var_1201;
      }
      
      public function set method_3253(param1:class_2570) : void
      {
         if(Boolean(param1) && Boolean(this.var_1201) && (param1.method_5818 != this.var_1201.method_5818 || param1.format != this.var_1201.format))
         {
            arcane::method_6504(null);
         }
         this.var_1201 = param1;
         this.var_3812.method_6530 = this.var_1201;
      }
   }
}
