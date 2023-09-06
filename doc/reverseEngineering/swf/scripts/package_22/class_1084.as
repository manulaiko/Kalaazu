package package_22
{
   public class class_1084 extends class_168
   {
       
      
      private var var_1177:Boolean;
      
      private var var_1739:Boolean;
      
      private var _width:int;
      
      private var _height:int;
      
      private var _tileWidth:int;
      
      private var _tileHeight:int;
      
      private var var_997:String;
      
      private var var_1316:Boolean;
      
      private var var_2575:class_1078;
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      public function class_1084(param1:int, param2:String, param3:String, param4:Boolean, param5:String, param6:Boolean, param7:int, param8:int, param9:String, param10:int, param11:int, param12:Boolean = true, param13:class_1078 = null)
      {
         super(param1,param2,param3,param5);
         this.var_1177 = param4;
         this.var_1739 = param6;
         this._tileWidth = param7;
         this._tileHeight = param8;
         if(param9 != "")
         {
            this.var_997 = param9;
         }
         this._width = param10;
         this._height = param11;
         this.var_1316 = param12;
         this.var_2575 = param13;
      }
      
      public function toString() : String
      {
         return "BackgroundPattern, resKey: " + resKey + " resKeyStarling: " + resKeyStarling;
      }
      
      public function get isTiled() : Boolean
      {
         return this.var_1177;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get tileWidth() : int
      {
         return this._tileWidth;
      }
      
      public function get tileHeight() : int
      {
         return this._tileHeight;
      }
      
      public function get order() : String
      {
         return this.var_997;
      }
      
      public function get isReloadable() : Boolean
      {
         return this.var_1739;
      }
      
      public function get showInStarlingMode() : Boolean
      {
         return this.var_1316;
      }
      
      public function get method_170() : class_1078
      {
         return this.var_2575;
      }
   }
}
