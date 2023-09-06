package package_361
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import package_22.class_1084;
   import package_22.class_168;
   import package_22.class_198;
   import package_9.ResourceManager;
   
   public class class_2090 extends class_2089
   {
       
      
      private var var_273:int;
      
      private var var_1073:Rectangle;
      
      private var var_4389:int;
      
      private var var_590:int;
      
      private var var_1809:Boolean;
      
      private var var_4438:int;
      
      private var var_1600:int;
      
      private var _scale:Number;
      
      private var var_3132:Number = 1;
      
      public function class_2090(param1:int, param2:Boolean, param3:int, param4:int, param5:int, param6:int, param7:Number, param8:int = 0, param9:Rectangle = null, param10:Number = 1)
      {
         this.var_1073 = param9;
         super(param4,param3);
         this.var_4389 = param4;
         this.var_590 = param1;
         this.var_1809 = param2;
         this.var_4438 = param5;
         this.var_1600 = param6;
         this._scale = param7;
         this.var_273 = param8;
         this.var_3132 = param10;
      }
      
      public function get typeID() : int
      {
         return this.var_590;
      }
      
      public function get isMain() : Boolean
      {
         return this.var_1809;
      }
      
      public function get shiftX() : int
      {
         return this.var_4438;
      }
      
      public function get shiftY() : int
      {
         return this.var_1600;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function get method_3228() : Number
      {
         return this.var_3132;
      }
      
      public function get pattern() : class_1084
      {
         return class_198.var_103[this.var_590] as class_1084;
      }
      
      public function get method_3162() : BitmapData
      {
         var _loc1_:class_168 = class_198.var_264[this.var_273];
         return !!_loc1_ ? ResourceManager.getBitmapData(_loc1_.resKey,"mask") : null;
      }
      
      public function isBackgroundTiled(param1:Boolean) : Boolean
      {
         if(param1)
         {
            return Boolean(this.pattern.isTiled) && this.pattern.resKeyStarling != null && this.pattern.atlasXml != null;
         }
         return this.pattern.isTiled;
      }
      
      public function get region() : Rectangle
      {
         return this.var_1073;
      }
      
      public function get method_3078() : int
      {
         return this.var_4389;
      }
   }
}
