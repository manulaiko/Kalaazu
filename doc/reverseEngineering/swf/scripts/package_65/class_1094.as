package package_65
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import package_38.class_861;
   
   public class class_1094
   {
       
      
      public function class_1094()
      {
         super();
      }
      
      public static function method_5673(param1:int, param2:String, param3:class_1096 = null) : String
      {
         return method_232("quest_title",param1,param2) || class_1094.method_3482(param1,param3);
      }
      
      public static function method_3606(param1:int, param2:String, param3:class_1096 = null) : String
      {
         return method_232("quest_description",param1,param2) || class_1094.method_2485(param1,param3);
      }
      
      private static function method_232(param1:String, param2:int, param3:String) : String
      {
         var _loc5_:* = null;
         var _loc4_:Vector.<String>;
         (_loc4_ = new Vector.<String>()).push(param1 + "_" + param2 + "_" + class_81.method_2322);
         _loc4_.push(param1 + "_" + param2);
         if(param3)
         {
            _loc4_.push(param1 + "_" + param3 + "_" + class_81.method_2322);
            _loc4_.push(param1 + "_" + param3);
         }
         _loc4_.push(param1 + "_generic");
         while(_loc4_.length)
         {
            if((Boolean(_loc5_ = class_88.method_734("quests",_loc4_.shift()))) && _loc5_.charAt(0) != "{")
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      private static function method_3482(param1:int, param2:class_1096 = null) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc3_:String = "";
         if(param2 == null)
         {
            param2 = new class_1096();
         }
         switch(param1)
         {
            case 624:
            case 625:
            case 626:
            case 627:
            case 628:
               _loc3_ = class_88.method_734("quests","quest_title_halloween10");
               break;
            case 629:
            case 630:
            case 631:
            case 632:
            case 633:
            case 634:
            case 635:
            case 636:
            case 637:
            case 638:
            case 639:
            case 640:
            case 641:
            case 642:
            case 643:
               _loc3_ = class_88.method_734("quests","quest_title_pumpkinsdays10");
               break;
            case 714:
            case 715:
            case 716:
            case 717:
            case 718:
            case 719:
            case 720:
            case 721:
            case 724:
            case 725:
            case 726:
            case 727:
            case 728:
            case 729:
            case 730:
            case 731:
            case 732:
            case 733:
            case 734:
            case 735:
            case 736:
            case 737:
               _loc3_ = class_88.method_734("quests","quest_title_calendar_quest_2010_order").replace(/%NUMBER%/,(param1 - 713).toString());
               break;
            case 722:
               _loc3_ = class_88.method_734("quests","quest_title_calendar_quest_2010_order").replace(/%NUMBER%/,"10");
               break;
            case 723:
               _loc3_ = class_88.method_734("quests","quest_title_calendar_quest_2010_order").replace(/%NUMBER%/,"9");
               break;
            case 817:
            case 818:
            case 819:
               _loc3_ = class_88.method_734("quests","quest_title_wintergames2011_order").replace(/%NUMBER%/,"1");
               break;
            case 828:
            case 829:
            case 830:
               _loc3_ = class_88.method_734("quests","quest_title_wintergames2011_order").replace(/%NUMBER%/,"10");
               break;
            case 820:
            case 821:
            case 822:
            case 823:
            case 824:
            case 825:
            case 826:
            case 827:
               _loc3_ = class_88.method_734("quests","quest_title_wintergames2011_order").replace(/%NUMBER%/,(param1 - 818).toString());
               break;
            case 831:
            case 832:
            case 833:
            case 834:
            case 835:
            case 836:
            case 837:
            case 838:
            case 839:
            case 840:
            case 841:
            case 842:
            case 843:
            case 844:
            case 845:
            case 846:
            case 847:
            case 848:
            case 849:
            case 850:
               _loc3_ = class_88.method_734("quests","quest_title_wintergames2011_order").replace(/%NUMBER%/,(param1 - 820).toString());
               break;
            case 1400:
            case 1401:
            case 1402:
            case 1403:
               _loc3_ = class_88.method_734("quests","quest_title_" + (param1 - 371));
               break;
            case 871:
            case 872:
            case 873:
            case 876:
            case 877:
            case 1100:
            case 1101:
            case 1102:
            case 1103:
            case 1104:
            case 1105:
            case 1106:
            case 1107:
            case 1108:
            case 1109:
            case 1110:
            case 1111:
            case 1112:
            case 1113:
            case 1114:
            case 1115:
            case 1116:
            case 1117:
            case 1118:
            case 1119:
            case 1120:
            case 1121:
            case 1122:
            case 1123:
            case 1124:
            case 1125:
            case 1126:
            case 1127:
            case 1128:
            case 1129:
            case 1130:
            case 1131:
            case 1132:
            case 1133:
            case 1134:
            case 1135:
            case 1136:
            case 1137:
            case 1138:
            case 1139:
            case 1140:
            case 1141:
            case 1300:
            case 1301:
            case 1302:
            case 1303:
            case 1304:
            case 1305:
            case 1306:
            case 1307:
            case 1308:
            case 1309:
            case 1310:
            case 1311:
            case 1320:
            case 1321:
            case 1322:
            case 1323:
            case 1324:
            case 1325:
            case 1326:
            case 1327:
            case 1328:
            case 1329:
            case 1330:
            case 1331:
            case 1332:
            case 1333:
            case 1334:
            case 1340:
            case 1341:
            case 1342:
            case 1343:
            case 1344:
            case 1345:
            case 1346:
            case 1347:
            case 1348:
            case 1349:
            case 1350:
            case 1351:
            case 1352:
            case 1360:
            case 1361:
            case 1362:
            case 1363:
            case 1364:
            case 1365:
            case 1366:
            case 1367:
            case 1368:
            case 1369:
            case 1370:
            case 1371:
            case 1372:
            case 1373:
            case 1374:
               _loc3_ = class_88.method_734("quests","quest_title_" + param1);
               break;
            case 21033:
            case 21034:
            case 21035:
            case 21036:
            case 21037:
            case 21038:
            case 21039:
            case 21040:
            case 21041:
            case 21042:
            case 21043:
            case 21044:
            case 21045:
            case 21046:
            case 21047:
            case 21048:
            case 21049:
            case 21050:
            case 21051:
            case 21052:
            case 21053:
            case 21054:
            case 21055:
            case 21056:
            case 21057:
            case 21058:
            case 21059:
            case 21060:
            case 21061:
            case 21062:
            case 21063:
            case 21064:
            case 21065:
            case 21066:
            case 21067:
            case 21068:
            case 21069:
            case 21070:
            case 21071:
            case 21072:
            case 21073:
            case 21074:
            case 21075:
            case 21076:
            case 21077:
            case 21078:
            case 21079:
            case 21080:
            case 21081:
            case 21082:
            case 21083:
            case 21084:
            case 21085:
            case 21086:
            case 21087:
            case 21088:
            case 21089:
            case 21090:
            case 21091:
            case 21092:
               _loc4_ = "quest_title_2";
               _loc5_ = param1 % 2 != 0;
               _loc6_ = Math.floor((param1 - 21035) / 2) % 7 == 0 && (param1 - 21035) / 2 / 7 >= 1;
               if(_loc5_)
               {
                  if(_loc6_)
                  {
                     _loc4_ += "1049";
                  }
                  else
                  {
                     _loc4_ += "1033";
                  }
               }
               else if(_loc6_)
               {
                  _loc4_ += "1050";
               }
               else
               {
                  _loc4_ += "1034";
               }
               if(_loc6_)
               {
                  _loc7_ = int((param1 - 21035) / 7 * 0.5);
               }
               else
               {
                  _loc7_ = int((param1 - 21033) * 0.5) + 1 - int((param1 - 21035) / 7 * 0.5);
               }
               _loc3_ = class_88.method_734("quests",_loc4_).replace(/%Number%/,_loc7_);
               break;
            case 21093:
            case 21094:
               _loc3_ = class_88.method_734("quests","quest_title_" + param1);
               break;
            case 456:
               _loc3_ = class_88.method_734("quests","quest_title_435");
               break;
            case 457:
               _loc3_ = class_88.method_734("quests","quest_title_435");
               break;
            case 458:
               _loc3_ = class_88.method_734("quests","quest_title_439");
               break;
            case 459:
               _loc3_ = class_88.method_734("quests","quest_title_439");
               break;
            case 460:
               _loc3_ = class_88.method_734("quests","quest_title_443");
               break;
            case 461:
               _loc3_ = class_88.method_734("quests","quest_title_443");
               break;
            case 462:
               _loc3_ = class_88.method_734("quests","quest_title_444");
               break;
            case 463:
               _loc3_ = class_88.method_734("quests","quest_title_444");
               break;
            case 464:
               _loc3_ = class_88.method_734("quests","quest_title_445");
               break;
            case 465:
               _loc3_ = class_88.method_734("quests","quest_title_445");
               break;
            case 466:
               _loc3_ = class_88.method_734("quests","quest_title_446");
               break;
            case 467:
               _loc3_ = class_88.method_734("quests","quest_title_446");
               break;
            case 468:
               _loc3_ = class_88.method_734("quests","quest_title_446");
               break;
            case 469:
               _loc3_ = class_88.method_734("quests","quest_title_437");
               break;
            case 470:
               _loc3_ = class_88.method_734("quests","quest_title_437");
               break;
            case 531:
            case 532:
            case 533:
            case 534:
            case 535:
            case 536:
            case 537:
            case 538:
            case 539:
            case 540:
            case 541:
            case 542:
            case 543:
            case 544:
            case 545:
            case 546:
            case 547:
            case 548:
            case 549:
            case 550:
            case 551:
            case 552:
            case 553:
            case 554:
            case 555:
               _loc3_ = class_88.method_734("quests","quest_title_wg09").replace(/%ID%/,param1.toString());
               break;
            case 749:
            case 750:
            case 751:
            case 752:
            case 753:
            case 754:
            case 755:
            case 756:
               _loc3_ = class_88.method_734("quests","quest_title_50mioUserEvent_order").replace(/%NUMBER%/,(param1 - 748).toString());
               break;
            case 758:
            case 759:
            case 760:
            case 761:
            case 762:
            case 763:
            case 764:
            case 765:
               _loc3_ = class_88.method_734("quests","quest_title_50mioUserEvent_order").replace(/%NUMBER%/,(param1 - 748 - 1).toString());
               break;
            case 1001:
            case 1002:
               _loc3_ = class_88.method_734("quests","quest_title_1000");
               break;
            case 1008:
            case 1009:
            case 1010:
               _loc3_ = class_88.method_734("quests","quest_title_1010");
               break;
            case 1024:
            case 1025:
            case 1026:
               _loc3_ = class_88.method_734("quests","quest_title_1024");
               break;
            case 1035:
               _loc3_ = class_88.method_734("quests","quest_title_1033").replace(/%Number%/,2);
               break;
            case 1036:
               _loc3_ = class_88.method_734("quests","quest_title_1034").replace(/%Number%/,2);
               break;
            case 500002:
               _loc3_ = method_5022(1029);
               break;
            case 500003:
               _loc3_ = method_5022(1030);
               break;
            case 500004:
               _loc3_ = method_5022(1031);
               break;
            case 500005:
               _loc3_ = method_5022(1032);
               break;
            default:
               if(param2 && param2.method_6399(class_861.EVENT) && method_5022(param1).charAt(0) == "{")
               {
                  _loc3_ = class_88.method_734("quests","quest_special_headline");
                  break;
               }
               _loc3_ = method_5022(param1);
               break;
         }
         if(param2.method_6399(class_1096.const_1484))
         {
            _loc3_ = class_88.method_734("quests","quest_title_honor");
         }
         return _loc3_;
      }
      
      private static function method_5022(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc2_ = class_88.method_734("quests","quest_title_" + param1);
         if(param1.toString().substr(0,1) == "1")
         {
            _loc3_ = param1.toString().substr(1,2) + param1.toString().substr(4,2);
         }
         else if(param1.toString().substr(0,1) == "4")
         {
            _loc3_ = param1.toString().substr(1,2);
         }
         else if(param1.toString().substr(0,1) == "5")
         {
            _loc3_ = param1.toString().substr(4,2);
         }
         _loc2_ = _loc2_.replace("%CODE%",_loc3_);
         return _loc2_.replace("%Number%",_loc3_);
      }
      
      private static function method_2485(param1:int, param2:class_1096 = null) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = false;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc3_:String = "";
         if(param2 == null)
         {
            param2 = new class_1096();
         }
         if(param2.method_6399(class_1096.const_1484))
         {
            _loc3_ = class_88.method_734("quests","quest_special_honor_targets");
         }
         else
         {
            switch(param1)
            {
               case 456:
                  _loc3_ = class_88.method_734("quests","quest_description_435");
                  break;
               case 457:
                  _loc3_ = class_88.method_734("quests","quest_description_435");
                  break;
               case 458:
                  _loc3_ = class_88.method_734("quests","quest_description_439").replace(/EIC/,"MMO");
                  break;
               case 459:
                  _loc3_ = class_88.method_734("quests","quest_description_439").replace(/EIC/,"VRU");
                  break;
               case 460:
                  _loc3_ = class_88.method_734("quests","quest_description_443");
                  break;
               case 461:
                  _loc3_ = class_88.method_734("quests","quest_description_443");
                  break;
               case 462:
                  _loc3_ = class_88.method_734("quests","quest_description_444");
                  break;
               case 463:
                  _loc3_ = class_88.method_734("quests","quest_description_444");
                  break;
               case 464:
                  _loc3_ = class_88.method_734("quests","quest_description_445");
                  break;
               case 465:
                  _loc3_ = class_88.method_734("quests","quest_description_445");
                  break;
               case 466:
                  _loc3_ = class_88.method_734("quests","quest_description_446");
                  break;
               case 467:
                  _loc3_ = class_88.method_734("quests","quest_description_446");
                  break;
               case 468:
                  _loc3_ = class_88.method_734("quests","quest_description_446");
                  break;
               case 469:
                  _loc3_ = class_88.method_734("quests","quest_description_437");
                  break;
               case 470:
                  _loc3_ = class_88.method_734("quests","quest_description_437");
                  break;
               case 531:
               case 532:
               case 533:
               case 534:
               case 535:
               case 536:
               case 537:
               case 538:
               case 539:
               case 540:
               case 541:
               case 542:
               case 543:
               case 544:
               case 545:
               case 546:
               case 547:
               case 548:
               case 549:
               case 550:
               case 551:
               case 552:
               case 553:
               case 554:
               case 555:
                  _loc3_ = class_88.method_734("quests","quest_description_wg09");
                  break;
               case 629:
               case 630:
               case 631:
               case 632:
               case 633:
               case 634:
               case 635:
               case 636:
               case 637:
               case 638:
               case 639:
               case 640:
               case 641:
               case 642:
               case 643:
                  _loc3_ = class_88.method_734("quests","quest_description_halloween10");
                  break;
               case 624:
               case 625:
               case 627:
               case 628:
                  _loc3_ = class_88.method_734("quests","quest_description_pumpkinsdays10");
                  break;
               case 749:
               case 750:
               case 751:
               case 752:
               case 753:
               case 754:
               case 755:
               case 756:
               case 758:
               case 759:
               case 760:
               case 761:
               case 762:
               case 763:
               case 764:
               case 765:
                  _loc3_ = class_88.method_734("quests","quest_teaser_50mioUserEvent");
                  break;
               case 827:
                  _loc3_ = class_88.method_734("quests","quest_teaser_wintergames2011");
                  break;
               case 1001:
               case 1002:
                  _loc3_ = class_88.method_734("quests","quest_description_1000");
                  break;
               case 1008:
                  _loc3_ = class_88.method_734("quests","quest_description_1010").replace(/%Coordinates%/,"10/10");
                  break;
               case 1009:
                  _loc3_ = class_88.method_734("quests","quest_description_1010").replace(/%Coordinates%/,"195/10");
                  break;
               case 1010:
                  _loc3_ = class_88.method_734("quests","quest_description_1010").replace(/%Coordinates%/,"190/125");
                  break;
               case 1012:
                  _loc3_ = class_88.method_734("quests","quest_description_1012_2");
                  break;
               case 1024:
               case 1025:
               case 1026:
                  _loc3_ = class_88.method_734("quests","quest_description_1024");
                  break;
               case 1400:
               case 1401:
               case 1402:
               case 1403:
                  _loc4_ = "quest_description_";
                  _loc3_ = class_88.method_734("quests",_loc4_ + (param1 - 371));
                  break;
               case 21033:
               case 21034:
               case 21035:
               case 21036:
               case 21037:
               case 21038:
               case 21039:
               case 21040:
               case 21041:
               case 21042:
               case 21043:
               case 21044:
               case 21045:
               case 21046:
               case 21047:
               case 21048:
               case 21049:
               case 21050:
               case 21051:
               case 21052:
               case 21053:
               case 21054:
               case 21055:
               case 21056:
               case 21057:
               case 21058:
               case 21059:
               case 21060:
               case 21061:
               case 21062:
               case 21063:
               case 21064:
               case 21065:
               case 21066:
               case 21067:
               case 21068:
               case 21069:
               case 21070:
               case 21071:
               case 21072:
               case 21073:
               case 21074:
               case 21075:
               case 21076:
               case 21077:
               case 21078:
               case 21079:
               case 21080:
               case 21081:
               case 21082:
               case 21083:
               case 21084:
               case 21085:
               case 21086:
               case 21087:
               case 21088:
               case 21089:
               case 21090:
               case 21091:
               case 21092:
                  _loc5_ = "quest_description_2";
                  _loc6_ = param1 % 2 != 0;
                  _loc7_ = Math.floor((param1 - 21035) / 2) % 7 == 0 && (param1 - 21035) / 2 / 7 >= 1;
                  if(_loc6_)
                  {
                     if(_loc7_)
                     {
                        _loc5_ += "1049";
                     }
                     else
                     {
                        _loc5_ += "1033";
                     }
                  }
                  else if(_loc7_)
                  {
                     _loc5_ += "1050";
                  }
                  else
                  {
                     _loc5_ += "1034";
                  }
                  if(_loc7_)
                  {
                     _loc8_ = int((param1 - 1035) / 7 * 0.5);
                  }
                  else
                  {
                     _loc8_ = int((param1 - 1033) * 0.5) + 1 - int((param1 - 1035) / 7 * 0.5);
                  }
                  _loc3_ = class_88.method_734("quests",_loc5_);
                  break;
               case 20000:
               case 20001:
               case 20002:
               case 20003:
               case 20004:
               case 20005:
               case 20006:
               case 20007:
               case 20008:
               case 20009:
               case 20010:
               case 20011:
               case 20012:
               case 1:
               case 2:
               case 20014:
                  _loc3_ = class_88.method_734("quests","quest_description_" + param1.toString() + "_" + String(class_126.instance.method_2919[class_81.factionID]).toLowerCase());
                  break;
               case 500002:
                  _loc3_ = method_3016(1029);
                  break;
               case 500003:
                  _loc3_ = method_3016(1030);
                  break;
               case 500004:
                  _loc3_ = method_3016(1031);
                  break;
               case 500005:
                  _loc3_ = method_3016(1032);
                  break;
               default:
                  _loc3_ = method_3016(param1);
            }
         }
         return _loc3_;
      }
      
      private static function method_3016(param1:int) : String
      {
         var _loc2_:String = "";
         if(class_126.getInstance().method_1709[class_81.factionID] != undefined)
         {
            _loc2_ = class_88.method_734("quests","quest_description_" + param1 + "_" + class_126.getInstance().method_1709[class_81.factionID]);
         }
         if(_loc2_ == "" || _loc2_ == "{quests.quest_description_" + param1 + "_" + class_126.getInstance().method_1709[class_81.factionID] + "}")
         {
            _loc2_ = class_88.method_734("quests","quest_description_" + param1);
         }
         return _loc2_;
      }
   }
}
