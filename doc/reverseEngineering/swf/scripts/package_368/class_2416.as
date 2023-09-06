package package_368
{
   import away3d.arcane;
   import flash.net.URLRequest;
   import package_293.class_1751;
   import package_366.class_2105;
   
   public class class_2416
   {
       
      
      private var _id:String;
      
      private var var_1272:URLRequest;
      
      private var _assets:Vector.<class_1751>;
      
      private var var_4133:class_2105;
      
      private var _data;
      
      private var var_2980:Boolean;
      
      private var var_4789:Boolean;
      
      private var var_788:Vector.<class_2416>;
      
      arcane var loader:class_2412;
      
      arcane var success:Boolean;
      
      public function class_2416(param1:String, param2:URLRequest, param3:*, param4:class_2105, param5:Boolean = false, param6:Boolean = false)
      {
         super();
         this._id = param1;
         this.var_1272 = param2;
         this.var_4133 = param4;
         this._data = param3;
         this.var_2980 = param5;
         this.var_4789 = param6;
         this._assets = new Vector.<class_1751>();
         this.var_788 = new Vector.<class_2416>();
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get assets() : Vector.<class_1751>
      {
         return this._assets;
      }
      
      public function get method_728() : Vector.<class_2416>
      {
         return this.var_788;
      }
      
      public function get request() : URLRequest
      {
         return this.var_1272;
      }
      
      public function get method_5288() : Boolean
      {
         return this.var_2980;
      }
      
      public function get method_6049() : Boolean
      {
         return this.var_4789;
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      arcane function setData(param1:*) : void
      {
         this._data = param1;
      }
      
      public function get method_5396() : class_2105
      {
         return this.var_4133;
      }
      
      public function method_5358() : void
      {
         if(this.var_4133)
         {
            this.var_4133.arcane::method_3765(this);
         }
      }
      
      public function method_6056() : void
      {
         if(this.var_4133)
         {
            this.var_4133.arcane::resolveDependencyFailure(this);
         }
      }
      
      public function method_4249(param1:class_1751) : String
      {
         if(this.var_4133)
         {
            return this.var_4133.arcane::method_5931(this,param1);
         }
         return param1.name;
      }
   }
}
