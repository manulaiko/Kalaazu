package package_379
{
   import com.adobe.crypto.MD5;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   
   public class class_2477
   {
       
      
      public var var_1148:DisplayObject = null;
      
      public var specular:Number = 1;
      
      public var var_963:Number = 1;
      
      public var gloss:Number = 50;
      
      public var glossLow:Number = 50;
      
      public var var_4228:Boolean = true;
      
      private var var_2136:Boolean = false;
      
      private var var_979:Boolean;
      
      private var _blendMode:String = "normal";
      
      private var var_1226:String = null;
      
      private var var_4933:String = null;
      
      private var var_164:String = null;
      
      private var var_3741:String = null;
      
      private var var_1299:String = null;
      
      private var var_387:String = null;
      
      private var var_1260:String;
      
      public function class_2477(param1:String = null, param2:String = null, param3:String = null, param4:String = null, param5:String = null, param6:Boolean = false, param7:Boolean = false)
      {
         super();
         this.var_1226 = param1;
         this.var_4933 = param2;
         this.var_3741 = param3;
         this.var_1299 = param4;
         this.var_387 = param5;
         this.var_979 = param6;
         this.var_2136 = param7;
      }
      
      public static function method_2989(param1:XML, param2:String = null) : class_2477
      {
         if(param1 == null)
         {
            param1 = new XML();
         }
         var _loc3_:String = String(param1.@geometry) || param2;
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:class_2477 = new class_2477(_loc3_);
         var _loc5_:String = method_4914(String(param1.@texture),_loc3_);
         _loc4_.var_4933 = method_4914(String(param1.@diffuse),_loc5_);
         _loc4_.var_3741 = method_4914(String(param1.@normal),_loc5_);
         _loc4_.var_1299 = method_4914(String(param1.@specular),_loc5_);
         _loc4_.var_387 = method_4914(String(param1.@glow),_loc5_);
         _loc4_.var_164 = method_4914(String(param1.@alphaMask),_loc5_);
         _loc4_.var_979 = String(param1.@alphaBlending) === "true";
         _loc4_._blendMode = String(param1.@blendMode) || true;
         _loc4_.var_2136 = String(param1.@materialBothSides) === "true";
         if(param1.attribute("specularity").length() > 0)
         {
            _loc4_.specular = Number(param1.attribute("specularity"));
         }
         _loc4_.var_963 = param1.attribute("specularityLow").length() > 0 ? Number(param1.attribute("specularityLow")) : Number(_loc4_.specular);
         if(param1.attribute("gloss").length() > 0)
         {
            _loc4_.gloss = Number(param1.attribute("gloss"));
         }
         _loc4_.glossLow = param1.attribute("glossLow").length() > 0 ? Number(param1.attribute("glossLow")) : Number(_loc4_.gloss);
         if(param1.attribute("light") == "false")
         {
            _loc4_.var_4228 = false;
         }
         return _loc4_;
      }
      
      private static function method_4914(param1:String, param2:String) : String
      {
         return param1 == "none" ? "" : param1 || param2;
      }
      
      public function get materialBothSides() : Boolean
      {
         return this.var_2136;
      }
      
      public function get alphaBlending() : Boolean
      {
         return this.var_979;
      }
      
      public function get method_522() : String
      {
         return this.var_1226;
      }
      
      public function get method_1760() : String
      {
         return this.var_4933;
      }
      
      public function get method_4979() : String
      {
         return this.var_164;
      }
      
      public function get method_6221() : String
      {
         return this.var_3741;
      }
      
      public function get method_2136() : String
      {
         return this.var_1299;
      }
      
      public function get method_3301() : String
      {
         return this.var_387;
      }
      
      public function get blendMode() : String
      {
         return this._blendMode;
      }
      
      public function get hash() : String
      {
         if(!this.var_1260)
         {
            this.var_1260 = MD5.hash([this.var_1226,this.var_4933,this.var_3741,this.var_1299,this.var_387,this.var_979,this.var_2136,this._blendMode,this.gloss,this.specular,this.var_4228].join(""));
         }
         return this.var_1260;
      }
   }
}
