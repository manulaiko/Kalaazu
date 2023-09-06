package package_25
{
   import flash.display.MovieClip;
   
   public class class_272
   {
       
      
      private var _id:String;
      
      public var x:int;
      
      public var y:int;
      
      private var _count:int;
      
      private var var_1583:String;
      
      private var var_4569:Number;
      
      private var _scale:Number;
      
      private var var_3565:Boolean;
      
      public var mc:MovieClip;
      
      public function class_272(param1:String, param2:int, param3:int, param4:int = -1, param5:String = "", param6:Number = 0.5, param7:Number = 1, param8:Boolean = false)
      {
         super();
         this.var_3565 = param8;
         this._scale = param7;
         this.var_4569 = param6;
         this.var_1583 = param5;
         this._count = param4;
         this.y = param3;
         this.x = param2;
         this._id = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function get method_3944() : String
      {
         return this.var_1583;
      }
      
      public function get method_438() : Number
      {
         return this.var_4569;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function get inverse() : Boolean
      {
         return this.var_3565;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
   }
}
