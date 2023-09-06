package package_145
{
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;
   import package_148.class_985;
   import package_65.class_203;
   import package_80.QuestProxy;
   import package_9.ResourceManager;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   
   public class class_982 extends SkinnableContainer
   {
       
      
      private var var_4099:Label;
      
      private var var_423:Group;
      
      private var var_3734:Label;
      
      private var var_4317:DOButtonBase;
      
      private var var_3748:DOButtonBase;
      
      private var var_729:Label;
      
      private var var_4837:Label;
      
      private var var_3309:HGroup;
      
      public var var_115:int;
      
      public var var_1727:int;
      
      public var var_3118:Boolean;
      
      public function class_982()
      {
         super();
      }
      
      public function method_485() : void
      {
         this.acceptButton.label = class_88.getItem("btn_quest_accept");
         this.abortButton.label = class_88.getItem("label_close");
         this.objectivesLabel.text = class_88.getItem("label_overview");
         this.rewardsLabel.text = class_88.getItem("label_reward");
      }
      
      public function method_3436(param1:class_203, param2:QuestListItemVO) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_115 = param1.id;
         this.var_1727 = param1.method_2963().id;
         this.var_3118 = param2.method_1333();
         if(this.var_3118)
         {
            this.acceptButton.visible = false;
            this.abortButton.visible = true;
         }
         else
         {
            this.acceptButton.visible = true;
            this.abortButton.visible = false;
         }
         this.questSubTypeIcons.removeAllElements();
         if(param2.questSubTypeList != null)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.questSubTypeList.length)
            {
               _loc4_ = String(QuestProxy.const_2738[param2.questSubTypeList[_loc3_].icon]);
               _loc5_ = ResourceManager.getBitmap("questWin",_loc4_ + "_framed");
               (_loc6_ = new Image()).source = _loc5_;
               this.questSubTypeIcons.addElement(_loc6_);
               _loc6_.toolTip = class_88.getItem(QuestProxy.const_2044[param2.questSubTypeList[_loc3_].icon]);
               _loc3_++;
            }
         }
         this.method_1322(param1.title);
         this.method_3699(param1.description);
      }
      
      public function method_3758(param1:QuestListItemVO) : void
      {
         this.var_3118 = param1.method_1333();
         if(this.var_3118)
         {
            this.acceptButton.visible = false;
            this.abortButton.visible = true;
         }
         else
         {
            this.acceptButton.visible = true;
            this.abortButton.visible = false;
         }
      }
      
      private function method_1322(param1:String) : void
      {
         this.questTitle.text = param1;
      }
      
      private function method_3699(param1:String) : void
      {
         this.questDescScrollerGroup.verticalScrollPosition = 0;
         this.questDesc.text = String(param1);
      }
      
      protected function method_3218(param1:MouseEvent) : void
      {
         var _loc2_:class_985 = new class_985(class_985.ACCEPT_QUEST);
         _loc2_.questID = this.var_115;
         _loc2_.rootCaseID = this.var_1727;
         dispatchEvent(_loc2_);
      }
      
      protected function method_1514(param1:MouseEvent) : void
      {
         var _loc2_:class_985 = new class_985(class_985.ABORT_QUEST);
         _loc2_.questID = this.var_115;
         _loc2_.rootCaseID = this.var_1727;
         dispatchEvent(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get questDesc() : Label
      {
         return this.var_4099;
      }
      
      public function set questDesc(param1:Label) : void
      {
         var _loc2_:Object = this.var_4099;
         if(_loc2_ !== param1)
         {
            this.var_4099 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questDesc",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get questDescScrollerGroup() : Group
      {
         return this.var_423;
      }
      
      public function set questDescScrollerGroup(param1:Group) : void
      {
         var _loc2_:Object = this.var_423;
         if(_loc2_ !== param1)
         {
            this.var_423 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questDescScrollerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get questTitle() : Label
      {
         return this.var_3734;
      }
      
      public function set questTitle(param1:Label) : void
      {
         var _loc2_:Object = this.var_3734;
         if(_loc2_ !== param1)
         {
            this.var_3734 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get acceptButton() : DOButtonBase
      {
         return this.var_4317;
      }
      
      public function set acceptButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_4317;
         if(_loc2_ !== param1)
         {
            this.var_4317 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"acceptButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get abortButton() : DOButtonBase
      {
         return this.var_3748;
      }
      
      public function set abortButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_3748;
         if(_loc2_ !== param1)
         {
            this.var_3748 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"abortButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get objectivesLabel() : Label
      {
         return this.var_729;
      }
      
      public function set objectivesLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_729;
         if(_loc2_ !== param1)
         {
            this.var_729 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"objectivesLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardsLabel() : Label
      {
         return this.var_4837;
      }
      
      public function set rewardsLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_4837;
         if(_loc2_ !== param1)
         {
            this.var_4837 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardsLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get questSubTypeIcons() : HGroup
      {
         return this.var_3309;
      }
      
      public function set questSubTypeIcons(param1:HGroup) : void
      {
         var _loc2_:Object = this.var_3309;
         if(_loc2_ !== param1)
         {
            this.var_3309 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questSubTypeIcons",_loc2_,param1));
            }
         }
      }
   }
}
