package package_15
{
   import com.bigpoint.utils.class_129;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_14.class_52;
   import package_30.class_130;
   import package_30.class_91;
   import package_33.class_93;
   import package_46.class_131;
   import package_9.class_50;
   
   public class class_54 implements class_52
   {
       
      
      private var main:class_9;
      
      private var var_1666:int;
      
      private var var_4889:int;
      
      private var var_1726:Number = 0;
      
      public function class_54(param1:class_9)
      {
         super();
         this.main = param1;
      }
      
      private function method_1084() : class_131
      {
         var _loc6_:* = null;
         var _loc1_:int = 0;
         var _loc2_:class_131 = this.main.method_4489().createWindow(GuiConstants.INFILTRATION_GAME_WINDOW) as class_131;
         var _loc3_:class_93 = _loc2_.method_3694(class_93.const_2145);
         var _loc4_:Array = _loc3_.method_1864();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if((_loc6_ = _loc4_[_loc5_]) != null)
            {
               _loc6_.x = _loc1_;
            }
            _loc1_ += 60;
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function method_99(param1:int, param2:int, param3:int) : void
      {
         if(this.main.method_4489().method_4610(GuiConstants.INFILTRATION_GAME_WINDOW))
         {
            this.main.method_4489().method_380(GuiConstants.INFILTRATION_GAME_WINDOW);
         }
         var _loc4_:class_131;
         if((_loc4_ = this.main.method_4489().method_468(GuiConstants.INFILTRATION_GAME_WINDOW)) == null)
         {
            _loc4_ = this.method_1084();
         }
         var _loc6_:class_130;
         var _loc5_:class_93;
         (_loc6_ = (_loc5_ = _loc4_.method_3694(class_93.const_2145)).method_89(class_91.const_1520) as class_130).method_2518(class_129.method_1101(param1));
         var _loc7_:String = class_88.getItem("ttip_infiltrationGameTimer").replace(/%TIME%/,class_129.method_1101(param1));
         _loc6_.updateTooltip(_loc7_);
         this.var_4889 = param1;
         this.var_1666 = 0;
         if(!class_50.method_5546(this))
         {
            class_50.method_5621(this);
         }
         var _loc8_:class_130;
         (_loc8_ = _loc5_.method_89(class_91.const_2515) as class_130).method_2518(class_88.getItem("prefix_ifg_amounts").replace(/%COUNT%/,param2 + "/" + param3));
         _loc8_.setText(class_88.getItem("prefix_ifg_amounts").replace(/%COUNT%/,param2 + "/" + param3));
         _loc8_.getChildAt(0).y = 5;
         var _loc9_:TextFormat;
         (_loc9_ = new TextFormat()).align = TextFormatAlign.CENTER;
         var _loc10_:TextField;
         (_loc10_ = _loc8_.getChildAt(1) as TextField).setTextFormat(_loc9_);
      }
      
      public function updateTimer(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_1726 += param1;
         if(this.var_1726 > 999)
         {
            _loc2_ = Number(this.var_4889) - Number(this.var_1666++);
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
            _loc3_ = this.main.method_4489().method_468(GuiConstants.INFILTRATION_GAME_WINDOW);
            if(_loc3_ == null)
            {
               _loc3_ = this.method_1084();
            }
            (_loc5_ = (_loc4_ = _loc3_.method_3694(class_93.const_2145)).method_89(class_91.const_1520) as class_130).method_2518(class_129.method_1101(_loc2_));
            _loc6_ = class_88.getItem("ttip_infiltrationGameTimer").replace(/%TIME%/,class_129.method_1101(_loc2_));
            _loc5_.updateTooltip(_loc6_);
            if(_loc2_ == 0)
            {
               this.method_1592();
            }
            this.var_1726 -= 1000;
         }
      }
      
      private function method_1592() : void
      {
         class_50.removeObserver(this);
      }
      
      public function method_6185() : class_9
      {
         return this.main;
      }
      
      public function method_1140() : void
      {
         this.method_1592();
      }
   }
}
