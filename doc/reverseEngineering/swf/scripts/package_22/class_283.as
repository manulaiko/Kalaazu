package package_22
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_283
   {
      
      private static const const_2426:String = "FREE";
      
      private static const const_1120:String = "VOUCHER";
      
      private static const const_1437:String = "URI";
      
      private static const const_2107:String = "IMPOSSIBLE";
      
      private static const const_2313:String = "PREMIUM";
      
      private static const const_1427:String = "SHIP";
      
      private static const const_2916:String = "MAP";
      
      private static const const_903:String = "EVENT";
      
      private static const const_2438:String = "GENERAL";
       
      
      public var var_86:String;
      
      public var detail:String;
      
      public function class_283(param1:String, param2:String)
      {
         super();
         this.detail = param2;
         this.var_86 = param1;
      }
      
      public function method_2400() : Boolean
      {
         return this.var_86 != const_2107;
      }
      
      public function method_6028() : String
      {
         var _loc1_:* = null;
         switch(this.var_86)
         {
            case const_2426:
               _loc1_ = class_88.getItem("btn_repair_for_free");
               break;
            case const_1120:
               _loc1_ = class_88.getItem("btn_repair_voucher");
               break;
            case const_1437:
               _loc1_ = class_88.getItem("btn_repair_for_uri").replace(/%count%/,this.detail);
               break;
            case const_2107:
               _loc1_ = class_88.getItem("btn_repair_impossible");
         }
         return _loc1_;
      }
      
      public function method_3393() : String
      {
         var _loc1_:* = null;
         loop0:
         switch(this.var_86)
         {
            case const_2426:
               _loc1_ = class_88.getItem("msg_repair_now") + " ";
               switch(this.detail)
               {
                  case const_903:
                     _loc1_ += class_88.getItem("msg_free_repair_cause_event");
                     break loop0;
                  case const_1427:
                     _loc1_ += class_88.getItem("msg_free_repair_cause_ship");
                     break loop0;
                  case const_2313:
                     _loc1_ += class_88.getItem("msg_free_repair_cause_premium");
                     break loop0;
                  case const_2916:
                     _loc1_ += class_88.getItem("msg_free_repair_cause_map");
                     break loop0;
                  case const_2438:
                     _loc1_ += class_88.getItem("msg_free_repair_cause_general");
               }
               break;
            case const_1120:
               _loc1_ = class_88.getItem("msg_repair_now") + " ";
               _loc1_ += class_88.getItem("msg_repair_voucher") + " ";
               if(this.detail == "1")
               {
                  _loc1_ += class_88.getItem("msg_repair_addon_one_voucher_left");
                  break;
               }
               _loc1_ += class_88.getItem("msg_repair_addon_vouchers_left").replace(/%count%/,this.detail);
               break;
            case const_1437:
               _loc1_ = class_88.getItem("msg_repair_now") + " ";
               _loc1_ += class_88.getItem("msg_repair_for_uri").replace(/%count%/,this.detail);
               break;
            case const_2107:
               _loc1_ = class_88.getItem("msg_repair_impossible");
         }
         return _loc1_;
      }
   }
}
