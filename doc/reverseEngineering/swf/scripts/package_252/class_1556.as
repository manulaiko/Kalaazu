package package_252
{
   import fl.controls.ComboBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.gui.class_1044;
   import package_11.class_39;
   import package_26.class_333;
   import package_26.class_94;
   import package_30.class_91;
   import package_9.ResourceManager;
   
   public class class_1556 extends class_91
   {
      
      public static const const_2030:int = 20;
       
      
      public var type:int;
      
      public var labelKey:String;
      
      private var var_1673:TextField;
      
      private var elements:Array;
      
      public var isAdvanced:Boolean;
      
      private var name_9:String;
      
      private var name_54:ComboBox;
      
      private var var_160:Sprite;
      
      public function class_1556(param1:int, param2:String, param3:Array, param4:String = "", param5:Boolean = false)
      {
         super(class_91.const_149);
         this.type = param1;
         this.elements = param3;
         this.labelKey = param2;
         this.isAdvanced = param5;
         this.name_9 = param4;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_1673 = new TextField();
         this.var_1673.selectable = false;
         this.var_1673.defaultTextFormat = class_18.const_2843;
         this.var_1673.textColor = 16777215;
         this.var_1673.text = class_88.getItem(this.labelKey);
         this.var_1673.border = false;
         this.var_1673.embedFonts = class_18.var_5039;
         this.var_1673.autoSize = TextFieldAutoSize.LEFT;
         this.var_1673.antiAliasType = AntiAliasType.ADVANCED;
         this.var_1673.wordWrap = true;
         this.var_1673.height = class_18.const_151;
         this.var_1673.width = 140;
         this.var_1673.y = 0;
         addChild(this.var_1673);
         this.name_54 = new ComboBox();
         this.name_54.y = this.var_1673.height + 2;
         this.name_54.mouseFocusEnabled = false;
         for each(_loc1_ in this.elements)
         {
            this.name_54.addItem({
               "id":_loc1_.getID(),
               "label":_loc1_.getValue()
            });
         }
         this.name_54.addEventListener(Event.CHANGE,this.method_5113);
         this.addChild(this.name_54);
         if(this.name_9 != "")
         {
            this.var_160 = new Sprite();
            this.var_160.addChild(class_39(ResourceManager.name_15.getFinisher("icons")).getEmbeddedBitmap("general_help"));
            this.var_160.x = this.name_54.x + this.name_54.width + 5;
            this.var_160.y = this.name_54.y + 4;
            this.addChild(this.var_160);
            _loc2_ = class_94.getInstance().method_1211(this.var_160,this.name_9);
            if(_loc2_)
            {
               _loc2_.showImmediately = true;
            }
         }
      }
      
      public function setSelected(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < this.name_54.length)
         {
            _loc2_ = this.name_54.getItemAt(_loc3_);
            if(_loc2_.id == param1)
            {
               this.name_54.selectedIndex = _loc3_;
            }
            _loc3_++;
         }
      }
      
      public function method_3982() : int
      {
         var _loc1_:Object = this.name_54.getItemAt(this.name_54.selectedIndex);
         return _loc1_.id;
      }
      
      public function setSetting() : void
      {
         var _loc1_:int = int(this.method_3982());
         class_1044.method_3423(this.type,String(_loc1_));
      }
      
      public function resetSetting() : void
      {
         var _loc1_:int = int(class_1044.method_508(this.type));
         this.setSelected(_loc1_);
      }
      
      private function method_5113(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function show(param1:Boolean) : void
      {
         this.var_1673.visible = param1;
         this.name_54.visible = param1;
         if(this.var_160 != null)
         {
            this.var_160.visible = param1;
         }
      }
   }
}
