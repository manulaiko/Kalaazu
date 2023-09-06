package package_137
{
   import package_67.class_384;
   
   public class class_410 implements class_384
   {
      
      public static const const_559:int = 0;
      
      public static const const_2146:int = 1;
      
      public static const const_738:int = 2;
      
      public static const const_1915:int = 3;
      
      public static const const_1883:int = 4;
      
      public static const const_1185:int = 5;
      
      public static const const_978:int = 6;
      
      public static const const_707:int = 7;
      
      public static const const_530:int = 7;
      
      public static const const_1231:int = 0;
      
      public static const const_1625:int = 1;
      
      public static const const_2076:int = 2;
      
      public static const const_2671:int = 3;
      
      private static var var_339:Array;
       
      
      public var type:int;
      
      public var slot:int;
      
      public var status:int;
      
      public var amount:int;
      
      public var var_4510:int;
      
      public var var_3073:int;
      
      public var var_2403:int = 15;
      
      public var var_4031:Boolean;
      
      private var name:String;
      
      public function class_410()
      {
         super();
      }
      
      public static function method_2433(param1:int) : String
      {
         if(var_339 == null)
         {
            method_2363();
         }
         return var_339[param1];
      }
      
      private static function method_2363() : void
      {
         var_339 = [];
         var_339[const_1231] = "DEFAULT";
         var_339[const_1625] = "READY";
         var_339[const_2076] = "ACTIVE";
         var_339[const_2671] = "INACTIVE";
      }
      
      public function toString() : String
      {
         return "TechItem: slot " + this.slot + " type: " + this.name + ", status " + method_2433(this.status) + ", amount: " + this.amount + ", secsLeft: " + this.var_3073;
      }
      
      public function method_3691(param1:class_410) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.amount != param1.amount)
         {
            this.amount = param1.amount;
            _loc2_ = true;
         }
         if(this.var_4510 != param1.var_4510)
         {
            this.var_4510 = param1.var_4510;
            _loc2_ = true;
         }
         if(this.status != param1.status)
         {
            this.status = param1.status;
            _loc2_ = true;
         }
         if(this.var_3073 != param1.var_3073)
         {
            this.var_3073 = param1.var_3073;
            _loc2_ = true;
         }
         if(this.type != param1.type)
         {
            this.type = param1.type;
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function method_1746() : void
      {
         this.name = class_412.method_1243(this.type);
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function method_80() : int
      {
         return this.status;
      }
   }
}
