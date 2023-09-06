package package_400
{
   import com.bigpoint.utils.class_129;
   import flash.text.TextFormat;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import package_30.class_219;
   import package_33.class_93;
   
   public class class_2527
   {
      
      private static const MARGIN:int = 10;
       
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_2407:String = "";
      
      private var var_4173:String = "";
      
      private var var_3242:Array;
      
      private var var_4612:Array;
      
      private var var_2872:class_219;
      
      private var var_2461:class_219;
      
      private var var_1202:class_93;
      
      public function class_2527(param1:class_93, param2:int, param3:int)
      {
         this.var_3242 = new Array();
         this.var_4612 = new Array();
         super();
         this.method_745();
         this.method_2042();
         this._height = param3;
         this._width = param2;
         this.var_1202 = param1;
         this.method_5257();
      }
      
      private function method_2042() : void
      {
         this.var_3242[class_2280.const_664] = "";
         this.var_3242[class_2280.const_1469] = class_88.getItem("jackpot_status_window_about_to_end_message");
         this.var_3242[class_2280.const_1804] = "";
         this.var_3242[class_2280.const_1031] = class_88.getItem("jackpot_status_window_about_to_begin_message");
      }
      
      private function method_745() : void
      {
         this.var_4612[class_2280.const_664] = class_88.getItem("jackpot_status_window_remaining_wildcard_time_message");
         this.var_4612[class_2280.const_1469] = class_88.getItem("jackpot_status_window_remaining_fight_time_message");
         this.var_4612[class_2280.const_1804] = class_88.getItem("jackpot_status_window_remaining_wait_time_message");
         this.var_4612[class_2280.const_1031] = class_88.getItem("jackpot_status_window_remaining_time_message");
      }
      
      private function method_5257() : void
      {
         this.method_6427();
         this.method_6362();
      }
      
      private function method_6362() : void
      {
         var _loc1_:TextFormat = new TextFormat(class_18.const_740,class_18.const_2668,16711680);
         _loc1_.leftMargin = MARGIN;
         _loc1_.rightMargin = MARGIN;
         this.var_2461 = new class_219(this._width,20,_loc1_,this.var_2407);
         this.var_2461.visible = false;
         this.var_1202.addElement(this.var_2461,class_93.const_3298);
      }
      
      private function method_6427() : void
      {
         var _loc1_:TextFormat = new TextFormat(class_18.const_740,class_18.const_2668,class_18.WHITE);
         _loc1_.leftMargin = MARGIN;
         _loc1_.rightMargin = MARGIN;
         this.var_2872 = new class_219(this._width,40,_loc1_);
         this.var_2872.textField.multiline = true;
         this.var_2872.textField.wordWrap = true;
         this.var_1202.addElement(this.var_2872,class_93.const_3298);
      }
      
      public function get method_6050() : class_219
      {
         return this.var_2461;
      }
      
      public function get method_4646() : class_219
      {
         return this.var_2872;
      }
      
      public function method_182(param1:int) : void
      {
         var _loc2_:String = this.var_4173.replace(/%TIME%/,class_129.method_1101(param1));
         this.var_2872.method_1455(_loc2_);
      }
      
      public function method_4711(param1:int) : void
      {
         this.var_4173 = !!this.var_4612[param1] ? this.var_4612[param1] : this.var_4173;
         this.var_2407 = !!this.var_3242[param1] ? this.var_3242[param1] : this.var_2407;
         this.var_2461.method_1455(this.var_2407);
      }
   }
}
