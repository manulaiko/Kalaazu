package package_24
{
   public class class_75
   {
       
      
      public var id:String;
      
      public var location:class_258;
      
      public var name:String;
      
      public var type:String;
      
      public var params:Object;
      
      public var var_847:int = 0;
      
      public var var_1542:String;
      
      public var var_1520:String;
      
      public var size:uint;
      
      public var calculateHash:Boolean = false;
      
      public function class_75(param1:String, param2:class_258, param3:String, param4:String, param5:String, param6:XML)
      {
         var _loc7_:* = null;
         this.params = {};
         super();
         this.id = param1;
         this.location = param2;
         this.name = param3;
         this.type = param4;
         for each(_loc7_ in param6.param)
         {
            this.params[String(_loc7_.@name)] = String(_loc7_.@value);
         }
      }
      
      public function method_4286(param1:Boolean = false) : String
      {
         var _loc2_:String = this.location.path + this.name + "." + this.type;
         if(param1 && this.var_1542 != null)
         {
            _loc2_ += "?__cv=" + this.var_1542;
         }
         return _loc2_;
      }
   }
}
