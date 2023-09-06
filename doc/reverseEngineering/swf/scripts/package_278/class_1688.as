package package_278
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import mx.utils.StringUtil;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.class_1155;
   import package_11.class_39;
   import package_139.Group;
   import package_139.class_1154;
   import package_139.class_1156;
   import package_26.class_94;
   import package_33.class_93;
   import package_345.class_1931;
   import package_345.class_1932;
   import package_345.class_1933;
   import package_38.class_719;
   import package_46.class_131;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_1688 extends class_93
   {
      
      public static const const_1716:int = 4;
      
      public static const const_97:int = 0;
      
      public static const const_2417:int = 5;
       
      
      private var var_3724:class_39;
      
      private var _group:Group;
      
      private var var_2505:TextFormat;
      
      private var var_3054:class_1689;
      
      private var var_422:TextField;
      
      private var var_628:DisplayObjectContainer;
      
      private var var_279:Object;
      
      private var var_2226:Boolean;
      
      private var var_4354:class_2005;
      
      private var var_1806:Array;
      
      private var var_2670:Vector.<class_1154>;
      
      private var var_1880:Vector.<class_1154>;
      
      private var var_2475:Array;
      
      private var var_3909:int;
      
      private var var_3401:int;
      
      private var var_2273:Boolean;
      
      private var var_329:class_1689;
      
      private var var_397:Boolean;
      
      private var var_1879:Dictionary;
      
      private var var_4157:Dictionary;
      
      private var var_1317:Dictionary;
      
      private var var_1718:class_39;
      
      private var var_3819:Boolean = true;
      
      private var var_3040:Boolean;
      
      private var var_3076:Boolean;
      
      private var var_3927:Boolean;
      
      private var var_3834:Boolean;
      
      private var var_3793:class_131;
      
      private var var_3650:Array;
      
      public function class_1688()
      {
         this.var_2505 = new TextFormat("_sans",12,8947848);
         this.var_2670 = new Vector.<class_1154>();
         this.var_1880 = new Vector.<class_1154>();
         super(null,class_93.const_672);
         this.var_1718 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.var_3724 = ResourceManager.name_15.getFinisher("groupSystemShipIcons") as class_39;
         this.method_2773();
         this.var_1806 = [];
         this.var_2475 = [];
         this.var_2670.length = 0;
         this.var_1880.length = 0;
         this.var_1879 = new Dictionary();
         this.var_4157 = new Dictionary();
         this.var_1317 = new Dictionary();
         this.method_6011();
         this.update();
      }
      
      private function method_6011() : void
      {
         this.var_3650 = class_126.instance.method_437;
      }
      
      private function method_2773() : void
      {
         this.var_422 = new TextField();
         this.var_422.x = 0;
         this.var_422.y = 4;
         this.var_422.height = int(this.var_2505.size) + 6;
         this.var_422.width = 128;
         this.var_422.defaultTextFormat = this.var_2505;
         this.var_422.border = true;
         this.var_422.borderColor = 8947848;
         this.var_422.backgroundColor = 1155390941;
         this.var_422.multiline = false;
         this.var_422.type = TextFieldType.INPUT;
         this.var_422.addEventListener(MouseEvent.CLICK,this.method_3812);
         this.var_422.addEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
         this.focusOut();
         addChild(this.var_422);
         this.var_3054 = this.method_6335(class_1689.const_400);
         this.var_3054.addEventListener(MouseEvent.CLICK,this.method_1854);
         this.var_3054.x = this.var_422.width + 4;
         addChild(this.var_3054);
         class_94.getInstance().method_1211(this.var_3054,class_88.getItem("label_invite"));
         this.method_6269();
      }
      
      private function focusOut() : void
      {
         dispatchEvent(new class_1931(class_1931.UNBLOCK_KEYBOARD));
         this.var_422.addEventListener(FocusEvent.FOCUS_IN,this.method_896);
         this.var_422.removeEventListener(FocusEvent.FOCUS_OUT,this.method_5318);
      }
      
      private function focusIn() : void
      {
         dispatchEvent(new class_1931(class_1931.BLOCK_KEYBOARD));
         this.var_422.removeEventListener(FocusEvent.FOCUS_IN,this.method_896);
         this.var_422.addEventListener(FocusEvent.FOCUS_OUT,this.method_5318);
      }
      
      private function method_5318(param1:FocusEvent) : void
      {
         this.focusOut();
      }
      
      private function method_896(param1:FocusEvent) : void
      {
         this.focusIn();
         if(param1.target == this.var_422)
         {
            this.var_3834 = true;
         }
         else
         {
            this.var_3834 = false;
         }
      }
      
      private function method_3812(param1:Event) : void
      {
         if(param1.target == this.var_422 && Boolean(this.var_3834))
         {
            this.var_422.setSelection(0,this.var_422.text.length);
            this.var_3834 = false;
         }
      }
      
      public function name_166(param1:int) : Boolean
      {
         return this.var_279[param1] != null;
      }
      
      public function method_3802(param1:Boolean) : void
      {
         if(this.var_2273 != param1 || Boolean(this.var_397))
         {
            this.var_2273 = param1;
            this.method_6269();
            if(this.var_397)
            {
               this.update();
            }
         }
      }
      
      private function handleKeyDown(param1:KeyboardEvent = null) : void
      {
         var _loc2_:int = param1.keyCode;
         switch(_loc2_)
         {
            case Keyboard.ENTER:
               this.method_2325();
         }
      }
      
      public function method_5613(param1:class_1156) : void
      {
         if(this.var_3819)
         {
            dispatchEvent(new class_1931(class_1931.TRY_TO_SELECT_MAPASSET,param1));
         }
         else if(this.var_3927)
         {
            this.method_4009();
            dispatchEvent(new class_1931(class_1931.KICK_MEMBER,param1));
         }
         else if(this.var_2226)
         {
            this.method_5376();
            dispatchEvent(new class_1931(class_1931.PING_MEMBER,param1));
         }
         else if(this.var_3040)
         {
            this.method_5987();
            dispatchEvent(new class_1931(class_1931.FLY_TO_MEMBER,param1));
         }
         else if(this.var_3076)
         {
            this.method_2559();
            dispatchEvent(new class_1931(class_1931.CHANGE_LEADER,param1));
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_279)
         {
            this.method_5066(_loc1_.method_2770.id);
         }
         this._group = null;
         for each(_loc2_ in this.var_2670)
         {
            this.method_4510(_loc2_.method_4059().id,class_1155.const_2196);
         }
         for each(_loc2_ in this.var_1880)
         {
            this.method_4510(_loc2_.method_3057().id,class_1155.const_498);
         }
         this.method_4265(false);
         this.method_1225(false);
         this.var_397 = true;
      }
      
      public function method_1977(param1:String) : Bitmap
      {
         return this.var_1718.getEmbeddedBitmap(param1);
      }
      
      public function method_5094(param1:String) : DisplayObject
      {
         return this.var_1718.method_2545(param1) as DisplayObject;
      }
      
      public function get method_3379() : int
      {
         return class_50.getInstance().map.method_1480();
      }
      
      private function method_265() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!this.method_955())
         {
            return;
         }
         var _loc1_:Vector.<class_1156> = this._group.name_113;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = class_1156(_loc1_[_loc2_]);
            if(_loc3_.id != class_81.userID)
            {
               (_loc4_ = this.method_1212(_loc3_)).method_3333();
            }
            _loc2_++;
         }
      }
      
      public function method_5376(param1:MouseEvent = null) : void
      {
         this.var_2226 = !this.var_2226;
         this.var_3819 = !this.var_2226;
         dispatchEvent(new class_1931(class_1931.TOGGLE_PING_MODE_BUTTON_CLICKED));
      }
      
      public function method_4009(param1:MouseEvent = null) : void
      {
         this.var_3927 = !this.var_3927;
         this.var_3819 = !this.var_3927;
         this.var_4354.method_4162(this.var_3927,class_1689.const_1004);
      }
      
      public function method_2283(param1:MouseEvent = null) : void
      {
         dispatchEvent(new class_1931(class_1931.LEAVE_GROUP));
      }
      
      public function method_5419(param1:MouseEvent = null) : void
      {
         dispatchEvent(new class_1931(class_1931.INVITATION_BLOCK_TOGGLE));
      }
      
      public function method_4681(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._group.method_3852 == Group.const_1241)
         {
            _loc2_ = 0;
         }
         dispatchEvent(new class_1932(class_1932.INVITATION_BEHAVIOR_TOGGLE,_loc2_));
      }
      
      public function method_2559(param1:MouseEvent = null) : void
      {
         this.var_3076 = !this.var_3076;
         this.var_3819 = !this.var_3076;
         this.var_4354.method_4162(this.var_3076,class_1689.const_34);
      }
      
      public function method_5987(param1:MouseEvent = null) : void
      {
         this.var_3040 = !this.var_3040;
         this.var_3819 = !this.var_3040;
         this.var_4354.method_4162(this.var_3040,class_1689.const_271);
      }
      
      public function method_6256(param1:String) : void
      {
         this.var_422.text = param1;
      }
      
      public function method_5066(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_628 != null)
         {
            _loc2_ = this.var_279[param1];
            if(_loc2_ != null)
            {
               if(this.var_628.contains(_loc2_))
               {
                  this.var_628.removeChild(_loc2_);
                  _loc2_.dispose();
                  delete this.var_279[param1];
               }
            }
         }
      }
      
      public function method_859(param1:Group) : void
      {
         var _loc2_:* = null;
         if(param1 == null && this.var_279 != null)
         {
            for(_loc2_ in this.var_279)
            {
               this.method_5066(int(_loc2_));
            }
         }
         this._group = param1;
      }
      
      private function method_955() : Boolean
      {
         if(this._group != null && this._group.name_113.length > 0)
         {
            return true;
         }
         return false;
      }
      
      public function update() : void
      {
         this.var_3909 = const_97;
         if(this.method_955())
         {
            this.method_4688();
            if(this.var_1806 != null && this.var_1806.length > 0)
            {
               this.method_4751();
            }
            this.method_1225();
            this.method_4265(true);
         }
         else
         {
            this.method_1225();
            if(this.var_1806 != null && this.var_1806.length > 0)
            {
               this.method_4751();
            }
            this.method_4265(false);
         }
         if(this.var_3793 != null && this.var_3401 != this.var_3909)
         {
            this.var_3401 = this.var_3909;
            this.var_3793.setSize(196,this.var_3401 + 24);
         }
         this.var_397 = false;
      }
      
      private function method_4265(param1:Boolean = false) : void
      {
         if(this.var_4354 == null)
         {
            this.var_4354 = new class_2005(this);
            addChild(this.var_4354);
         }
         this.var_4354.visible = param1;
         this.var_4354.group = this._group;
         this.var_4354.update(param1);
         this.var_4354.y = this.var_3909;
         if(param1)
         {
            this.var_3909 += this.var_4354.height;
         }
      }
      
      private function method_1225(param1:Boolean = true) : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:int = 0;
         var _loc3_:Boolean = param1 && !this.method_955();
         if(param1 && (!this.method_955() || Boolean(this._group.method_3369) || this._group.method_3852 == class_719.const_1141))
         {
            _loc4_ = int(this.var_1806.length);
            if(this.method_955())
            {
               _loc4_ += this._group.name_113.length;
            }
            _loc2_ = true;
            this.var_422.y = this.var_3909 + 4;
            this.var_3054.y = this.var_3909;
            this.var_329.y = this.var_3909;
            this.var_3909 += 28;
         }
         this.var_422.visible = _loc2_;
         this.var_3054.visible = _loc2_;
         this.var_329.visible = _loc3_;
      }
      
      private function method_4688() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.method_5028();
         var _loc1_:Vector.<class_1156> = this._group.name_113;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            if((_loc4_ = class_1156(_loc1_[_loc3_])).id != class_81.userID)
            {
               (_loc5_ = this.method_1212(_loc4_)).update();
               this.method_265();
               _loc5_.y = _loc2_;
               _loc2_ += _loc5_.method_1109;
            }
            _loc3_++;
         }
         this.var_3909 += _loc2_;
      }
      
      private function method_1212(param1:class_1156) : class_2004
      {
         var _loc2_:class_2004 = this.var_279[param1.id];
         if(_loc2_ == null)
         {
            _loc2_ = new class_2004();
            _loc2_.method_2770 = param1;
            _loc2_.method_83 = this;
            this.var_628.addChild(_loc2_);
            this.var_279[param1.id] = _loc2_;
         }
         return _loc2_;
      }
      
      private function method_5028() : DisplayObjectContainer
      {
         if(this.var_628 == null)
         {
            this.var_628 = new Sprite();
            addChild(this.var_628);
            this.var_279 = {};
         }
         this.var_628.y = const_97;
         this.var_3909 = 0;
         return this.var_628;
      }
      
      public function info(param1:String) : void
      {
      }
      
      private function method_1854(param1:MouseEvent) : void
      {
         this.method_2325();
      }
      
      private function method_2325() : void
      {
         var _loc1_:String = StringUtil.trim(this.var_422.text);
         if(_loc1_ != "")
         {
            dispatchEvent(new class_1933(class_1933.INVITE,0,_loc1_));
            this.var_422.text = "";
         }
      }
      
      public function method_2362(param1:int) : void
      {
      }
      
      public function set method_5594(param1:Boolean) : void
      {
         this.var_2226 = param1;
         this.var_3819 = !this.var_2226;
         this.var_4354.method_4162(this.var_2226,class_1689.const_2646);
      }
      
      public function method_1126(param1:class_1154) : void
      {
         this.var_1806.push(param1);
         if(param1.method_3057().id == class_81.userID)
         {
            this.var_2670.push(param1);
         }
         else
         {
            this.var_1880.push(param1);
         }
      }
      
      public function method_4806() : void
      {
         this.var_1806 = [];
         this.var_2475 = [];
         this.var_2670.length = 0;
         this.var_1880.length = 0;
         this.var_1879 = new Dictionary();
         this.var_4157 = new Dictionary();
         this.var_1317 = new Dictionary();
      }
      
      private function method_4751() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         if(this.var_1806 == null)
         {
            return;
         }
         for each(_loc1_ in this.var_1806)
         {
            if(_loc1_.method_3057().id == class_81.userID)
            {
               _loc3_ = int(_loc1_.method_4059().id);
               if(this.var_1317[_loc3_] == null)
               {
                  _loc2_ = new class_1155();
                  _loc2_.method_83 = this;
                  _loc2_.init(_loc1_.method_4059());
                  _loc2_.type = class_1155.const_2196;
                  class_94.getInstance().method_1211(_loc2_.method_5843,class_88.getItem("label_grp_inv_for").replace(/%name%/,_loc1_.method_4059().var_5016));
                  _loc4_ = true;
               }
            }
            else
            {
               _loc3_ = int(_loc1_.method_3057().id);
               if(this.var_4157[_loc3_] == null)
               {
                  _loc2_ = new class_1155();
                  _loc2_.method_83 = this;
                  _loc2_.init(_loc1_.method_3057());
                  _loc2_.type = class_1155.const_498;
                  class_94.getInstance().method_1211(_loc2_.method_5843,class_88.getItem("label_grp_inv_from").replace(/%name%/,_loc1_.method_3057().var_5016));
                  _loc4_ = true;
               }
            }
            if(_loc4_)
            {
               this.addListeners(_loc2_,_loc3_);
               addChild(_loc2_);
               this.var_2475.push(_loc2_);
            }
         }
         for each(_loc2_ in this.var_2475)
         {
            _loc2_.y = this.var_3909;
            this.var_3909 += 28;
         }
      }
      
      private function addListeners(param1:class_1155, param2:int) : void
      {
         switch(param1.type)
         {
            case class_1155.const_498:
               param1.method_4343.addEventListener(MouseEvent.CLICK,this.method_1925);
               this.var_4157[param2] = param1.method_4343;
               param1.acceptButton.addEventListener(MouseEvent.CLICK,this.method_5310);
               this.var_1879[param2] = param1.acceptButton;
               break;
            case class_1155.const_2196:
               param1.revokeButton.addEventListener(MouseEvent.CLICK,this.method_1741);
               this.var_1317[param2] = param1.revokeButton;
         }
      }
      
      private function method_1741(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_1689 = class_1689(param1.target);
         for(_loc3_ in this.var_1317)
         {
            if(class_1689(this.var_1317[_loc3_]) == _loc2_)
            {
               dispatchEvent(new class_1933(class_1933.REVOKE,int(_loc3_)));
               this.method_1120(int(_loc3_),class_1155.const_2196);
               break;
            }
         }
      }
      
      private function method_1120(param1:int, param2:int) : void
      {
         if(param2 == class_1155.const_498)
         {
            if(this.var_1879[param1] != null)
            {
               class_1689(this.var_1879[param1]).enabled = false;
            }
            if(this.var_4157[param1] != null)
            {
               class_1689(this.var_4157[param1]).enabled = false;
            }
         }
         else if(this.var_1317[param1] != null)
         {
            class_1689(this.var_1317[param1]).enabled = false;
         }
      }
      
      private function method_5310(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_1689 = class_1689(param1.target);
         for(_loc3_ in this.var_1879)
         {
            if(class_1689(this.var_1879[_loc3_]) == _loc2_)
            {
               dispatchEvent(new class_1933(class_1933.ACCEPT,int(_loc3_)));
               this.method_1120(int(_loc3_),class_1155.const_498);
               break;
            }
         }
      }
      
      public function method_4571() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._group)
         {
            this.method_5028();
            _loc1_ = this._group.name_113;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               _loc3_ = class_1156(_loc1_[_loc2_]);
               if(_loc3_.id != class_81.userID)
               {
                  (_loc4_ = this.method_1212(_loc3_)).method_1423(true);
               }
               _loc2_++;
            }
         }
      }
      
      public function method_4510(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 == class_1155.const_498)
         {
            if(this.var_4157[param1] == null)
            {
               return;
            }
            class_1689(this.var_4157[param1]).removeEventListener(MouseEvent.CLICK,this.method_1925);
            class_1689(this.var_1879[param1]).removeEventListener(MouseEvent.CLICK,this.method_5310);
            class_94.getInstance().method_4247(class_1689(this.var_4157[param1]));
            class_94.getInstance().method_4247(class_1689(this.var_1879[param1]));
            _loc3_ = 0;
            while(_loc3_ < this.var_1806.length)
            {
               if((_loc4_ = class_1154(this.var_1806[_loc3_])).method_3057().id == param1)
               {
                  this.var_1806.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.var_1880.length)
            {
               if((_loc4_ = class_1154(this.var_1880[_loc3_])).method_3057().id == param1)
               {
                  this.var_1880.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.var_2475.length)
            {
               if((_loc5_ = class_1155(this.var_2475[_loc3_]).acceptButton) == class_1689(this.var_1879[param1]))
               {
                  class_94.getInstance().method_4247(class_1155(this.var_2475[_loc3_]));
                  removeChild(class_1155(this.var_2475[_loc3_]));
                  this.var_2475.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            delete this.var_4157[param1];
            delete this.var_1879[param1];
         }
         else if(param2 == class_1155.const_2196)
         {
            if(this.var_1317[param1] == null)
            {
               return;
            }
            class_1689(this.var_1317[param1]).removeEventListener(MouseEvent.CLICK,this.method_1741);
            class_94.getInstance().method_4247(class_1689(this.var_1317[param1]));
            _loc3_ = 0;
            while(_loc3_ < this.var_1806.length)
            {
               if((_loc4_ = class_1154(this.var_1806[_loc3_])).method_4059().id == param1)
               {
                  this.var_1806.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.var_2670.length)
            {
               if((_loc4_ = class_1154(this.var_2670[_loc3_])) != null && _loc4_.method_4059() != null && _loc4_.method_4059().id == param1)
               {
                  this.var_2670.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.var_2475.length)
            {
               if((_loc6_ = class_1155(this.var_2475[_loc3_]).revokeButton) == class_1689(this.var_1317[param1]))
               {
                  class_94.getInstance().method_4247(class_1155(this.var_2475[_loc3_]));
                  removeChild(class_1155(this.var_2475[_loc3_]));
                  this.var_2475.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
            delete this.var_1317[param1];
         }
      }
      
      private function method_1925(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_1689 = class_1689(param1.target);
         for(_loc3_ in this.var_4157)
         {
            if(class_1689(this.var_4157[_loc3_]) == _loc2_)
            {
               dispatchEvent(new class_1933(class_1933.REJECT,int(_loc3_)));
               this.method_1120(int(_loc3_),class_1155.const_498);
               break;
            }
         }
      }
      
      public function method_6335(param1:uint) : class_1689
      {
         var _loc2_:class_1689 = new class_1689();
         _loc2_.type = param1;
         var _loc3_:* = "btn_" + _loc2_.method_5980 + "_";
         _loc2_.init(this.var_1718.getEmbeddedBitmapData(_loc3_ + "std.png"),this.var_1718.getEmbeddedBitmapData(_loc3_ + "mo.png"),this.var_1718.getEmbeddedBitmapData(_loc3_ + "da.png"));
         return _loc2_;
      }
      
      public function method_4371(param1:int) : Bitmap
      {
         var _loc2_:String = !!this.var_3650[param1] ? this.var_3650[param1] : this.var_3650[0];
         return this.var_3724.getEmbeddedBitmap(_loc2_);
      }
      
      private function method_6269() : class_1689
      {
         var _loc1_:* = null;
         if(this.var_2273)
         {
            if(this.var_329 != null && this.var_329.type == class_1689.const_1188)
            {
               class_94.getInstance().method_4247(this.var_329);
               this.var_329.handleClick = null;
               if(contains(this.var_329))
               {
                  removeChild(this.var_329);
               }
               this.var_329 = null;
            }
            if(this.var_329 == null)
            {
               this.var_329 = this.method_6335(class_1689.const_2840);
               this.var_329.handleClick = this.method_5419;
            }
            _loc1_ = "label_grp_allow_invitations";
         }
         else
         {
            if(this.var_329 != null && this.var_329.type == class_1689.const_2840)
            {
               class_94.getInstance().method_4247(this.var_329);
               this.var_329.handleClick = null;
               if(contains(this.var_329))
               {
                  removeChild(this.var_329);
               }
               this.var_329 = null;
            }
            if(this.var_329 == null)
            {
               this.var_329 = this.method_6335(class_1689.const_1188);
               this.var_329.handleClick = this.method_5419;
            }
            _loc1_ = "label_grp_block_invitations";
         }
         this.var_329.x = this.var_3054.x + this.var_3054.width + 4;
         this.var_329.y = this.var_3054.y;
         if(!contains(this.var_329))
         {
            addChild(this.var_329);
         }
         class_94.getInstance().method_4247(this.var_329);
         class_94.getInstance().method_1211(this.var_329,class_88.getItem(_loc1_));
         return this.var_329;
      }
      
      public function get method_2620() : Array
      {
         return this.var_1806;
      }
      
      public function set method_2620(param1:Array) : void
      {
         this.var_1806 = param1;
      }
      
      public function get method_4190() : Vector.<class_1154>
      {
         return this.var_2670;
      }
      
      public function set method_4190(param1:Vector.<class_1154>) : void
      {
         this.var_2670 = param1;
      }
      
      public function get method_5868() : Vector.<class_1154>
      {
         return this.var_1880;
      }
      
      public function set method_5868(param1:Vector.<class_1154>) : void
      {
         this.var_1880 = param1;
      }
      
      public function get method_2650() : Boolean
      {
         return this.var_397;
      }
      
      public function set method_2650(param1:Boolean) : void
      {
         this.var_397 = param1;
      }
      
      public function get method_2590() : class_131
      {
         return this.var_3793;
      }
      
      public function set method_2590(param1:class_131) : void
      {
         this.var_3793 = param1;
         this.update();
      }
      
      public function method_1422(param1:int) : class_2006
      {
         var _loc2_:class_2006 = new class_2006();
         _loc2_.method_1736 = this.method_4371(param1);
         return _loc2_;
      }
      
      public function method_920(param1:int) : class_2003
      {
         var _loc2_:class_2003 = new class_2003();
         var _loc3_:Bitmap = this.method_4371(param1);
         _loc2_.method_1736 = _loc3_;
         return _loc2_;
      }
      
      public function get method_5594() : Boolean
      {
         return this.var_2226;
      }
   }
}
