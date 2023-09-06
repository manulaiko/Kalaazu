package net.bigpoint.darkorbit.mvc.questWindow.model.vo
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayList;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import package_38.class_780;
   import package_38.class_861;
   import package_65.class_1094;
   import package_65.class_1096;
   
   public class QuestListItemVO implements IEventDispatcher
   {
       
      
      private var var_1541:int;
      
      private var var_2378:int;
      
      private var var_1866:int;
      
      private var var_1926:Vector.<class_861>;
      
      private var _type:class_1096;
      
      private var var_1791:String;
      
      private var var_4898:String;
      
      private var var_3364:String;
      
      private var var_1237:int;
      
      private var var_214:String;
      
      private var var_4215:Vector.<class_780>;
      
      private var var_358:String;
      
      private var var_4291:Boolean = false;
      
      private var _selected:Boolean = false;
      
      private var _completed:Boolean = false;
      
      private var var_1151:Boolean = false;
      
      private var var_4998:String = "";
      
      private var var_649:ArrayList = null;
      
      private var var_3195:String;
      
      private var var_1444:EventDispatcher;
      
      public function QuestListItemVO(param1:String = null)
      {
         this._type = new class_1096();
         this.var_1444 = new EventDispatcher(IEventDispatcher(this));
         super();
         this.var_3195 = param1;
      }
      
      public function get questMainTypeIcon() : String
      {
         return this.var_214;
      }
      
      private function set method_3791(param1:String) : void
      {
         this.var_214 = param1;
      }
      
      public function get questTitle() : String
      {
         if(this.var_1791 == null)
         {
            this.var_1791 = class_1094.method_5673(this.questID,this.var_3195,this.type);
         }
         return this.var_1791;
      }
      
      public function get method_4615() : String
      {
         if(this.var_4898 == null)
         {
            this.var_4898 = class_1094.method_5673(this.questID,this.var_3195,this.type);
         }
         return this.var_4898;
      }
      
      public function get questListHTMLaddon() : String
      {
         return this.var_3364;
      }
      
      private function set method_4841(param1:String) : void
      {
         this.var_3364 = param1;
      }
      
      public function get questSubTypeList() : Vector.<class_780>
      {
         return this.var_4215;
      }
      
      private function set method_4301(param1:Vector.<class_780>) : void
      {
         this.var_4215 = param1;
      }
      
      public function get rootCaseID() : int
      {
         return this.var_1237;
      }
      
      private function set method_6289(param1:int) : void
      {
         this.var_1237 = param1;
      }
      
      public function get questID() : int
      {
         return this.var_2378;
      }
      
      private function set method_2401(param1:int) : void
      {
         this.var_2378 = param1;
      }
      
      public function get minLevel() : int
      {
         return this.var_1866;
      }
      
      private function set method_1565(param1:int) : void
      {
         this.var_1866 = param1;
      }
      
      public function get extraInfo() : String
      {
         return this.var_358;
      }
      
      private function set method_4816(param1:String) : void
      {
         this.var_358 = param1;
      }
      
      public function method_1333() : Boolean
      {
         return this.var_4291;
      }
      
      public function method_225(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         if(param1)
         {
            this.questListHTMLaddon = "<font size=\"10\" color=\"#cccc99\">" + class_88.getItem("label_mission_in_progress") + "</font>";
         }
         else
         {
            this.var_4898 = this.questTitle;
            if(this.completed)
            {
               if(!this.type.method_6399(class_861.const_1515))
               {
                  _loc2_ = true;
               }
               this.questListHTMLaddon = "<font size=\"10\">" + class_88.getItem("label_quest_completed") + "</font>";
            }
            else if(this.minLevel > Math.max(0,class_81.level) && !this.acceptable)
            {
               _loc2_ = true;
               this.questListHTMLaddon = "<font color=\"#a10000\" size=\"10\">" + class_88.getItem("label_quest_level_restriction").replace("%COUNT%",this.minLevel) + "</font>";
            }
            else if(!this.acceptable)
            {
               _loc2_ = true;
            }
            else
            {
               this.questListHTMLaddon = "";
            }
         }
         if(this.method_4535())
         {
            this.var_4898 = "<font color=\"#ffcc00\">" + this.questTitle + "</font>";
         }
         else if(_loc2_)
         {
            this.var_4898 = "<font color=\"#9b9b9b\">" + this.questTitle + "</font>";
         }
         else
         {
            this.var_4898 = "<font color=\"#ffffff\">" + this.questTitle + "</font>";
         }
         this.var_4291 = param1;
      }
      
      public function set name_160(param1:Vector.<class_861>) : void
      {
         var _loc2_:* = null;
         this.var_1926 = new Vector.<class_861>();
         for each(_loc2_ in param1)
         {
            this.var_1926.push(_loc2_);
         }
         this._type.init(this.var_1926);
         if(this.var_2378 == 10000)
         {
            this._type.setType(class_1096.const_1484);
         }
      }
      
      public function get type() : class_1096
      {
         return this._type;
      }
      
      public function method_4535() : Boolean
      {
         return this._selected;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this._selected = param1;
         this.method_225(this.method_1333());
      }
      
      private function set name_77(param1:Boolean) : void
      {
         this._completed = param1;
         this.method_225(this.method_1333());
      }
      
      public function get completed() : Boolean
      {
         return this._completed;
      }
      
      public function get acceptable() : Boolean
      {
         return this.var_1151;
      }
      
      private function set method_4015(param1:Boolean) : void
      {
         this.var_1151 = param1;
      }
      
      public function get notAcceptableReasons() : String
      {
         return this.var_4998;
      }
      
      private function set method_3834(param1:String) : void
      {
         this.var_4998 = param1;
      }
      
      public function clone() : QuestListItemVO
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:QuestListItemVO = new QuestListItemVO();
         _loc1_.acceptable = this.acceptable;
         _loc1_.completed = this.completed;
         _loc1_.extraInfo = this.extraInfo;
         _loc1_.minLevel = this.minLevel;
         _loc1_.notAcceptableReasons = this.notAcceptableReasons;
         _loc1_.method_225(this.method_1333());
         _loc1_.questID = this.questID;
         _loc1_.questMainTypeIcon = this.questMainTypeIcon;
         _loc1_.questSubTypeList = new Vector.<class_780>();
         for each(_loc2_ in this.questSubTypeList)
         {
            _loc1_.questSubTypeList.push(_loc2_);
         }
         _loc1_.questListHTMLaddon = this.questListHTMLaddon;
         _loc1_.rootCaseID = this.rootCaseID;
         _loc1_.setSelected(this.method_4535());
         _loc3_ = new Vector.<class_861>();
         for each(_loc4_ in this.var_1926)
         {
            _loc3_.push(_loc4_);
         }
         _loc1_.name_160 = _loc3_;
         _loc1_.ratings = new ArrayList();
         for each(_loc5_ in this.ratings.source)
         {
            _loc1_.ratings.addItem(_loc5_);
         }
         _loc1_.questPrio = this.var_1541;
         return _loc1_;
      }
      
      public function get ratings() : ArrayList
      {
         return this.var_649;
      }
      
      private function set method_3754(param1:ArrayList) : void
      {
         this.var_649 = param1;
      }
      
      public function get questPrio() : int
      {
         return this.var_1541;
      }
      
      private function set method_5443(param1:int) : void
      {
         this.var_1541 = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set acceptable(param1:Boolean) : void
      {
         var _loc2_:Object = this.acceptable;
         if(_loc2_ !== param1)
         {
            this.method_4015 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"acceptable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set minLevel(param1:int) : void
      {
         var _loc2_:Object = this.minLevel;
         if(_loc2_ !== param1)
         {
            this.method_1565 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"minLevel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set questListHTMLaddon(param1:String) : void
      {
         var _loc2_:Object = this.questListHTMLaddon;
         if(_loc2_ !== param1)
         {
            this.method_4841 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questListHTMLaddon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set questMainTypeIcon(param1:String) : void
      {
         var _loc2_:Object = this.questMainTypeIcon;
         if(_loc2_ !== param1)
         {
            this.method_3791 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questMainTypeIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set questPrio(param1:int) : void
      {
         var _loc2_:Object = this.questPrio;
         if(_loc2_ !== param1)
         {
            this.method_5443 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questPrio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set questID(param1:int) : void
      {
         var _loc2_:Object = this.questID;
         if(_loc2_ !== param1)
         {
            this.method_2401 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questID",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set questSubTypeList(param1:Vector.<class_780>) : void
      {
         var _loc2_:Object = this.questSubTypeList;
         if(_loc2_ !== param1)
         {
            this.method_4301 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questSubTypeList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set notAcceptableReasons(param1:String) : void
      {
         var _loc2_:Object = this.notAcceptableReasons;
         if(_loc2_ !== param1)
         {
            this.method_3834 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notAcceptableReasons",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set extraInfo(param1:String) : void
      {
         var _loc2_:Object = this.extraInfo;
         if(_loc2_ !== param1)
         {
            this.method_4816 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set rootCaseID(param1:int) : void
      {
         var _loc2_:Object = this.rootCaseID;
         if(_loc2_ !== param1)
         {
            this.method_6289 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rootCaseID",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set ratings(param1:ArrayList) : void
      {
         var _loc2_:Object = this.ratings;
         if(_loc2_ !== param1)
         {
            this.method_3754 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ratings",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set completed(param1:Boolean) : void
      {
         var _loc2_:Object = this.completed;
         if(_loc2_ !== param1)
         {
            this.name_77 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"completed",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.var_1444.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.var_1444.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.var_1444.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.var_1444.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.var_1444.willTrigger(param1);
      }
   }
}
