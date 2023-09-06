package package_22
{
   import net.bigpoint.darkorbit.settings.Settings;
   
   public class class_168 extends class_167
   {
       
      
      private var _resKey:String;
      
      private var var_1353:String;
      
      private var var_487:String;
      
      private var name_74:Boolean;
      
      private var var_157:int;
      
      public function class_168(param1:int, param2:String, param3:String = null, param4:String = null)
      {
         super(param1,class_167.const_3060);
         this._resKey = param2;
         this.var_1353 = param3;
         this.var_487 = param4;
      }
      
      public function getResKey() : String
      {
         return this.resKey;
      }
      
      public function method_2511(param1:Boolean) : void
      {
         this.name_74 = param1;
      }
      
      public function set resKey(param1:String) : void
      {
         this._resKey = param1;
      }
      
      public function get resKey() : String
      {
         return Settings.gpuSupport ? this.var_1353 || this._resKey : this._resKey;
      }
      
      public function get resKeyStarling() : String
      {
         return this.var_1353;
      }
      
      public function get atlasXml() : String
      {
         return this.var_487;
      }
      
      public function get poolSize() : int
      {
         return this.var_157;
      }
      
      public function set poolSize(param1:int) : void
      {
         this.var_157 = param1;
      }
   }
}
