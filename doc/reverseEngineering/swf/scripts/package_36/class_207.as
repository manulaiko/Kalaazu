package package_36
{
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_207 extends Effect
   {
       
      
      private var var_1719:int;
      
      private var _x:int;
      
      private var _y:int;
      
      private var var_2647:Boolean;
      
      private var var_126:int;
      
      public function class_207(param1:int, param2:int, param3:int, param4:Boolean, param5:int = 300)
      {
         super(class_338.const_2323,const_925);
         this.var_1719 = param1;
         this._x = param2;
         this._y = param3;
         this.var_2647 = param4;
         this.var_126 = param5;
      }
      
      public function get shockwaveId() : int
      {
         return this.var_1719;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function get name_92() : Boolean
      {
         return this.var_2647;
      }
      
      public function get radius() : int
      {
         return this.var_126;
      }
   }
}
