package package_448
{
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_314.class_2258;
   import package_388.class_2256;
   
   public class class_2514
   {
       
      
      private var _displayTime:uint = 0;
      
      private var _title:String;
      
      private var _message:String;
      
      private var var_4334:String = "";
      
      private var var_2182:class_2505;
      
      private var var_2199:uint;
      
      private var var_3010:Boolean;
      
      private var var_2796:Class;
      
      private var var_4024:Class;
      
      private var var_3600:Dictionary;
      
      private var var_189:String;
      
      public function class_2514()
      {
         super();
         this.var_4334 = class_88.getItem("gameentry_hintwindow_button_confirmation");
         this.var_3600 = new Dictionary();
         this.method_2338(class_2256.const_3193,new class_2506(class_2258));
      }
      
      public function method_2338(param1:String, param2:class_2506) : void
      {
         if(this.var_3600[param1])
         {
            this.var_3600[param1] = null;
            delete this.var_3600[param1];
         }
         this.var_3600[param1] = param2;
      }
      
      public function method_882(param1:String) : class_2506
      {
         return this.var_3600[param1];
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function set method_6490(param1:class_2505) : void
      {
         this.var_2182 = param1;
      }
      
      public function get method_6490() : class_2505
      {
         return this.var_2182;
      }
      
      public function get displayTime() : uint
      {
         return this._displayTime;
      }
      
      public function set displayTime(param1:uint) : void
      {
         this._displayTime = param1;
      }
      
      public function get method_4859() : uint
      {
         return this.var_2199;
      }
      
      public function set method_4859(param1:uint) : void
      {
         this.var_2199 = param1;
      }
      
      public function get method_6347() : Boolean
      {
         return this.var_3010;
      }
      
      public function set method_6347(param1:Boolean) : void
      {
         this.var_3010 = param1;
      }
      
      public function get method_4999() : String
      {
         return this.var_4334;
      }
      
      public function set method_4999(param1:String) : void
      {
         this.var_4334 = param1;
      }
      
      public function get method_3873() : Class
      {
         return this.var_2796;
      }
      
      public function set method_3873(param1:Class) : void
      {
         this.var_2796 = param1;
      }
      
      public function get method_5410() : Class
      {
         return this.var_4024;
      }
      
      public function set method_5410(param1:Class) : void
      {
         this.var_4024 = param1;
      }
      
      public function get paymentLink() : String
      {
         return this.var_189;
      }
      
      public function set paymentLink(param1:String) : void
      {
         this.var_189 = param1;
      }
   }
}
