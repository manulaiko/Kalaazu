package package_75
{
   import com.bigpoint.utils.class_73;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_1856 extends Effect
   {
       
      
      private var _position:class_73;
      
      private var var_3542:Number;
      
      private var var_581:int;
      
      private var var_28:Boolean;
      
      private var _cycleTime:Number = 4;
      
      public function class_1856(param1:class_73, param2:Number = 0, param3:int = 0, param4:Boolean = false, param5:Number = 4, param6:Boolean = true)
      {
         super(class_338.const_3248,param6 ? int(const_2311) : int(const_925));
         this._position = param1;
         this.var_3542 = param2;
         this.var_581 = param3;
         this.var_28 = param4;
         this._cycleTime = param5;
      }
      
      public function get position() : class_73
      {
         return this._position;
      }
      
      public function set position(param1:class_73) : void
      {
         this._position = param1;
      }
      
      public function get method_5815() : Number
      {
         return this.var_3542;
      }
      
      public function set method_5815(param1:Number) : void
      {
         this.var_3542 = param1;
      }
      
      public function get method_5087() : int
      {
         return this.var_581;
      }
      
      public function set method_5087(param1:int) : void
      {
         this.var_581 = param1;
      }
      
      public function get method_5290() : Boolean
      {
         return this.var_28;
      }
      
      public function set method_5290(param1:Boolean) : void
      {
         this.var_28 = param1;
      }
      
      public function get cycleTime() : Number
      {
         return this._cycleTime;
      }
      
      public function set cycleTime(param1:Number) : void
      {
         this._cycleTime = param1;
      }
   }
}
