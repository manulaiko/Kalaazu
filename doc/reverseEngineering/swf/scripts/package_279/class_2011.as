package package_279
{
   import com.adobe.utils.StringUtil;
   import com.bigpoint.utils.class_73;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_39;
   import package_112.class_307;
   import package_113.class_310;
   import package_22.class_198;
   import package_29.class_85;
   import package_76.class_2321;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_2011 extends Sprite implements IDisposable
   {
      
      private static const const_619:Array = [new GlowFilter(0,0.7,5,5,6,BitmapFilterQuality.HIGH)];
      
      private static const const_470:Object = {};
      
      {
         const_470[1] = "allied";
         const_470[2] = "noAttackPact";
         const_470[3] = "atWar";
      }
      
      private var var_129:Sprite;
      
      private var var_2256:Bitmap;
      
      private var var_1736:Bitmap;
      
      private var var_1303:Bitmap;
      
      private var var_2605:TextField;
      
      private var var_312:TextField;
      
      private var var_586:TextField;
      
      private var _owner:class_85;
      
      private var var_176:class_310;
      
      private var var_2228:class_2322;
      
      private var var_1267:class_2320;
      
      public function class_2011(param1:class_310)
      {
         this.var_129 = new Sprite();
         this.var_2256 = new Bitmap();
         this.var_1736 = new Bitmap();
         this.var_1303 = new Bitmap();
         this.var_2605 = new TextField();
         this.var_312 = new TextField();
         this.var_586 = new TextField();
         this.var_2228 = new class_2322();
         this.var_1267 = new class_2320();
         super();
         this.var_176 = param1;
         this._owner = param1.owner;
         this.var_176.name_145.changed.add(this.method_672);
         this.var_176.name_140.changed.add(this.method_672);
         this.var_176.factionID.changed.add(this.method_672);
         this.var_176.const_94.changed.add(this.method_672);
         this.var_176.const_1670.changed.add(this.method_672);
         this.var_176.name_148.changed.add(this.method_672);
         addChild(this.var_129);
         this.var_1267.addElement(this.var_1736);
         this.var_1267.addElement(this.var_2256);
         this.var_2228.alignment = class_2322.CUSTOM;
         this.var_2228.method_5943 = class_2322.CENTER;
         this.var_2228.addElement(this.var_1267);
         this.var_2228.addElement(this.var_312);
         this.var_2228.addElement(this.var_2605);
         this.var_2228.addElement(this.var_1303);
         this.var_129.addChild(this.var_586);
         this.var_129.addChild(this.var_2228);
         Settings.displayPlayerNames.changed.add(this.method_5560);
         this.method_5560();
         this.method_672();
      }
      
      public static function method_4800(param1:int) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         if(param1 != 0)
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < class_2319.const_216)
            {
               _loc2_[_loc3_] = false;
               _loc4_ = 1 << _loc3_;
               if((param1 & _loc4_) == _loc4_)
               {
                  _loc2_[_loc3_] = true;
               }
               _loc3_++;
            }
            return _loc2_;
         }
         return [];
      }
      
      private static function method_5291(param1:int) : String
      {
         return true || true;
      }
      
      private static function method_1913(param1:class_310, param2:class_310) : String
      {
         var _loc3_:* = null;
         if(param1.owner.id == class_81.userID || param1.owner is class_307 && Boolean(class_307(param1.owner).isHeroPet()))
         {
            _loc3_ = "neutral";
         }
         else if(param1.owner is class_86 && Boolean((param1.owner as class_86).name_166.value))
         {
            _loc3_ = "sameGroup";
         }
         else if(param1.name_32.value != 0 && param1.name_32.value == param2.name_32.value)
         {
            _loc3_ = "sameClan";
         }
         else if(param1.factionID.value == param2.factionID.value)
         {
            _loc3_ = "sameFraction";
         }
         else if(param1.owner is class_86 && (param1.owner as class_86).shipPattern && Boolean((param1.owner as class_86).shipPattern.isLegendaryEventNPC))
         {
            _loc3_ = "legendary";
         }
         else
         {
            _loc3_ = "enemy";
         }
         return _loc3_;
      }
      
      private function method_5216() : void
      {
         this.var_2228.y = !!this.var_1736.visible ? (!!this.var_586.visible ? this.var_586.height : 0) + this.var_1736.height : (!!this.var_586.visible ? Number(this.var_586.height) : 0);
         this.var_1267.y = !!this.var_1736.visible ? -Number(this.var_1736.height) : 0;
         this.var_2228.updateLayout();
         this.var_1267.updateLayout();
         this.var_586.x = -Number(this.var_586.width) / 2;
      }
      
      private function method_2964() : void
      {
         this.var_586.visible = Boolean(this.var_176.const_1670.value);
         if(!this.var_176.const_1670.value)
         {
            return;
         }
         var _loc1_:String = !!class_2321.method_3475(this.var_176.const_1670.value) ? class_88.getItem(this.var_176.const_1670.value) : class_88.method_734("achievements",this.var_176.const_1670.value);
         var _loc2_:uint = uint(class_126.instance.method_3790(this.var_176.const_1670.value));
         this.var_586.defaultTextFormat = class_18.const_3130;
         this.var_586.embedFonts = class_18.var_714;
         this.var_586.antiAliasType = AntiAliasType.ADVANCED;
         this.var_586.textColor = _loc2_;
         this.var_586.text = "<" + _loc1_ + ">";
         this.var_586.filters = const_619;
         this.var_586.autoSize = TextFieldAutoSize.LEFT;
      }
      
      private function updateIcons() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc2_:class_39 = class_39(ResourceManager.name_15.getFinisher("icons"));
         if(this.var_176.name_140.value != 0)
         {
            this.var_2256.visible = true;
            this.var_2256.bitmapData = BitmapData(_loc2_.getEmbeddedBitmapData("rank" + this.var_176.name_140.value));
         }
         else
         {
            this.var_2256.visible = false;
         }
         if(this.var_176.factionID.value != 0)
         {
            try
            {
               _loc1_ = BitmapData(_loc2_.getEmbeddedBitmapData("fraction" + this.var_176.factionID.value));
            }
            catch(e:Error)
            {
            }
            this.var_1303.bitmapData = _loc1_;
            this.var_1303.visible = true;
         }
         else
         {
            if(this.var_1303.bitmapData)
            {
               this.var_1303.bitmapData.dispose();
            }
            this.var_1303.visible = false;
         }
         if(this.var_176.const_94.value > 0)
         {
            _loc3_ = ResourceManager.getBitmapData("ui","ggIconBg");
            _loc5_ = (_loc4_ = method_4800(this.var_176.const_94.value)).length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(_loc7_ = Boolean(_loc4_[_loc6_]))
               {
                  _loc8_ = ResourceManager.getBitmapData("ui",class_2319.const_779[_loc6_]);
                  _loc9_ = class_2319.const_2026[_loc6_];
                  _loc3_.copyPixels(_loc8_,_loc8_.rect,new Point(_loc9_.x,_loc9_.y));
               }
               _loc6_++;
            }
            this.var_1736.bitmapData = _loc3_;
            this.var_1736.visible = true;
         }
         else
         {
            this.var_1736.bitmapData = null;
            this.var_1736.visible = false;
         }
      }
      
      private function method_1746() : void
      {
         var _loc1_:class_90 = class_50.getInstance().map;
         var _loc2_:String = Boolean(_loc1_) && Boolean(_loc1_.hero) ? method_1913(this.var_176,_loc1_.hero.info) : "";
         var _loc3_:String = class_198.var_5023[_loc2_] || class_198.var_5023["enemy"];
         var _loc4_:uint = parseInt("0x" + _loc3_);
         var _loc5_:TextFormat = new TextFormat(class_18.const_1095.font,class_18.const_198,_loc4_,class_18.const_1095.bold);
         this.var_2605.defaultTextFormat = _loc5_;
         this.var_2605.embedFonts = class_18.var_930;
         this.var_2605.antiAliasType = AntiAliasType.ADVANCED;
         this.var_2605.text = StringUtil.trim(this.var_176.name_148.value);
         this.var_2605.filters = const_619;
         this.var_2605.autoSize = TextFieldAutoSize.LEFT;
      }
      
      private function method_5508() : void
      {
         var _loc1_:String = method_5291(this.var_176.name_155.value);
         var _loc2_:String = class_198.var_5023[_loc1_] || class_198.var_5023["enemy"];
         var _loc3_:uint = parseInt("0x" + _loc2_);
         var _loc4_:TextFormat = new TextFormat(class_18.const_1095.font,class_18.const_198,_loc3_,class_18.const_1095.bold);
         this.var_312.defaultTextFormat = _loc4_;
         this.var_312.embedFonts = class_18.var_930;
         this.var_312.antiAliasType = AntiAliasType.ADVANCED;
         this.var_312.text = !!this.var_176.name_145.value ? "[" + StringUtil.trim(this.var_176.name_145.value) + "]" : "";
         this.var_312.filters = const_619;
         this.var_312.autoSize = TextFieldAutoSize.LEFT;
         this.var_312.visible = this.var_176.name_145.value != class_81.const_1509 && Boolean(this.var_176.name_145.value);
      }
      
      private function method_672() : void
      {
         if(hasEventListener(Event.ENTER_FRAME))
         {
            return;
         }
         if(!visible)
         {
            return;
         }
         addEventListener(Event.ENTER_FRAME,this.redraw);
      }
      
      private function redraw(param1:Event = null) : void
      {
         if(param1)
         {
            removeEventListener(Event.ENTER_FRAME,arguments.callee);
         }
         this.method_5508();
         this.method_1746();
         this.updateIcons();
         this.method_2964();
         this.method_5216();
      }
      
      private function method_5560() : void
      {
         this.visible = Settings.displayPlayerNames.value;
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         Settings.displayPlayerNames.changed.remove(this.method_5560);
         this.var_176.name_145.changed.remove(this.method_672);
         this.var_176.name_140.changed.remove(this.method_672);
         this.var_176.factionID.changed.remove(this.method_672);
         this.var_176.const_94.changed.remove(this.method_672);
         this.var_176.const_1670.changed.remove(this.method_672);
         this.var_176.name_148.changed.remove(this.method_672);
         removeEventListener(Event.ENTER_FRAME,this.redraw);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(visible != param1)
         {
            super.visible = param1;
            this.method_672();
         }
      }
   }
}
