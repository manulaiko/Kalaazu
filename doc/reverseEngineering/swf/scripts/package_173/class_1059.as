package package_173
{
   import com.greensock.TweenMax;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import package_172.class_1057;
   import package_253.class_1564;
   import package_26.class_94;
   import package_30.class_185;
   import package_30.class_218;
   import package_9.ResourceManager;
   
   public class class_1059 extends Sprite
   {
      
      public static var var_1732:int = 9;
       
      
      private var background:MovieClip;
      
      private var var_1017:Sprite;
      
      private var var_1944:MovieClip;
      
      private var var_3868:int;
      
      private var var_4760:int;
      
      private var var_2003:int = 4;
      
      private var var_1343:class_1564;
      
      private var var_183:class_1564;
      
      private var var_4558:class_1564;
      
      private var var_626:class_1564;
      
      private var confirmButton:class_1564;
      
      private var var_2614:MovieClip;
      
      private var var_801:int;
      
      private var selectors:Array;
      
      private var var_3253:int = 0;
      
      private var var_1667:class_1058;
      
      private var var_1711:TextField;
      
      private var var_3474:TextField;
      
      private var var_4429:TextField;
      
      private var var_2417:TextField;
      
      private var var_4212:class_218;
      
      private var var_1764:Number = 0.5;
      
      private var var_112:Boolean;
      
      public function class_1059(param1:Boolean)
      {
         this.selectors = [];
         super();
         this.var_112 = param1;
         this.background = ResourceManager.getMovieClip("window","warp_win_bg");
         this.var_1944 = ResourceManager.getMovieClip("window","warp_win_mask");
         this.var_2614 = ResourceManager.getMovieClip("window","warp_win_price_field");
         this.var_4212 = new class_218(class_185.const_2386,"",ResourceManager.getMovieClip("ui","repairLogoutButtons"));
         this.var_4212.width = 26;
         this.var_4212.height = 27;
         this.var_4212.x = Number(this.background.width) - Number(this.width) - 30;
         this.var_4212.y = 5;
         this.var_4212.addEventListener(MouseEvent.CLICK,this.method_6074);
         class_94.getInstance().method_1211(this.var_4212,class_88.getItem("ttip_warp_win_close_btn"));
         addChild(this.background);
         this.var_1017 = new Sprite();
         addChild(this.var_1017);
         addChild(this.var_1944);
         addChild(this.var_2614);
         this.var_1017.x = 45;
         this.var_1017.y = 68;
         this.var_1944.x = 36;
         this.var_1944.y = 60;
         addChild(this.var_4212);
         this.var_1017.mask = this.var_1944;
         this.var_1711 = new TextField();
         this.var_1711.defaultTextFormat = class_18.const_1236;
         this.var_1711.embedFonts = class_18.var_1210;
         this.var_1711.textColor = 14868941;
         this.var_1711.selectable = false;
         this.var_1711.mouseEnabled = false;
         this.var_1711.text = class_88.getItem("warp_win_window_title");
         this.var_1711.width = this.var_1711.textWidth + 15;
         addChild(this.var_1711);
         this.var_1711.x = 7;
         this.var_1711.y = 7;
         this.var_3474 = new TextField();
         this.var_3474.defaultTextFormat = class_18.const_1236;
         this.var_3474.embedFonts = class_18.var_1210;
         this.var_3474.textColor = 6736843;
         this.var_3474.selectable = false;
         this.var_3474.mouseEnabled = false;
         this.var_3474.text = "- U.";
         this.var_3474.width = this.var_2614.width;
         this.var_3474.height = this.var_2614.height;
         this.var_3474.y = 5;
         this.var_2614.addChild(this.var_3474);
         class_94.getInstance().method_1211(this.var_2614,class_88.getItem("ttip_warp_win_price_field"));
         this.var_2417 = new TextField();
         this.var_2417.defaultTextFormat = class_18.const_1287;
         this.var_2417.embedFonts = class_18.var_1210;
         this.var_2417.textColor = 10066329;
         this.var_2417.selectable = false;
         this.var_2417.mouseEnabled = false;
         this.var_2417.antiAliasType = AntiAliasType.ADVANCED;
         this.var_2417.text = class_88.getItem("desc_shipwarp_costs_jump-voucher_s") + " -";
         addChild(this.var_2417);
         this.var_1343 = new class_1564();
         this.var_1343.method_2464("warp_win_prev_btn");
         this.var_183 = new class_1564();
         this.var_183.method_2464("warp_win_next_btn");
         this.var_4558 = new class_1564();
         this.var_4558.method_2464("warp_win_first_btn");
         this.var_626 = new class_1564();
         this.var_626.method_2464("warp_win_last_btn");
         this.confirmButton = new class_1564();
         this.confirmButton.method_2464("warp_win_confirm_btn");
         addChild(this.var_1343);
         addChild(this.var_183);
         addChild(this.var_4558);
         addChild(this.var_626);
         addChild(this.confirmButton);
         this.var_4429 = new TextField();
         this.var_4429.defaultTextFormat = class_18.const_2975;
         this.var_4429.embedFonts = class_18.var_1210;
         this.var_4429.textColor = 16777215;
         this.var_4429.selectable = false;
         this.var_4429.mouseEnabled = false;
         this.var_4429.text = class_88.getItem("warp_win_warp_btn");
         this.var_4429.width = this.confirmButton.width;
         this.var_4429.height = this.confirmButton.height;
         this.confirmButton.addChild(this.var_4429);
         this.var_4429.y = 5;
         this.confirmButton.active = false;
         this.var_1343.addEventListener(MouseEvent.CLICK,this.method_409);
         this.var_183.addEventListener(MouseEvent.CLICK,this.method_762);
         this.var_4558.addEventListener(MouseEvent.CLICK,this.method_1433);
         this.var_626.addEventListener(MouseEvent.CLICK,this.method_1079);
      }
      
      private function method_6074(param1:MouseEvent) : void
      {
         dispatchEvent(new class_1057(class_1057.CLOSE_SELECTION_WINDOW));
      }
      
      public function method_2014() : void
      {
         class_94.getInstance().method_4247(this.var_4212);
         class_94.getInstance().method_4247(this.var_2614);
      }
      
      public function method_5744(param1:int, param2:int) : void
      {
         this.background.width = param1;
         this.background.height = param2;
      }
      
      public function updateLayout() : void
      {
         this.var_801 = this.var_1017.x;
         this.var_1343.x = 7;
         this.var_1343.y = 116;
         this.var_4558.x = 7;
         this.var_4558.y = 95;
         this.var_183.x = this.width - (this.var_183.width + 7);
         this.var_183.y = 116;
         this.var_626.x = this.width - (this.var_183.width + 7);
         this.var_626.y = 95;
         this.confirmButton.x = 257;
         this.confirmButton.y = 200;
         this.var_2614.x = 100;
         this.var_2614.y = 200;
         this.var_2417.y = this.var_2614.y + 30;
      }
      
      public function method_4529(param1:class_1058) : void
      {
         if(!this.var_3868)
         {
            this.var_3868 = param1.width + var_1732;
            this.var_4760 = param1.height;
            this.method_1982(param1);
            this.updateLayout();
         }
         this.var_1017.addChild(param1);
         this.selectors.push(param1);
         param1.addEventListener(MouseEvent.CLICK,this.method_2035);
         this.method_2729();
      }
      
      private function method_2035(param1:MouseEvent) : void
      {
         if(this.var_1667 != null)
         {
            this.var_1667.selected = false;
         }
         this.var_1667 = param1.currentTarget as class_1058;
         this.method_28();
         this.method_1982();
         this.var_1667.selected = true;
      }
      
      private function method_1982(param1:class_1058 = null) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = this.var_1667;
         }
         if(this.var_112)
         {
            this.var_3474.text = class_88.getItem("pricetag_uridium_compact").replace(/%VALUE%/,"0");
            this.var_2417.text = class_88.getItem("desc_shipwarp_costs_spacestation");
            this.var_2417.width = this.var_2417.textWidth + 50;
            this.var_2417.x = Number(this.background.width) / 2 - Number(this.var_2417.width) / 2;
         }
         else if(false)
         {
            this.var_3474.text = class_88.getItem("pricetag_uridium_compact").replace(/%VALUE%/,"0");
            this.var_2417.text = "";
            if(_loc2_.var_1694 == 1)
            {
               this.var_2417.appendText(class_88.getItem("desc_shipwarp_costs_jump-voucher_s"));
            }
            else
            {
               this.var_2417.appendText(class_88.getItem("desc_shipwarp_costs_jump-voucher_p").replace("%COUNT%",_loc2_.var_1694));
            }
            this.var_2417.appendText(" ");
            if(false)
            {
               this.var_2417.appendText(class_88.getItem("desc_shipwarp_remaining_jump-voucher_s"));
            }
            else
            {
               this.var_2417.appendText(class_88.getItem("desc_shipwarp_remaining_jump-voucher_p").replace("%REMAINING%",class_81.var_238));
            }
            this.var_2417.width = this.var_2417.textWidth + 50;
            this.var_2417.x = Number(this.background.width) / 2 - Number(this.var_2417.width) / 2;
         }
         else
         {
            this.var_3474.text = class_88.getItem("pricetag_uridium_compact").replace(/%VALUE%/,_loc2_.var_1804.toString());
            this.var_2417.text = "";
         }
      }
      
      private function method_4470(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_1667 != null)
         {
            _loc2_ = new class_1057(class_1057.SHIP_SELECTION_MADE);
            _loc2_.var_1611 = this.var_1667.var_1611;
            dispatchEvent(_loc2_);
         }
      }
      
      public function method_1091(param1:class_1058) : void
      {
         if(this.var_1017.contains(param1))
         {
            this.var_1017.removeChild(param1);
         }
      }
      
      private function method_762(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.var_3253 < Number(this.selectors.length) - Number(this.var_2003))
         {
            ++this.var_3253;
            _loc2_ = Number(this.var_801) - Number(this.var_3868) * Number(this.var_3253);
            TweenMax.to(this.var_1017,this.var_1764,{"x":_loc2_});
            this.method_2729();
         }
      }
      
      private function method_409(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.var_3253 > 0)
         {
            --this.var_3253;
            _loc2_ = Number(this.var_801) - Number(this.var_3868) * Number(this.var_3253);
            TweenMax.to(this.var_1017,this.var_1764,{"x":_loc2_});
            this.method_2729();
         }
      }
      
      private function method_1079(param1:MouseEvent) : void
      {
         this.var_3253 = Number(this.selectors.length) - Number(this.var_2003);
         this.method_2729();
         var _loc2_:int = Number(this.var_801) - Number(this.var_3868) * (Number(this.selectors.length) - Number(this.var_2003));
         TweenMax.to(this.var_1017,this.var_1764,{"x":_loc2_});
      }
      
      private function method_1433(param1:MouseEvent) : void
      {
         this.var_3253 = 0;
         this.method_2729();
         TweenMax.to(this.var_1017,this.var_1764,{"x":this.var_801});
      }
      
      private function method_2729() : void
      {
         if(this.selectors.length <= this.var_2003)
         {
            this.method_4934(false);
            this.method_3847(false);
         }
         else if(this.var_3253 == 0)
         {
            this.method_3847(false);
            this.method_4934(true);
         }
         else if(this.var_3253 == Number(this.selectors.length) - Number(this.var_2003))
         {
            this.method_4934(false);
            this.method_3847(true);
         }
         else if(this.var_3253 > 0 && this.var_3253 < Number(this.selectors.length) - Number(this.var_2003))
         {
            this.method_4934(true);
            this.method_3847(true);
         }
      }
      
      private function method_3847(param1:Boolean) : void
      {
         this.var_1343.active = param1;
         this.var_4558.active = param1;
         if(param1)
         {
            this.var_1343.addEventListener(MouseEvent.CLICK,this.method_409);
            this.var_4558.addEventListener(MouseEvent.CLICK,this.method_1433);
         }
         else
         {
            this.var_1343.removeEventListener(MouseEvent.CLICK,this.method_409);
            this.var_4558.removeEventListener(MouseEvent.CLICK,this.method_1433);
         }
      }
      
      private function method_4934(param1:Boolean) : void
      {
         this.var_183.active = param1;
         this.var_626.active = param1;
         if(param1)
         {
            this.var_183.addEventListener(MouseEvent.CLICK,this.method_762);
            this.var_626.addEventListener(MouseEvent.CLICK,this.method_1079);
         }
         else
         {
            this.var_183.removeEventListener(MouseEvent.CLICK,this.method_762);
            this.var_626.removeEventListener(MouseEvent.CLICK,this.method_1079);
         }
      }
      
      public function method_1965() : void
      {
         if(this.var_1667)
         {
            this.method_1982();
         }
         else
         {
            this.method_1982(this.selectors[0]);
         }
      }
      
      public function method_28() : void
      {
         if(this.var_1667)
         {
            if(Boolean(this.var_112) || false || this.var_1667.var_1804 < class_81.var_3732)
            {
               this.confirmButton.active = true;
               this.confirmButton.addEventListener(MouseEvent.CLICK,this.method_4470);
            }
            else
            {
               this.confirmButton.active = false;
               this.confirmButton.removeEventListener(MouseEvent.CLICK,this.method_4470);
            }
         }
      }
      
      private function method_3725() : void
      {
      }
   }
}
