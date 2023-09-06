package package_415
{
   import package_414.class_2337;
   import package_416.class_2338;
   import package_422.class_2348;
   import package_459.class_2551;
   import package_460.class_2552;
   
   public class class_2342 extends class_2337
   {
       
      
      private var var_394:class_2348;
      
      private var var_91:Boolean;
      
      private var p:class_2552;
      
      private var inside:Boolean;
      
      public function class_2342(param1:class_2348 = null, param2:Boolean = false)
      {
         super();
         priority = -20;
         this.method_1818 = param1;
         this.method_4737 = param2;
      }
      
      public function get method_1818() : class_2348
      {
         return this.var_394;
      }
      
      public function set method_1818(param1:class_2348) : void
      {
         this.var_394 = param1;
      }
      
      public function get method_4737() : Boolean
      {
         return this.var_91;
      }
      
      public function set method_4737(param1:Boolean) : void
      {
         this.var_91 = param1;
      }
      
      override public function update(param1:class_2338, param2:class_2551, param3:Number) : void
      {
         this.p = class_2552(param2);
         this.inside = this.var_394.contains(this.p.x,this.p.y);
         if(this.var_91)
         {
            if(!this.inside)
            {
               this.p.var_3064 = true;
            }
         }
         else if(this.inside)
         {
            this.p.var_3064 = true;
         }
      }
   }
}
