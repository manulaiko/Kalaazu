package package_385
{
   public class class_2251
   {
      
      private static const const_1524:Array = ["x","y","z","w"];
       
      
      private var var_145:String;
      
      private var _index:int;
      
      private var var_4749:String;
      
      var var_2135:int;
      
      public function class_2251(param1:String, param2:int, param3:int = -1)
      {
         super();
         this.var_2135 = param3;
         this.var_145 = param1;
         this._index = param2;
         this.var_4749 = this.var_145;
         if(this._index >= 0)
         {
            this.var_4749 += this._index;
         }
         if(param3 > -1)
         {
            this.var_4749 += ".undefined";
         }
      }
      
      public function toString() : String
      {
         return this.var_4749;
      }
      
      public function get method_3684() : String
      {
         return this.var_145;
      }
      
      public function get index() : int
      {
         return this._index;
      }
   }
}
