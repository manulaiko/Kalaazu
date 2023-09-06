package package_185
{
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_259.class_1658;
   import package_260.class_1659;
   import package_260.class_1660;
   import package_260.class_1661;
   import package_38.class_649;
   import package_38.class_885;
   
   public class class_1113 extends Proxy
   {
      
      public static const NAME:String = "ContactsWindowContactListProxy";
      
      private static const const_1527:Vector.<uint> = new <uint>[class_1659.const_1891,class_1659.const_2453,class_1659.const_2358,class_1659.const_1624,class_1659.const_650,class_1659.const_698,class_1659.const_1517];
      
      private static const const_152:Vector.<uint> = new <uint>[class_1659.const_1772,class_1659.const_3196,class_1659.const_2331,class_1659.const_861,class_1659.const_3261];
       
      
      private var var_2623:Boolean = true;
      
      private var var_795:Boolean = true;
      
      private var var_4341:Boolean = true;
      
      private var var_3354:Boolean = false;
      
      private var var_4930:Dictionary;
      
      private var var_845:Boolean = false;
      
      private var var_3135:class_1659 = null;
      
      private var var_3260:Boolean = true;
      
      public function class_1113(param1:class_1660 = null)
      {
         this.var_4930 = new Dictionary();
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      public function method_4501(param1:class_1659) : void
      {
         this.var_3135 = param1;
      }
      
      public function method_3704() : void
      {
         this.var_3260 = true;
      }
      
      public function method_1838(param1:String) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         if(Boolean(this.var_3135) && param1 == this.var_3135.name_148)
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(this.var_3135.name_148,this.var_3135.userID,class_649.const_3111));
         }
         else
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(param1,0,class_649.const_3111));
         }
      }
      
      public function method_5805(param1:String) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         if(Boolean(this.var_3135) && param1 == this.var_3135.name_148)
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(this.var_3135.name_148,this.var_3135.userID,class_649.const_2399));
         }
         else
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(param1,0,class_649.const_2399));
         }
      }
      
      public function method_5068(param1:String) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         if(Boolean(this.var_3135) && param1 == this.var_3135.name_148)
         {
            if(!this.method_6506(param1))
            {
               sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(this.var_3135.name_148,this.var_3135.userID,class_649.const_1416));
            }
            else
            {
               sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(this.var_3135.name_148,this.var_3135.userID,class_649.const_150));
            }
         }
         else if(!this.method_6506(param1))
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(param1,0,class_649.const_1416));
         }
         else
         {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(param1,0,class_649.const_150));
         }
      }
      
      private function method_6506(param1:String) : Boolean
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.model.method_1234)
         {
            if(_loc2_.name_148 == param1 && Boolean(_loc2_.hasState(class_1659.const_1517)))
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_1535() : void
      {
         var _loc1_:* = null;
         if(this.model == null)
         {
            return;
         }
         for each(_loc1_ in this.model.method_1234)
         {
            _loc1_.method_1438();
         }
         this.method_3647();
      }
      
      public function method_4829(param1:Vector.<class_1659>) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = this.var_4930[_loc2_.userID] as class_1659;
            if(_loc3_ == null)
            {
               if(!this.model)
               {
                  this.model = new class_1660(new Vector.<class_1659>());
               }
               this.var_4930[_loc2_.userID] = _loc2_;
               this.model.method_1234.push(_loc2_);
            }
            else
            {
               _loc3_.method_1438();
            }
         }
         this.method_3647();
      }
      
      public function method_4280(param1:class_1659) : void
      {
         var _loc2_:class_1659 = this.var_4930[param1.userID] as class_1659;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.method_1438();
         this.method_3647();
      }
      
      public function method_1181(param1:class_1659) : void
      {
         var _loc2_:class_1659 = this.var_4930[param1.userID] as class_1659;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.method_1438();
         this.method_3647();
      }
      
      public function method_789(param1:class_1660) : void
      {
         this.var_4930 = new Dictionary();
         this.model = param1;
         this.method_3647();
      }
      
      public function get model() : class_1660
      {
         return data as class_1660;
      }
      
      public function set model(param1:class_1660) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1.method_1234)
         {
            this.var_4930[_loc2_.userID] = _loc2_;
         }
         data = param1;
      }
      
      private function method_5097(param1:class_1660) : class_1660
      {
         param1.method_1234.sort(this.method_4389);
         param1.method_1234.sort(this.method_3302);
         return param1;
      }
      
      private function method_3302(param1:class_1659, param2:class_1659) : Number
      {
         if(param1.method_398 == param2.method_398)
         {
            return Number(const_152.indexOf(param1.name_98)) - Number(const_152.indexOf(param2.name_98));
         }
         return Number(const_1527.indexOf(param1.method_398)) - Number(const_1527.indexOf(param2.method_398));
      }
      
      private function method_4389(param1:class_1659, param2:class_1659) : Number
      {
         if(param1.name_148 < param2.name_148)
         {
            return -1;
         }
         if(param1.name_148 > param2.name_148)
         {
            return 1;
         }
         return 0;
      }
      
      private function method_2195() : class_1660
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:Vector.<class_1659> = new Vector.<class_1659>();
         for each(_loc3_ in this.model.method_1234)
         {
            if(!(!this.name_3 && Boolean(_loc3_.hasState(class_1659.const_1517))))
            {
               if(Boolean(this.showRequests) && Boolean(_loc3_.hasState(class_1659.const_650)))
               {
                  _loc1_ = _loc3_.clone();
                  _loc1_.method_398 = class_1659.const_650;
                  _loc2_.push(_loc1_);
               }
               if(Boolean(this.showRequests) && Boolean(_loc3_.hasState(class_1659.const_698)))
               {
                  _loc1_ = _loc3_.clone();
                  _loc1_.method_398 = class_1659.const_698;
                  _loc2_.push(_loc1_);
               }
               if(Boolean(this.showRequests) && Boolean(_loc3_.hasState(class_1659.const_1891)))
               {
                  _loc1_ = _loc3_.clone();
                  _loc1_.method_398 = class_1659.const_1891;
                  _loc2_.push(_loc1_);
               }
               if(Boolean(this.showClanmembers) && Boolean(_loc3_.method_4171()))
               {
                  _loc2_.push(_loc3_);
               }
               else if(Boolean(this.showContacts) && Boolean(_loc3_.hasState(class_1659.const_2640)))
               {
                  _loc2_.push(_loc3_);
               }
               else if(Boolean(this.name_3) && Boolean(_loc3_.hasState(class_1659.const_1517)))
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return new class_1660(_loc2_);
      }
      
      public function method_4706(param1:Vector.<int>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         for each(_loc2_ in param1)
         {
            if(this.var_4930)
            {
               delete this.var_4930[_loc2_];
            }
            if(this.model)
            {
               _loc3_ = 0;
               while(_loc3_ < this.model.method_1234.length)
               {
                  if(this.model.method_1234[_loc3_].userID == _loc2_)
                  {
                     this.model.method_1234.splice(_loc3_,1);
                  }
                  _loc3_++;
               }
            }
         }
         this.method_3647();
      }
      
      public function method_3647() : void
      {
         var _loc1_:* = null;
         if(this.model)
         {
            _loc1_ = this.method_2195();
            _loc1_ = this.method_5097(_loc1_);
            sendNotification(class_1658.const_1350,_loc1_);
         }
         sendNotification(class_1658.const_18,new class_1661(this.showContacts,this.showClanmembers,this.showRequests,this.name_3));
         sendNotification(class_1658.const_3277,this.var_845);
         this.method_3673();
      }
      
      private function method_3673() : void
      {
         var _loc7_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc7_ in this.model.method_1234)
         {
            if(!_loc7_.hasState(class_1659.const_1517) && Boolean(_loc7_.hasState(class_1659.const_2640)))
            {
               _loc2_++;
               if(_loc7_.name_81)
               {
                  _loc1_++;
               }
            }
            if(!_loc7_.hasState(class_1659.const_1517) && Boolean(_loc7_.method_4171()))
            {
               _loc4_++;
               if(_loc7_.name_81)
               {
                  _loc3_++;
               }
            }
            if(Boolean(_loc7_.hasState(class_1659.const_1891)) || Boolean(_loc7_.hasState(class_1659.const_650)) || Boolean(_loc7_.hasState(class_1659.const_698)))
            {
               _loc5_++;
            }
            if(_loc7_.hasState(class_1659.const_1517))
            {
               _loc6_++;
            }
         }
         sendNotification(class_1658.const_1149,[_loc1_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_]);
      }
      
      public function get showContacts() : Boolean
      {
         return this.var_2623;
      }
      
      public function set showContacts(param1:Boolean) : void
      {
         this.var_2623 = param1;
      }
      
      public function get showClanmembers() : Boolean
      {
         return this.var_795;
      }
      
      public function set showClanmembers(param1:Boolean) : void
      {
         this.var_795 = param1;
      }
      
      public function get showRequests() : Boolean
      {
         return this.var_4341;
      }
      
      public function set showRequests(param1:Boolean) : void
      {
         this.var_4341 = param1;
      }
      
      public function get name_3() : Boolean
      {
         return this.var_3354;
      }
      
      public function set name_3(param1:Boolean) : void
      {
         this.var_3354 = param1;
      }
      
      public function method_755(param1:Boolean) : void
      {
         this.var_845 = param1;
      }
      
      public function method_1417(param1:Boolean) : void
      {
         if(!this.var_3260)
         {
            TweenLite.delayedCall(5,this.method_1417,arguments);
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         this.var_845 = param1;
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_885(param1));
      }
      
      public function method_4353(param1:int) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         var _loc2_:String = "";
         if(this.var_4930[param1] != null)
         {
            _loc2_ = (this.var_4930[param1] as class_1659).name_148;
         }
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(_loc2_,param1,class_649.const_150));
      }
      
      public function method_2845(param1:int) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         var _loc2_:String = "";
         if(this.var_4930[param1] != null)
         {
            _loc2_ = (this.var_4930[param1] as class_1659).name_148;
         }
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(_loc2_,param1,class_649.const_866));
      }
      
      public function method_2443(param1:int) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         var _loc2_:String = "";
         if(this.var_4930[param1] != null)
         {
            _loc2_ = (this.var_4930[param1] as class_1659).name_148;
         }
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(_loc2_,param1,class_649.const_636));
      }
      
      public function method_3207(param1:int) : void
      {
         if(!this.var_3260)
         {
            return;
         }
         this.var_3260 = false;
         sendNotification(class_1658.const_2897);
         var _loc2_:String = "";
         if(this.var_4930[param1] != null)
         {
            _loc2_ = (this.var_4930[param1] as class_1659).name_148;
         }
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_649(_loc2_,param1,class_649.const_2604));
      }
      
      public function method_1909(param1:int) : class_1659
      {
         return this.var_4930[param1] as class_1659;
      }
   }
}
