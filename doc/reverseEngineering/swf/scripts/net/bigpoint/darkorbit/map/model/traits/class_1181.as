package net.bigpoint.darkorbit.map.model.traits
{
   import package_29.class_267;
   
   public class class_1181 extends class_267
   {
       
      
      private var var_390:Vector.<String>;
      
      private var _debug:Boolean = false;
      
      private var var_2300:int;
      
      private var _layer:int;
      
      private var var_3302:String;
      
      public function class_1181(param1:int, param2:int, param3:String, param4:Vector.<String> = null, param5:Boolean = false)
      {
         super();
         this.var_2300 = param1;
         this._layer = param2;
         this.var_3302 = param3;
         this.var_390 = param4;
         this._debug = param5;
      }
      
      public function get parallaxFactor() : int
      {
         return this.var_2300;
      }
      
      public function get layer() : int
      {
         return this._layer;
      }
      
      public function get method_1489() : String
      {
         return this.var_3302;
      }
      
      public function get decorators() : Vector.<String>
      {
         return this.var_390;
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
   }
}
