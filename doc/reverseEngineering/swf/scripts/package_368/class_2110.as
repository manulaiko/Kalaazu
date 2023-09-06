package package_368
{
   import away3d.arcane;
   
   public class class_2110
   {
      
      public static const const_2965:uint = 0;
      
      public static const const_3206:uint = 1;
      
      public static const const_1291:uint = 2;
       
      
      private var var_1223:Boolean;
      
      private var var_3172:String;
      
      private var var_2611:Object;
      
      private var var_4449:Object;
      
      private var var_496:uint;
      
      private var var_254:Boolean;
      
      private var var_4115:Boolean;
      
      public function class_2110(param1:Boolean = true, param2:String = null)
      {
         super();
         this.var_1223 = param1;
         this.var_3172 = param2 || false;
         this.var_2611 = {};
         this.var_4449 = {};
         this.var_496 = const_2965;
      }
      
      public function get method_3980() : Boolean
      {
         return this.var_1223;
      }
      
      public function set method_3980(param1:Boolean) : void
      {
         this.var_1223 = param1;
      }
      
      public function get method_810() : uint
      {
         return this.var_496;
      }
      
      public function set method_810(param1:uint) : void
      {
         this.var_496 = param1;
      }
      
      public function get method_2890() : String
      {
         return this.var_3172;
      }
      
      public function set method_2890(param1:String) : void
      {
         this.var_3172 = param1;
      }
      
      public function get method_2162() : Boolean
      {
         return this.var_254;
      }
      
      public function set method_2162(param1:Boolean) : void
      {
         this.var_254 = param1;
      }
      
      public function get method_3524() : Boolean
      {
         return this.var_4115;
      }
      
      public function set method_3524(param1:Boolean) : void
      {
         this.var_4115 = param1;
      }
      
      public function method_2766(param1:String, param2:String) : void
      {
         this.var_4449[param1] = param2;
      }
      
      public function method_903(param1:String, param2:*) : void
      {
         this.var_2611[param1] = param2;
      }
      
      arcane function method_6142(param1:String) : Boolean
      {
         return this.var_2611.hasOwnProperty(param1);
      }
      
      arcane function method_4860(param1:String) : *
      {
         return this.var_2611[param1];
      }
      
      public function method_5804(param1:String) : Boolean
      {
         return this.var_4449.hasOwnProperty(param1);
      }
      
      public function method_1190(param1:String) : String
      {
         return this.var_4449[param1];
      }
      
      public function method_6396(param1:uint) : class_2412
      {
         return new class_2412(param1);
      }
   }
}
