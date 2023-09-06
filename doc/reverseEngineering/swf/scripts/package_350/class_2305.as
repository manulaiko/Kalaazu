package package_350
{
   import com.bigpoint.utils.class_73;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;
   import package_11.class_39;
   import package_26.class_94;
   import package_30.class_219;
   import package_30.class_91;
   import package_33.class_93;
   import package_39.class_1052;
   import package_39.class_1561;
   import package_46.class_131;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_2305 extends Sprite
   {
       
      
      public var var_1599:Vector.<class_1052>;
      
      public var var_4033:Vector.<class_219>;
      
      public var var_3146:Vector.<class_219>;
      
      public var var_2237:Vector.<class_219>;
      
      public var var_4481:Vector.<class_91>;
      
      public function class_2305()
      {
         this.var_1599 = new Vector.<class_1052>();
         this.var_4033 = new Vector.<class_219>();
         this.var_3146 = new Vector.<class_219>();
         this.var_2237 = new Vector.<class_219>();
         this.var_4481 = new Vector.<class_91>();
         super();
         ResourceManager.method_1412(class_265.name_129,this.method_650,new Function());
      }
      
      public function method_6514() : void
      {
         ResourceManager.method_1412(class_265.name_129,this.method_650,new Function());
      }
      
      private function method_650(param1:class_39) : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         if(class_50.getInstance().map == null)
         {
            return;
         }
         var _loc2_:class_58 = class_58.instance;
         var _loc3_:class_131 = (_loc2_.method_468(GuiConstants.SECTOR_CONTROL_WINDOW) || _loc2_.createWindow(GuiConstants.SECTOR_CONTROL_WINDOW)) as class_131;
         _loc4_ = new class_93(_loc2_,class_93.const_2699);
         var _loc5_:int = 0;
         _loc4_.x = 12;
         _loc4_.y = 35;
         this.var_1599.length = 4;
         this.var_4033.length = 4;
         this.var_3146.length = 4;
         this.var_2237.length = 4;
         this.var_4481.length = 4;
         _loc6_ = 1;
         while(_loc6_ <= 3)
         {
            _loc7_ = param1.getEmbeddedBitmap("logo" + class_126.instance.method_2919[_loc6_]);
            (_loc8_ = new class_1561()).backgroundColor = class_18.const_1129;
            _loc8_.var_4104 = false;
            _loc8_.var_431 = class_1561.const_1655;
            _loc8_.barColor = class_126.getInstance().method_6115[_loc6_];
            (_loc9_ = new class_1052(0,_loc7_,_loc8_)).method_3166();
            _loc9_.y = _loc5_;
            _loc9_.setSize(100,6);
            _loc4_.addElement(_loc9_);
            this.var_1599[_loc6_] = _loc9_;
            _loc10_ = class_18.const_688;
            _loc11_ = new TextFormat(_loc10_.font,_loc10_.size,class_126.getInstance().method_6115[_loc6_],_loc10_.bold,_loc10_.italic,_loc10_.underline,_loc10_.url,_loc10_.target,_loc10_.align);
            (_loc12_ = new class_219(40,40,_loc11_,"?",TextFormatAlign.LEFT)).y = _loc5_ - 4;
            _loc12_.x = _loc9_.x + _loc7_.width + 5;
            _loc4_.addElement(_loc12_);
            this.var_4033[_loc6_] = _loc12_;
            class_94.getInstance().method_1211(this.var_1599[_loc6_],class_88.getItem("ttip_sectorcontrol_ingame_status_tickets").replace("%FACTION%",class_126.getInstance().method_2919[_loc6_]));
            class_94.getInstance().method_1211(this.var_4033[_loc6_],class_88.getItem("ttip_sectorcontrol_ingame_status_tickets").replace("%FACTION%",class_126.getInstance().method_2919[_loc6_]));
            (_loc13_ = new class_219(30,40,class_18.const_3286,"?",TextFormatAlign.RIGHT)).y = _loc5_;
            _loc13_.x = 118;
            _loc4_.addElement(_loc13_);
            this.var_3146[_loc6_] = _loc13_;
            (_loc14_ = new class_219(40,40,class_18.const_3286,"/?",TextFormatAlign.LEFT)).y = _loc5_;
            _loc14_.x = 145;
            _loc4_.addElement(_loc14_);
            this.var_2237[_loc6_] = _loc14_;
            class_94.getInstance().method_1211(this.var_3146[_loc6_],class_88.getItem("ttip_sectorcontrol_ingame_status_players"));
            class_94.getInstance().method_1211(this.var_2237[_loc6_],class_88.getItem("ttip_sectorcontrol_ingame_status_players"));
            (_loc15_ = new class_91(class_91.const_533)).y = _loc5_;
            _loc15_.addChild(param1.getEmbeddedBitmap("damageBonusIcon"));
            _loc15_.x = 180;
            _loc15_.visible = false;
            _loc4_.addElement(_loc15_);
            this.var_4481[_loc6_] = _loc15_;
            _loc5_ += _loc7_.height + 10;
            _loc6_++;
         }
         _loc3_.method_1655(_loc4_);
         _loc3_.maximize();
      }
      
      public function method_5785(param1:class_73) : void
      {
         var _loc2_:int = int(param1.x);
         var _loc3_:Number = Math.min(param1.y,5) / 2;
         if(this.var_1599.length > _loc2_)
         {
            this.var_1599[_loc2_].method_5417(_loc3_,0.2 / _loc3_);
         }
      }
   }
}
