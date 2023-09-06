package package_208
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import package_105.class_282;
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_777;
   import package_72.class_190;
   
   public class class_1231 extends class_170
   {
       
      
      public function class_1231()
      {
         super();
      }
      
      public static function method_2887(param1:int) : void
      {
         switch(param1)
         {
            case class_282.const_594:
               class_88.method_4884("title_ranked_hunt",class_88.getItem("title_pirate_hunt"));
               class_88.method_4884("ttip_ranked_hunt_point",class_88.getItem("ttip_bounty_points"));
               class_88.method_4884("ttip_clan_ranked_hunt_point",class_88.getItem("ttip_clan_bounty_points"));
               class_88.method_4884("log_msg_ranked_hunt_point_s",class_88.getItem("log_msg_bounty_point"));
               class_88.method_4884("log_msg_ranked_hunt_point_p",class_88.getItem("log_msg_bounty_points"));
               break;
            case class_282.const_2576:
            default:
               class_88.method_4884("title_ranked_hunt",class_88.getItem("title_npc_hunt"));
               class_88.method_4884("ttip_ranked_hunt_point",class_88.getItem("ttip_npc_hunt_point"));
               class_88.method_4884("ttip_clan_ranked_hunt_point",class_88.getItem("ttip_clan_npc_hunt_point"));
               class_88.method_4884("log_msg_ranked_hunt_point_s",class_88.getItem("log_msg_npc_hunt_point_s"));
               class_88.method_4884("log_msg_ranked_hunt_point_p",class_88.getItem("log_msg_npc_hunt_point_p"));
         }
      }
      
      public static function method_2985() : void
      {
         method_2887(class_282.const_2576);
         class_81.var_121 = new class_282();
         if(class_81.var_121.var_3580 == null)
         {
            class_81.var_121.var_3580 = [];
         }
      }
      
      public static function method_4924(param1:int) : class_190
      {
         var _loc3_:* = null;
         if(true)
         {
            method_2985();
         }
         var _loc2_:class_190 = class_81.var_121.var_3580[param1] as class_190;
         if(_loc2_ == null)
         {
            _loc3_ = new class_777(param1);
            var_574.method_6154().sendRequest(_loc3_);
            _loc2_ = new class_190();
            class_81.var_121.var_3580[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public static function method_4720(param1:int) : void
      {
         class_81.var_121.var_3003 = param1;
         var _loc2_:class_190 = method_4924(param1);
         if(_loc2_.targetList != null)
         {
            var_574.method_4489().method_1917(param1);
         }
      }
   }
}
