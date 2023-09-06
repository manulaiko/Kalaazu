package package_22
{
   public class class_1078
   {
       
      
      private var name_69:Vector.<String>;
      
      private var var_4233:Vector.<String>;
      
      private var var_351:Vector.<String>;
      
      private var var_3790:Vector.<String>;
      
      private var var_497:Vector.<String>;
      
      private var var_3558:Vector.<String>;
      
      private var var_2165:Boolean;
      
      private var var_979:Boolean;
      
      private var var_3218:Boolean;
      
      private var var_4369:Boolean;
      
      private var var_638:int;
      
      private var var_637:int;
      
      private var var_939:Number;
      
      public function class_1078(param1:Vector.<String>, param2:Vector.<String>, param3:Vector.<String>, param4:Vector.<String>, param5:Vector.<String>, param6:Vector.<String>, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int, param12:int, param13:Number)
      {
         super();
         this.name_69 = param1;
         this.var_351 = param3;
         this.var_3790 = param4;
         this.var_497 = param5;
         this.var_3558 = param6;
         this.var_2165 = param7;
         this.var_979 = param8;
         this.var_3218 = param9;
         this.var_4369 = param10;
         this.var_638 = param11;
         this.var_637 = param12;
         this.var_939 = param13;
         this.var_4233 = param2;
      }
      
      public function get geometry() : Vector.<String>
      {
         return this.name_69;
      }
      
      public function get textureDiff() : Vector.<String>
      {
         return this.var_351;
      }
      
      public function get randomGeometryRotation() : Boolean
      {
         return this.var_2165;
      }
      
      public function get alphaBlending() : Boolean
      {
         return this.var_979;
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return this.var_3218;
      }
      
      public function get useLights() : Boolean
      {
         return this.var_4369;
      }
      
      public function get ySpread() : int
      {
         return this.var_638;
      }
      
      public function get textureNormal() : Vector.<String>
      {
         return this.var_3790;
      }
      
      public function get textureSpecular() : Vector.<String>
      {
         return this.var_497;
      }
      
      public function get textureAlphaMask() : Vector.<String>
      {
         return this.var_3558;
      }
      
      public function get additionalTilesInGrid() : int
      {
         return this.var_637;
      }
      
      public function get enlargeInnerTilesFactor() : Number
      {
         return this.var_939;
      }
      
      public function get deepTiles() : Vector.<String>
      {
         return this.var_4233;
      }
   }
}
