package net.bigpoint.darkorbit.net
{
   public class class_227
   {
       
      
      private var var_1115:String;
      
      private var var_967:String;
      
      private var var_3358:String;
      
      private var var_3423:Boolean;
      
      private var _category:String;
      
      private var var_3134:Boolean;
      
      private var var_3616:String;
      
      private var var_4716:Function;
      
      private var var_998:Array;
      
      public function class_227(param1:String, param2:String, param3:String = null, param4:Boolean = true, param5:String = null, param6:Boolean = true, param7:String = "", param8:Function = null, param9:Array = null)
      {
         super();
         this.var_1115 = param1;
         this.var_967 = param2;
         this.var_3358 = param3;
         this.var_3423 = param4;
         this._category = param5;
         this.var_3134 = param6;
         this.var_3616 = param7;
         this.var_4716 = param8;
         this.var_998 = param9;
      }
      
      public function get action() : String
      {
         return this.var_1115;
      }
      
      public function get method_6534() : String
      {
         return this.var_967;
      }
      
      public function get template() : String
      {
         return this.var_3358;
      }
      
      public function get focus() : Boolean
      {
         return this.var_3423;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get name_87() : Boolean
      {
         return this.var_3134;
      }
      
      public function get method_2070() : String
      {
         return this.var_3616;
      }
      
      public function get method_3329() : Function
      {
         return this.var_4716;
      }
      
      public function get method_1436() : Array
      {
         return this.var_998;
      }
      
      public function set method_2070(param1:String) : void
      {
         this.var_3616 = param1;
      }
      
      public function set name_87(param1:Boolean) : void
      {
         this.var_3134 = param1;
      }
      
      public function set category(param1:String) : void
      {
         this._category = param1;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this.var_3423 = param1;
      }
      
      public function set template(param1:String) : void
      {
         this.var_3358 = param1;
      }
   }
}
