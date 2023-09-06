package package_278
{
   import flash.display.MovieClip;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.gui.class_2317;
   import package_139.Group;
   import package_26.class_94;
   import package_38.class_719;
   
   public class class_2005 extends MovieClip
   {
       
      
      private var _group:Group;
      
      private var var_2080:Array;
      
      private var var_1166:Array;
      
      private var var_786:class_1688;
      
      private var var_1568:Boolean;
      
      private var var_5001:Boolean;
      
      private var var_1305:uint;
      
      private var var_4633:int;
      
      public function class_2005(param1:class_1688)
      {
         this.var_2080 = [];
         this.var_1166 = [];
         super();
         this.var_786 = param1;
         this.method_4762();
      }
      
      private function method_4762() : void
      {
         this.var_1166[class_1689.const_2646] = new class_2317(this.var_786.method_5376,"label_grp_context_item_ping");
         this.var_1166[class_1689.const_1004] = new class_2317(this.var_786.method_4009,"label_grp_kick_member");
         this.var_1166[class_1689.const_1960] = new class_2317(this.var_786.method_2283,"label_grp_leave_group_leaver");
         this.var_1166[class_1689.const_142] = new class_2317(this.var_786.method_4681,"label_grp_change_invitation_behavior");
         this.var_1166[class_1689.const_753] = new class_2317(this.var_786.method_4681,"label_grp_change_invitation_behavior");
         this.var_1166[class_1689.const_1186] = new class_2317(this.var_786.method_4681,"label_grp_change_invitation_behavior");
         this.var_1166[class_1689.const_34] = new class_2317(this.var_786.method_2559,"label_grp_leader_change");
         this.var_1166[class_1689.const_271] = new class_2317(this.var_786.method_5987,"label_grp_context_item_follow");
      }
      
      public function method_4162(param1:Boolean, param2:uint) : void
      {
         if(this.var_1305 == param2)
         {
            this.method_5322(this.var_1305).toggle(param1);
            this.var_5001 = param1;
         }
         else
         {
            if(this.var_1305 != 0)
            {
               this.method_5322(this.var_1305).toggle(false);
            }
            this.var_5001 = true;
            this.var_1305 = param2;
            this.method_5322(this.var_1305).toggle(true);
         }
      }
      
      public function update(param1:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = [];
         if(this._group != null && Boolean(this._group.method_3369))
         {
            _loc2_ = this.method_2397();
            this.var_1568 = true;
         }
         else
         {
            this.var_1568 = true;
            if(true)
            {
               this.method_3666();
            }
            this.var_1568 = false;
            _loc2_ = this.method_367();
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            if(!(_loc2_[_loc4_] == undefined || _loc2_[_loc4_] == null))
            {
               _loc5_ = class_1689(_loc2_[_loc4_]);
               if(!contains(_loc5_))
               {
                  addChild(_loc5_);
               }
               if(param1)
               {
                  _loc5_.handleClick = class_2317(this.var_1166[_loc5_.type]).action;
               }
               else
               {
                  _loc5_.handleClick = null;
               }
               _loc5_.x = _loc3_;
               _loc3_ += _loc5_.width + 5;
            }
            _loc4_++;
         }
      }
      
      private function method_3666() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_2080)
         {
            if(contains(_loc1_))
            {
               removeChild(_loc1_);
            }
         }
      }
      
      private function method_367() : Array
      {
         var _loc1_:* = [];
         _loc1_[class_1689.const_2646] = this.method_5322(class_1689.const_2646);
         _loc1_[class_1689.const_1960] = this.method_5322(class_1689.const_1960);
         _loc1_[class_1689.const_271] = this.method_5322(class_1689.const_271);
         return _loc1_;
      }
      
      private function method_2397() : Array
      {
         var _loc1_:* = [];
         _loc1_[class_1689.const_271] = this.method_5322(class_1689.const_271);
         _loc1_[class_1689.const_2646] = this.method_5322(class_1689.const_2646);
         _loc1_[class_1689.const_1004] = this.method_5322(class_1689.const_1004);
         _loc1_[class_1689.const_1960] = this.method_5322(class_1689.const_1960);
         _loc1_[class_1689.const_34] = this.method_5322(class_1689.const_34);
         _loc1_[class_1689.const_142] = this.method_4943();
         return _loc1_;
      }
      
      private function method_4943() : class_1689
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._group != null && this._group.method_3852 == class_719.const_1141)
         {
            if(this.var_4633 != Group.const_3283 && this.var_2080[class_1689.const_1186] != null)
            {
               class_94.getInstance().method_4247(this.var_2080[class_1689.const_1186]);
               class_1689(this.var_2080[class_1689.const_1186]).handleClick = null;
               if(contains(this.var_2080[class_1689.const_1186]))
               {
                  removeChild(this.var_2080[class_1689.const_1186]);
               }
            }
            this.var_4633 = class_719.const_1141;
            _loc1_ = this.method_5322(class_1689.const_753);
            _loc2_ = "label_grp_invitation_behavior_free_for_all";
         }
         else
         {
            if(this.var_4633 != class_719.const_145 && this.var_2080[class_1689.const_753] != null)
            {
               class_94.getInstance().method_4247(this.var_2080[class_1689.const_753]);
               class_1689(this.var_2080[class_1689.const_753]).handleClick = null;
               if(contains(this.var_2080[class_1689.const_753]))
               {
                  removeChild(this.var_2080[class_1689.const_753]);
               }
            }
            this.var_4633 = class_719.const_145;
            _loc1_ = this.method_5322(class_1689.const_1186);
            _loc2_ = "label_grp_invitation_behavior_boss_only";
         }
         class_94.getInstance().method_4247(_loc1_);
         class_94.getInstance().method_1211(_loc1_,class_88.getItem("label_grp_change_invitation_behavior") + "\n" + class_88.getItem(_loc2_));
         return _loc1_;
      }
      
      private function method_5322(param1:int) : class_1689
      {
         var _loc2_:class_1689 = this.var_2080[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.var_786.method_6335(param1);
            this.var_2080[param1] = _loc2_;
            class_94.getInstance().method_1211(this.var_2080[param1],class_88.getItem(class_2317(this.var_1166[param1]).tooltipKey));
            if(param1 == class_1689.const_2646 || param1 == class_1689.const_271 || param1 == class_1689.const_1004 || param1 == class_1689.const_34)
            {
               _loc2_.toggle(false);
            }
         }
         return _loc2_;
      }
      
      public function get group() : Group
      {
         return this._group;
      }
      
      public function set group(param1:Group) : void
      {
         this._group = param1;
      }
      
      public function get method_83() : class_1688
      {
         return this.var_786;
      }
      
      public function set method_83(param1:class_1688) : void
      {
         this.var_786 = param1;
      }
      
      public function get method_3369() : Boolean
      {
         return this.var_1568;
      }
      
      public function set method_3369(param1:Boolean) : void
      {
         this.var_1568 = param1;
      }
   }
}
