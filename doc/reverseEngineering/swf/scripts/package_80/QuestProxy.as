package package_80
{
   import com.bigpoint.utils.class_129;
   import flash.utils.Dictionary;
   import mx.collections.ArrayList;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.questWindow.model.vo.HighscoreVO;
   import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;
   import net.bigpoint.darkorbit.mvc.questWindow.model.vo.class_1109;
   import net.bigpoint.darkorbit.net.class_53;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_146.QuestGiverWindowMediator;
   import package_27.class_82;
   import package_38.class_239;
   import package_38.class_454;
   import package_38.class_463;
   import package_38.class_589;
   import package_38.class_612;
   import package_38.class_774;
   import package_38.class_780;
   import package_38.class_798;
   import package_38.class_850;
   import package_38.class_861;
   import package_38.class_869;
   import package_38.class_934;
   import package_65.class_1094;
   import package_65.class_1096;
   import package_65.class_203;
   import package_65.class_233;
   import package_65.class_236;
   import package_65.class_240;
   import package_76.class_1110;
   import package_81.class_237;
   import package_9.class_61;
   
   public class QuestProxy extends Proxy implements IProxy
   {
      
      public static const const_2738:Dictionary = new Dictionary();
      
      public static const const_2044:Dictionary = new Dictionary();
      
      public static const const_3174:int = 103;
      
      public static const const_1698:int = 104;
      
      public static const const_2595:int = 105;
      
      public static const const_169:int = 106;
      
      public static const const_2549:int = 107;
      
      public static const NAME:String = "QuestProxy";
       
      
      private var var_2105:Dictionary;
      
      private var var_4482:ArrayList;
      
      private var var_3024:ArrayList;
      
      private var var_4644:ArrayList;
      
      private var var_4286:ArrayList;
      
      private var var_1742:class_53;
      
      private var parser:class_240;
      
      private var name_41:class_61;
      
      private var name_76:class_233;
      
      private var var_3910:QuestListItemVO;
      
      private var var_1672:class_203;
      
      public var var_3251:Boolean = false;
      
      public var var_658:Boolean = false;
      
      private var var_2901:int = -1;
      
      private var var_2086:int = -1;
      
      private var var_1961:Vector.<class_1109>;
      
      private var var_232:int;
      
      private var var_4519:Boolean = false;
      
      public function QuestProxy(param1:String = null, param2:Object = null)
      {
         this.var_2105 = new Dictionary();
         this.var_4482 = new ArrayList();
         this.var_3024 = new ArrayList();
         this.var_4644 = new ArrayList();
         this.var_4286 = new ArrayList();
         this.var_232 = QuestGiverWindowMediator.const_982;
         this.var_1961 = new Vector.<class_1109>();
         this.var_2105 = new Dictionary();
         this.var_1961.push(new class_1109(class_1109.const_1538));
         this.var_1961.push(new class_1109(class_1109.const_422));
         this.var_1961.push(new class_1109(class_1109.const_1392));
         super(param1,param2);
         this.parser = class_240.instance;
         this.var_232 = QuestGiverWindowMediator.const_982;
         const_2738[class_780.TIME] = "questType_time";
         const_2738[class_780.PVP] = "questType_pvp";
         const_2738[class_780.const_567] = "questType_kill";
         const_2738[class_780.const_2115] = "questType_discovery";
         const_2738[class_780.COLLECT] = "questType_collect";
         const_2738[class_780.const_1633] = "questType_collect";
         const_2738[class_780.const_830] = "questType_collect";
         const_2738[class_780.const_2813] = "questType_epic";
         const_2044[class_780.TIME] = "ttip_questwin_icon_TIME";
         const_2044[class_780.PVP] = "ttip_questwin_icon_PVP";
         const_2044[class_780.const_567] = "ttip_questwin_icon_KILL";
         const_2044[class_780.const_2115] = "ttip_questwin_icon_DISCOVER";
         const_2044[class_780.COLLECT] = "ttip_questwin_icon_COLLECT";
         const_2044[class_780.const_1633] = "ttip_questwin_icon_SUMMERGAMES3";
         const_2044[class_780.const_830] = "ttip_questwin_icon_WINTERGAMES09";
         const_2044[class_780.const_2813] = "ttip_questwin_icon_EPIC";
      }
      
      public function method_593(param1:class_454) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_2901 = param1.var_1514;
         this.var_2086 = param1.var_1376;
         this.var_4482 = new ArrayList();
         this.var_3024 = new ArrayList();
         this.var_4644 = new ArrayList();
         this.var_4286 = new ArrayList();
         this.var_4519 = param1.var_3366;
         var _loc2_:int = 0;
         while(_loc2_ < param1.list.length)
         {
            _loc3_ = new QuestListItemVO(param1.list[_loc2_].var_3107);
            _loc3_.questID = param1.list[_loc2_].var_1537;
            _loc3_.questPrio = param1.list[_loc2_].priority;
            _loc3_.rootCaseID = param1.list[_loc2_].var_1508;
            _loc3_.minLevel = param1.list[_loc2_].minLevel;
            _loc3_.name_160 = param1.list[_loc2_].name_160;
            _loc3_.acceptable = param1.list[_loc2_].var_3894.type == class_850.const_1601 || param1.list[_loc2_].var_3894.type == class_850.const_1713 && Boolean(_loc3_.type.method_6399(class_861.const_1515));
            _loc3_.completed = param1.list[_loc2_].var_3894.type == class_850.const_1713;
            _loc3_.method_225(param1.list[_loc2_].var_3894.type == class_850.const_2746);
            _loc4_ = param1.list[_loc2_].icon;
            _loc3_.questMainTypeIcon = const_2738[_loc4_.icon];
            if(this.var_2105[_loc3_.rootCaseID] != null)
            {
               _loc3_.ratings = (this.var_2105[_loc3_.rootCaseID] as QuestListItemVO).ratings;
               _loc3_.questSubTypeList = (this.var_2105[_loc3_.rootCaseID] as QuestListItemVO).questSubTypeList;
            }
            this.var_2105[_loc3_.rootCaseID] = _loc3_;
            if(this.var_3910)
            {
               if(this.var_3910.questID == _loc3_.questID)
               {
                  _loc3_.setSelected(true);
                  this.var_3910 = _loc3_;
               }
            }
            if(!_loc3_.acceptable)
            {
               _loc3_.notAcceptableReasons = "";
               for each(_loc5_ in param1.list[_loc2_].var_2716)
               {
                  _loc3_.notAcceptableReasons += this.method_624(_loc5_) + "\n\n";
               }
            }
            if(_loc3_.type.method_6399(class_861.const_1515))
            {
               if(_loc3_.type.method_6399(class_861.const_1906))
               {
                  _loc3_.name_160 = new <class_861>[new class_861(class_861.const_1906)];
                  this.method_4722.addItem(_loc3_);
                  if(_loc3_.completed)
                  {
                     (_loc6_ = _loc3_.clone()).name_160 = new <class_861>[new class_861(class_861.const_1515)];
                     _loc6_.extraInfo = "attempted";
                     this.method_3323.addItem(_loc6_);
                  }
               }
               else
               {
                  if(_loc3_.completed)
                  {
                     _loc3_.extraInfo = "attempted";
                  }
                  this.method_3323.addItem(_loc3_);
               }
            }
            else if(_loc3_.type.method_6399(class_861.EVENT))
            {
               this.method_1569.addItem(_loc3_);
            }
            else if(_loc3_.type.method_6399(class_861.const_2090))
            {
               this.method_5599.addItem(_loc3_);
            }
            else
            {
               this.method_4722.addItem(_loc3_);
            }
            _loc2_++;
         }
         this.method_6508();
         this.method_1795();
         if(!this.var_3251)
         {
            this.method_127(QuestGiverWindowMediator.const_2824);
         }
         if(this.var_658)
         {
            this.var_658 = false;
            this.method_3346(true);
            class_82.playSoundEffect(QuestProxy.const_1698);
         }
      }
      
      public function method_6477() : void
      {
         this.method_6508();
         this.method_1795();
      }
      
      private function method_6508() : void
      {
         this.method_4722.source.sort(this.method_4566);
         this.method_3323.source.sort(this.method_4566);
         this.method_5599.source.sort(this.method_4566);
         this.method_1569.source.sort(this.method_4566);
      }
      
      public function method_1795() : void
      {
         this.method_6486(this.var_232);
      }
      
      public function method_6486(param1:int) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:* = this.var_232 != param1;
         this.var_232 = param1;
         var _loc3_:ArrayList = new ArrayList();
         var _loc4_:ArrayList = new ArrayList();
         var _loc5_:Boolean = false;
         switch(param1)
         {
            case QuestGiverWindowMediator.const_2824:
               _loc3_ = this.method_4722;
               break;
            case QuestGiverWindowMediator.const_1079:
               _loc3_ = this.method_3323;
               _loc5_ = true;
               break;
            case QuestGiverWindowMediator.const_2978:
               _loc3_ = this.method_1569;
               break;
            case QuestGiverWindowMediator.const_1734:
               _loc3_ = this.method_5599;
         }
         if(this.var_4519)
         {
            for each(_loc6_ in _loc3_.source)
            {
               if(Boolean(_loc6_.type.method_6399(class_861.const_2167)) && (Boolean(this.method_3578(new class_1109(class_1109.const_1538))) && _loc6_.acceptable || Boolean(_loc6_.method_1333()) || Boolean(this.method_3578(new class_1109(class_1109.const_508))) && _loc6_.notAcceptableReasons.length > 0 || Boolean(this.method_3578(new class_1109(class_1109.const_1713))) && _loc6_.completed))
               {
                  _loc4_.addItem(_loc6_);
               }
            }
         }
         else if(!_loc5_)
         {
            for each(_loc7_ in _loc3_.source)
            {
               if(Boolean(this.method_3578(new class_1109(class_1109.const_1538))) && (_loc7_.acceptable || Boolean(_loc7_.method_1333())) || Boolean(this.method_3578(new class_1109(class_1109.const_508))) && _loc7_.notAcceptableReasons.length > 0 || Boolean(this.method_3578(new class_1109(class_1109.const_1713))) && _loc7_.completed)
               {
                  _loc4_.addItem(_loc7_);
               }
            }
         }
         else
         {
            for each(_loc8_ in _loc3_.source)
            {
               if(Boolean(this.method_3578(new class_1109(class_1109.const_422))) && (_loc8_.extraInfo != null && _loc8_.extraInfo.indexOf("attempted") != -1) || Boolean(this.method_3578(new class_1109(class_1109.const_1392))) && (_loc8_.extraInfo == null || _loc8_.extraInfo.indexOf("attempted") == -1))
               {
                  _loc4_.addItem(_loc8_);
               }
            }
         }
         if(param1 == QuestGiverWindowMediator.const_2824 || param1 == QuestGiverWindowMediator.const_1079)
         {
            sendNotification(class_237.const_3148,[_loc4_,this.var_2901,this.var_4519]);
         }
         else if(param1 == QuestGiverWindowMediator.const_2978)
         {
            sendNotification(class_237.const_3148,[_loc4_,this.var_2086,this.var_4519]);
         }
         else
         {
            sendNotification(class_237.const_3148,[_loc4_,this.var_2901,this.var_4519]);
         }
         this.method_127(param1,_loc2_,_loc4_);
      }
      
      private function method_127(param1:int, param2:Boolean = false, param3:ArrayList = null) : void
      {
         var _loc4_:* = null;
         switch(param1)
         {
            case QuestGiverWindowMediator.const_2824:
               _loc4_ = this.method_4722;
               break;
            case QuestGiverWindowMediator.const_1079:
               _loc4_ = this.method_3323;
               break;
            case QuestGiverWindowMediator.const_2978:
               _loc4_ = this.method_1569;
               break;
            case QuestGiverWindowMediator.const_1734:
               _loc4_ = this.method_5599;
         }
         if(_loc4_ == null)
         {
            return;
         }
         if(Boolean(param3) && param3.length > 0)
         {
            if(param2 || this.var_3910 == null || param3.source.indexOf(this.var_3910) == -1)
            {
               this.method_1313((param3.source[0] as QuestListItemVO).questID,(param3.source[0] as QuestListItemVO).rootCaseID);
            }
         }
         else if(param2)
         {
            this.var_3910 = null;
            this.var_1672 = null;
            sendNotification(class_237.const_2228);
         }
         if(_loc4_.length > 0)
         {
            sendNotification(class_237.const_1010,false);
         }
         else
         {
            sendNotification(class_237.const_1010,true);
         }
      }
      
      private function method_624(param1:class_869) : String
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         switch(param1.var_430)
         {
            case class_869.const_358:
               _loc2_ = class_88.getItem("ttip_questwin_notacceptable_TOOMANY").replace("%AMOUNT%",param1.maxValue + 1);
               break;
            case class_869.LEVEL:
               _loc2_ = class_88.getItem("ttip_questwin_notacceptable_TOOLOWLEVEL").replace("%AMOUNT%",param1.minValue);
               break;
            case class_869.const_3106:
               _loc3_ = 60000;
               _loc2_ = class_88.getItem("ttip_questwin_notacceptable_DATE").replace(/%BEGIN%/,class_129.method_3157(Math.ceil(Number(param1.minValue) / _loc3_),true)).replace(/%TIME%/,class_129.method_3157(Math.ceil((Number(param1.maxValue) - Number(param1.minValue)) / _loc3_),true));
               break;
            case class_869.const_1525:
               _loc2_ = this.method_2616(param1);
               break;
            default:
               _loc2_ = "";
         }
         return _loc2_;
      }
      
      private function method_2616(param1:class_869) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:String = "";
         _loc2_ += class_88.getItem("ttip_questwin_notacceptable_PRE_QUEST").replace(/%MIN%/,class_1110.method_5670(1506307,param1.minValue.toString())).replace(/%MAX%/,class_1110.method_5670(16719904,param1.maxValue.toString()));
         for each(_loc3_ in param1.var_4154)
         {
            _loc2_ += class_1110.BR + class_1110.method_5670(1506307,class_1094.method_5673(_loc3_.var_1537,_loc3_.var_3107));
         }
         for each(_loc4_ in param1.var_1438)
         {
            _loc2_ += class_1110.BR + class_1110.method_5670(16719904,class_1094.method_5673(_loc4_.var_1537,_loc4_.var_3107));
         }
         return _loc2_;
      }
      
      public function get method_4722() : ArrayList
      {
         return this.var_4482;
      }
      
      public function get method_3323() : ArrayList
      {
         return this.var_3024;
      }
      
      public function get method_5599() : ArrayList
      {
         return this.var_4644;
      }
      
      public function get method_1569() : ArrayList
      {
         return this.var_4286;
      }
      
      public function method_1313(param1:int, param2:int) : void
      {
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         if((this.var_232 == QuestGiverWindowMediator.const_2824 || this.var_232 == QuestGiverWindowMediator.const_1079) && this.var_2901 == 0)
         {
            _loc3_ = true;
         }
         else if(this.var_232 == QuestGiverWindowMediator.const_2978 && this.var_2086 == 0)
         {
            _loc3_ = true;
         }
         var _loc4_:class_203;
         if((_loc4_ = this.name_76.method_2703(param1)) != null && _loc4_.description != null && _loc4_.description != "")
         {
            if(this.var_3910)
            {
               this.var_3910.setSelected(false);
            }
            _loc6_ = this.var_2105[param2];
            this.var_3910 = _loc6_;
            this.var_3910.setSelected(true);
            this.var_1672 = _loc4_;
            sendNotification(class_237.const_3210,[_loc4_,_loc6_,_loc3_]);
            return;
         }
         var _loc5_:class_612;
         (_loc5_ = new class_612()).var_1537 = param1;
         this.var_1742.sendRequest(_loc5_);
      }
      
      public function method_5755(param1:class_53) : void
      {
         this.var_1742 = param1;
      }
      
      private function method_161() : Boolean
      {
         var _loc1_:Boolean = false;
         if((this.var_232 == QuestGiverWindowMediator.const_2824 || this.var_232 == QuestGiverWindowMediator.const_1079) && this.var_2901 == 0)
         {
            _loc1_ = true;
         }
         else if(this.var_232 == QuestGiverWindowMediator.const_2978 && this.var_2086 == 0)
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function method_3344(param1:class_589) : void
      {
         var _loc5_:* = null;
         var _loc2_:Boolean = Boolean(this.method_161());
         this.var_1672 = this.parser.method_5892(param1.definition);
         if(this.var_3910 != null)
         {
            this.var_3910.setSelected(false);
         }
         var _loc3_:QuestListItemVO = this.var_2105[this.var_1672.method_2963().id];
         this.var_3910 = _loc3_;
         this.var_3910.setSelected(true);
         _loc3_.questSubTypeList = param1.definition.icons;
         var _loc4_:ArrayList = new ArrayList();
         for each(_loc5_ in param1.ratings)
         {
            _loc4_.addItem(new HighscoreVO(_loc5_.rank,_loc5_.name,_loc5_.var_1675,true,_loc5_.var_2265,_loc5_.name_120,false));
         }
         if(param1.var_3390.name != null && param1.var_3390.name != "")
         {
            _loc4_.addItem(new HighscoreVO(param1.var_3390.rank,param1.var_3390.name,param1.var_3390.var_1675,true,param1.var_3390.var_2265,param1.var_3390.name_120,true));
         }
         _loc4_.source.sort(this.method_4488);
         _loc3_.ratings = _loc4_;
         sendNotification(class_237.const_3210,[this.var_1672,_loc3_,_loc2_]);
         this.var_2105[this.var_1672.method_2963().id] = _loc3_;
         this.method_3893(this.var_1672,this.var_1672.id);
      }
      
      public function refreshCurrentlySelectedQuestDetails() : void
      {
         if(Boolean(this.var_1672) && Boolean(this.var_3910))
         {
            sendNotification(class_237.const_3210,[this.var_1672,this.var_3910,this.method_161()]);
         }
      }
      
      public function method_1527(param1:int) : void
      {
         var _loc2_:class_463 = new class_463();
         _loc2_.var_1537 = param1;
         this.var_1742.sendRequest(_loc2_);
      }
      
      public function method_4433(param1:int) : void
      {
         var _loc2_:class_239 = new class_239();
         _loc2_.var_1537 = param1;
         this.var_1742.sendRequest(_loc2_);
      }
      
      public function method_179() : void
      {
         if(this.method_4722.length > 0)
         {
            if(!this.var_3251)
            {
               this.method_3346(true);
               class_82.playSoundEffect(QuestProxy.const_1698);
            }
            this.method_1313((this.method_4722.source[0] as QuestListItemVO).questID,(this.method_4722.source[0] as QuestListItemVO).rootCaseID);
            sendNotification(class_237.const_3148,[this.method_4722,this.var_2901,this.var_4519]);
            sendNotification(class_237.const_1010,false);
         }
         else
         {
            this.var_1742.sendRequest(new class_774());
            this.var_658 = true;
         }
      }
      
      public function method_3346(param1:Boolean) : void
      {
         this.var_3251 = param1;
      }
      
      public function method_4836(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         if(this.var_1672)
         {
            if(this.var_1672.method_3950[param1] != null)
            {
               _loc5_ = param2;
               _loc6_ = param3;
               _loc7_ = param4;
               (_loc8_ = class_236(this.var_1672.method_3950[param1])).current = _loc5_;
               _loc8_.runstate = _loc6_;
               _loc8_.completed = _loc7_;
               if(_loc8_.children.length > 0)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_.children.length)
                  {
                     (_loc10_ = _loc8_.children[_loc9_] as class_236).runstate = _loc6_;
                     _loc10_.completed = _loc7_;
                     _loc9_++;
                  }
               }
               sendNotification(class_237.const_2784,this.var_1672);
            }
         }
      }
      
      public function method_225(param1:class_203) : void
      {
         var _loc2_:QuestListItemVO = this.var_2105[param1.method_2963().id];
         if(_loc2_ != null)
         {
            if(this.var_1672 != null && this.var_1672.id == param1.id)
            {
               this.var_1672 = param1;
               this.var_3910 = _loc2_;
            }
            _loc2_.method_225(true);
            sendNotification(class_237.const_1934,_loc2_);
            sendNotification(class_237.const_2784,param1);
            this.method_6508();
            this.method_6486(this.var_232);
         }
      }
      
      public function method_5874(param1:int) : void
      {
         var _loc2_:QuestListItemVO = this.var_2105[param1];
         if(_loc2_ != null)
         {
            _loc2_.method_225(false);
            sendNotification(class_237.const_1934,_loc2_);
            this.method_6508();
            this.method_6486(this.var_232);
            if(this.var_3910 != null && this.var_3910.rootCaseID == param1)
            {
               this.method_1313(_loc2_.questID,_loc2_.rootCaseID);
            }
            this.refreshCurrentlySelectedQuestDetails();
         }
      }
      
      public function method_3893(param1:class_203, param2:int) : void
      {
         this.name_76.method_6351(param1,param2);
      }
      
      public function method_5808(param1:class_61) : void
      {
         this.name_41 = param1;
         this.name_76 = param1.name_76;
      }
      
      public function questAccomplished(param1:int, param2:int) : void
      {
         this.var_1672 = null;
         this.var_3910 = null;
         sendNotification(class_237.const_2228);
         this.var_3251 = false;
         if(this.var_2105[param2])
         {
            (this.var_2105[param2] as QuestListItemVO).completed = true;
            this.method_5874(param2);
         }
         this.method_6508();
         this.method_6486(this.var_232);
      }
      
      private function method_4488(param1:HighscoreVO, param2:HighscoreVO) : int
      {
         if(param1.isHero)
         {
            return 1;
         }
         if(param2.isHero)
         {
            return -1;
         }
         if(param1.position > param2.position)
         {
            return 1;
         }
         if(param1.position < param2.position)
         {
            return -1;
         }
         return 0;
      }
      
      public function method_4124() : void
      {
         this.var_1961 = new Vector.<class_1109>();
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_1538));
         }
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_508));
         }
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_1713));
         }
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_280));
         }
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_1392));
         }
         if(false)
         {
            this.var_1961.push(new class_1109(class_1109.const_422));
         }
         this.method_6486(this.var_232);
      }
      
      private function method_3578(param1:class_1109) : Boolean
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_1961)
         {
            if(param1.value == _loc2_.value)
            {
               return true;
            }
         }
         return false;
      }
      
      private function method_4566(param1:QuestListItemVO, param2:QuestListItemVO) : Number
      {
         var _loc3_:int = 0;
         _loc3_ = param2.questPrio - param1.questPrio;
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         if(param1.minLevel != param2.minLevel)
         {
            if(false)
            {
               return param1.minLevel - param2.minLevel;
            }
            return param2.minLevel - param1.minLevel;
         }
         Number(this.method_216(param1)) - Number(this.method_216(param2));
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         return param1.questID - param2.questID;
      }
      
      private function method_216(param1:QuestListItemVO) : int
      {
         if(param1.type.method_6399(class_1096.const_1484))
         {
            return 0;
         }
         if(param1.method_1333())
         {
            return 1;
         }
         if(Boolean(param1.type.method_6399(class_861.const_2167)) && !param1.completed)
         {
            return 2;
         }
         if(param1.completed)
         {
            return 5;
         }
         if(!param1.acceptable)
         {
            return 4;
         }
         return 3;
      }
      
      public function get selectedQuest() : class_203
      {
         return this.var_1672;
      }
   }
}
