package package_233
{
   import com.bigpoint.utils.class_122;
   import com.bigpoint.utils.class_129;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control.ResultHeaderCommandBase;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_169.class_1039;
   import package_340.class_1910;
   import package_38.class_557;
   import package_38.class_801;
   import package_39.class_100;
   import package_61.JackpotArenaMatchResultUiMEdiator;
   import package_61.JackpotArenaMatchResultWindow;
   import package_76.class_1110;
   import package_8.VectorCollection;
   
   public class class_1822 extends ResultHeaderCommandBase
   {
       
      
      public function class_1822()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         super.execute(param1);
         var _loc2_:JackpotArenaMatchResultUiMEdiator = facade.retrieveMediator(JackpotArenaMatchResultUiMEdiator.NAME) as JackpotArenaMatchResultUiMEdiator;
         var _loc3_:class_801 = this.method_2630(param1.getBody());
         if(!_loc2_)
         {
            _loc6_ = (_loc5_ = class_57.getInstance()).createWindow(class_57.const_1792) as JackpotArenaMatchResultWindow;
            _loc2_ = new JackpotArenaMatchResultUiMEdiator(_loc6_);
            facade.registerMediator(_loc2_);
         }
         var _loc4_:VectorCollection = this.getData(_loc3_);
         _loc2_.title = class_88.getItem("jackpot_result_window_statistics_title");
         initHeaderLable(_loc3_.var_4528,_loc2_);
         _loc2_.name_122 = this.method_126(class_88.getItem(_loc3_.name_122.var_2377));
         _loc2_.method_3261 = class_1110.method_5670(class_1039.const_1589,_loc3_.var_1556.var_2497);
         _loc2_.method_4240 = class_1110.method_5670(class_1039.const_1589,_loc3_.var_367.var_2497);
         _loc2_.method_6061 = class_1110.method_5670(class_1039.const_1174,class_88.getItem("jackpot_result_window_statistics_header"));
         _loc2_.dataProvider = _loc4_;
         this.method_5997();
      }
      
      private function method_2630(param1:Object) : class_801
      {
         var _loc3_:* = null;
         var _loc2_:class_801 = param1 as class_801;
         if(!_loc2_.var_4528)
         {
            _loc3_ = _loc2_.var_367;
            _loc2_.var_367 = _loc2_.var_1556;
            _loc2_.var_1556 = _loc3_;
         }
         return _loc2_;
      }
      
      private function method_126(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc2_:Array = class_88.getItem("jackpot_result_window_hint_base").split(class_1039.const_3021);
         var _loc3_:Vector.<String> = new Vector.<String>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(class_1110.method_5670(class_1039.const_3222,_loc4_));
         }
         return _loc3_.join(class_1110.method_5670(class_1039.const_3132,param1));
      }
      
      private function getData(param1:class_801) : VectorCollection
      {
         var _loc2_:Vector.<class_1910> = new Vector.<class_1910>();
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_duration_lable")),this.method_5433(param1.var_1556.var_4100),this.method_5433(param1.var_367.var_4100),this.method_4897(),this.method_3351(param1.var_1556.var_4100),this.method_3351(param1.var_367.var_4100)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_damage_given_lable")),this.method_5580(param1.var_1556.var_325),this.method_5580(param1.var_367.var_325),this.method_1754(),this.method_1486(param1.var_1556.var_325,param1.var_1556.var_2497),this.method_1486(param1.var_367.var_325,param1.var_367.var_2497)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_damage_taken_lable")),this.method_5580(param1.var_1556.var_674),this.method_5580(param1.var_367.var_674),this.method_552(),this.method_736(param1.var_1556.var_674,param1.var_1556.var_2497),this.method_736(param1.var_367.var_674,param1.var_367.var_2497)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_peak_damage_lable")),this.method_3289(param1.var_1556),this.method_3289(param1.var_367),this.method_1107(),this.method_6422(param1.var_1556.var_2224,param1.var_1556.var_2497),this.method_6422(param1.var_367.var_2224,param1.var_367.var_2497)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_wins_lable")),this.method_4880(param1.var_1556),this.method_4880(param1.var_367),this.method_5650(),this.method_4932(param1.var_1556.var_1011,param1.var_1556.var_2497),this.method_4932(param1.var_367.var_1011,param1.var_367.var_2497)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_losses_lable")),this.method_2158(param1.var_1556),this.method_2158(param1.var_367),this.method_5723(),this.method_963(param1.var_1556.var_4801,param1.var_1556.var_2497),this.method_963(param1.var_367.var_4801,param1.var_367.var_2497)));
         _loc2_.push(new class_1910(class_1110.method_5670(class_1039.const_3178,class_88.getItem("jackpot_result_window_win_rate_lable")),this.method_1275(param1.var_1556),this.method_1275(param1.var_367),this.method_5622(),this.method_4645(param1.var_1556.var_1712,param1.var_1556.var_2497),this.method_4645(param1.var_367.var_1712,param1.var_367.var_2497)));
         return new VectorCollection(_loc2_);
      }
      
      private function method_4645(param1:Number, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_win_rate_player_tooltip").replace(class_1039.const_758,param1).replace(class_1039.const_1121,param2);
      }
      
      private function method_5622() : String
      {
         return class_88.getItem("jackpot_result_window_win_rate_tooltip");
      }
      
      private function method_963(param1:int, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_losses_player_tooltip").replace(class_1039.const_758,class_122.method_98(param1)).replace(class_1039.const_1121,param2);
      }
      
      private function method_5723() : String
      {
         return class_88.getItem("jackpot_result_window_losses_tooltip");
      }
      
      private function method_4932(param1:int, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_wins_player_tooltip").replace(class_1039.const_758,class_122.method_98(param1)).replace(class_1039.const_1121,param2);
      }
      
      private function method_5650() : String
      {
         return class_88.getItem("jackpot_result_window_wins_tooltip");
      }
      
      private function method_6422(param1:int, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_peak_damage_player_tooltip").replace(class_1039.const_758,class_122.method_98(param1)).replace(class_1039.const_1121,param2);
      }
      
      private function method_1107() : String
      {
         return class_88.getItem("jackpot_result_window_peak_damage_tooltip");
      }
      
      private function method_736(param1:int, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_damage_taken_player_tooltip").replace(class_1039.const_758,class_122.method_98(param1)).replace(class_1039.const_1121,param2);
      }
      
      private function method_552() : String
      {
         return class_88.getItem("jackpot_result_window_damage_taken_tooltip");
      }
      
      private function method_1486(param1:int, param2:String) : String
      {
         return class_88.getItem("jackpot_result_window_damage_given_player_tooltip").replace(class_1039.const_758,class_122.method_98(param1)).replace(class_1039.const_1121,param2);
      }
      
      private function method_1754() : String
      {
         return class_88.getItem("jackpot_result_window_damage_given_tooltip");
      }
      
      private function method_4897() : String
      {
         return class_88.getItem("jackpot_result_window_duration_tooltip");
      }
      
      private function method_3351(param1:int) : String
      {
         return class_88.getItem("jackpot_result_window_duration_player_tooltip").replace(class_1039.const_140,class_129.method_1101(param1));
      }
      
      private function method_5433(param1:int) : String
      {
         return class_1110.method_3608(class_1039.const_3132,class_1039.const_3222,param1,false);
      }
      
      private function method_5580(param1:int) : String
      {
         return class_1110.method_5670(class_1039.const_3222,class_122.method_98(param1));
      }
      
      private function method_3289(param1:class_557) : String
      {
         return class_1110.method_5670(class_1039.const_3222,class_122.method_98(param1.var_2224));
      }
      
      private function method_4880(param1:class_557) : String
      {
         return class_1110.method_5670(class_1039.const_3222,class_122.method_98(param1.var_1011));
      }
      
      private function method_2158(param1:class_557) : String
      {
         return class_1110.method_5670(class_1039.const_3222,class_122.method_98(param1.var_4801));
      }
      
      private function method_1275(param1:class_557) : String
      {
         return class_1110.method_5670(class_1039.const_3222,param1.var_1712.toString()) + class_1110.method_5670(class_1039.const_3132," %");
      }
      
      private function method_5997() : void
      {
         if(false)
         {
            class_100.getInstance().method_6200(true);
         }
      }
   }
}
