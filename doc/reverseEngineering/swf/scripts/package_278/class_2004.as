package package_278
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
   import package_139.class_1153;
   import package_139.class_1156;
   import package_139.class_428;
   import package_17.class_62;
   import package_26.class_333;
   import package_26.class_94;
   
   public class class_2004 extends Sprite
   {
      
      private static const const_2049:int = 24;
      
      private static const const_1828:int = 1;
      
      private static const const_2669:int = 4;
       
      
      private var var_2089:class_2316;
      
      private var var_4426:Boolean;
      
      private var var_3604:Boolean;
      
      private var var_921:int;
      
      private var var_100:class_1156;
      
      private var var_27:TextField;
      
      private var var_5024:String;
      
      private var var_2800:String;
      
      private var var_1816:int;
      
      private var var_914:class_2003;
      
      private var var_2455:int;
      
      private var var_511:TextField;
      
      private var var_2187:class_333;
      
      private var var_3384:Boolean;
      
      private var var_4214:Boolean;
      
      private var var_786:class_1688;
      
      private var var_1402:DisplayObjectContainer;
      
      private var var_275:class_2003;
      
      private var var_3909:int = 0;
      
      private var var_3900:int = 0;
      
      private var var_2722:Bitmap;
      
      private var var_3959:Boolean;
      
      private var var_2223:TextFormat;
      
      private var var_3778:TextFormat;
      
      private var var_1540:Boolean;
      
      private var _bg:Sprite;
      
      private var var_4039:Sprite;
      
      private var var_4836:Boolean;
      
      private var var_1754:Boolean;
      
      private var var_4491:String;
      
      private var var_2121:String;
      
      private var var_77:String;
      
      private var _target:class_1153;
      
      private var var_88:Array;
      
      public function class_2004()
      {
         this.var_1402 = new Sprite();
         this._target = new class_1153();
         this.var_88 = [new GlowFilter(33023,1,2,2,50,1,true)];
         super();
         this._bg = new Sprite();
         this._bg.addChild(new Bitmap(new BitmapData(216,40,true,0)));
         addChildAt(this._bg,0);
         this.var_511 = new TextField();
         this.var_511.width = 24;
         this.var_511.y = 4;
         this.var_2187 = class_94.getInstance().method_1211(this.var_511,"?");
         addChild(this.var_511);
         this.var_27 = new TextField();
         this.var_27.x = const_2049;
         addChild(this.var_27);
         this.var_4039 = new Sprite();
         this.var_4039.mouseEnabled = false;
         this.var_4039.mouseChildren = true;
         this.method_1358();
         this.var_3909 += NaN;
         this.var_3900 = NaN;
         this.var_4491 = class_88.getItem("label_grp_hitpoints");
         this.var_2121 = class_88.getItem("label_grp_nanohull");
         this.var_77 = class_88.getItem("label_grp_shield");
         this.var_4039.addChild(this.method_4062());
      }
      
      private function method_4062() : DisplayObject
      {
         var _loc1_:Shape = new Shape();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.beginFill(855671039);
         _loc2_.drawRoundRect(-1,-1,190,45,20);
         return _loc1_;
      }
      
      private function method_3628(param1:Bitmap) : void
      {
         this.var_1402.addChild(param1);
      }
      
      public function method_6493() : void
      {
         if(!this.var_4836)
         {
            return;
         }
         if(contains(this.var_4039))
         {
            removeChild(this.var_4039);
         }
         this.var_4039.removeEventListener(MouseEvent.CLICK,this.method_670);
         this.var_4039.removeEventListener(MouseEvent.MOUSE_OVER,this.method_510);
         this.var_4039.removeEventListener(MouseEvent.MOUSE_OUT,this.method_5345);
         this.var_4836 = false;
      }
      
      public function method_3333() : void
      {
         if(this.var_4836)
         {
            return;
         }
         if(!contains(this.var_4039))
         {
            addChild(this.var_4039);
            this.var_4039.alpha = 0;
         }
         addEventListener(MouseEvent.CLICK,this.method_670);
         addEventListener(MouseEvent.MOUSE_OVER,this.method_510);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_5345);
         this.var_4836 = true;
      }
      
      public function dispose() : void
      {
      }
      
      private function method_1358() : void
      {
         this.var_2223 = new TextFormat(class_18.const_1629.font,class_18.const_2668);
         this.var_2223.color = class_18.WHITE;
         this.var_3778 = new TextFormat(class_18.const_1629.font,class_18.const_2668);
         this.var_3778.color = 10066329;
         var _loc1_:TextFormat = new TextFormat(class_18.const_1629.font,0);
         _loc1_.color = 16777215;
         this.setStyle(this.var_27,this.var_2223,class_18.var_620);
         var _loc2_:TextFormat = new TextFormat(class_18.const_1147.font,class_18.const_2081);
         _loc2_.color = 10066329;
         _loc2_.align = TextFormatAlign.CENTER;
         this.var_511.height = NaN;
         this.var_511.embedFonts = class_18.var_3322;
         this.var_511.defaultTextFormat = _loc2_;
         this.var_511.antiAliasType = AntiAliasType.ADVANCED;
         this.var_511.selectable = false;
      }
      
      private function setStyle(param1:TextField, param2:TextFormat, param3:Boolean) : void
      {
         param1.height = int(param2.size) + 6;
         param1.embedFonts = param3;
         param1.defaultTextFormat = param2;
         param1.antiAliasType = AntiAliasType.ADVANCED;
         param1.selectable = false;
      }
      
      private function method_3276() : void
      {
      }
      
      private function method_1340() : void
      {
      }
      
      public function update() : void
      {
         this.method_2543();
         this.method_3745();
         this.method_4655();
         this.updateTarget();
         this.method_1745();
         this.method_2902();
         this.method_3030();
         this.method_1852();
         this.method_1423();
      }
      
      private function updateTarget() : void
      {
         this.method_6();
         this.method_3269();
         this.method_2735();
         this.method_5096();
         this.method_2582();
      }
      
      private function method_2582() : void
      {
         if(this._target.var_4879 != this.var_100.name_22.var_4879)
         {
            this._target.var_4879 = this.var_100.name_22.var_4879;
            if(Boolean(this._target.var_4879) && Boolean(this._target.var_4879.length))
            {
               class_94.getInstance().method_1211(this.var_1402,this._target.var_4879);
            }
            else
            {
               class_94.getInstance().method_1211(this.var_1402,"---");
            }
         }
      }
      
      private function method_2543() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(this.var_4214 != this.var_100.name_157)
         {
            this.var_4214 = this.var_100.name_157;
            _loc1_ = true;
            _loc2_ = true;
         }
         if(this.var_1816 != this.var_100.var_4179.var_4184)
         {
            this.var_1816 = this.var_100.var_4179.var_4184;
            _loc1_ = true;
            _loc2_ = true;
         }
         if(this.var_3384 != this.var_100.var_3150)
         {
            this.var_3384 = this.var_100.var_3150;
            _loc1_ = true;
         }
         if(this.var_1540 != this.var_100.var_1147)
         {
            this.var_1540 = this.var_100.var_1147;
            _loc1_ = true;
         }
         if(this._target.var_4184 != this.var_100.name_22.var_4184)
         {
            this._target.var_4184 = this.var_100.name_22.var_4184;
            _loc1_ = true;
            _loc2_ = true;
         }
         if(_loc1_)
         {
            this.method_1897(_loc2_).cloaked = this.var_3384;
            this.method_1897().name_162 = this.var_1540;
         }
      }
      
      private function method_1897(param1:Boolean = false) : class_1687
      {
         if(this.var_914 == null)
         {
            if(this.var_4214)
            {
               this.var_914 = new class_2003();
               this.var_914.name_157 = this.var_100.name_157;
               this.var_914.method_1736 = this.var_786.method_1977("disconnect_icon.png");
            }
            else
            {
               this.var_914 = this.var_786.method_920(this.var_100.var_4179.var_4184);
               this.var_914.name_157 = this.var_100.name_157;
            }
            this.var_914.x = 4;
            this.var_914.y = NaN;
            addChildAt(this.var_914,1);
         }
         else if(param1)
         {
            if(this.var_4214)
            {
               this.var_914.name_157 = this.var_100.name_157;
               this.var_914.method_1736 = this.var_786.method_1977("disconnect_icon.png");
            }
            else
            {
               this.var_914.method_1736 = this.var_786.method_4371(this.var_100.var_4179.var_4184);
               this.var_914.name_157 = this.var_100.name_157;
            }
         }
         return this.var_914;
      }
      
      private function method_6() : void
      {
         if(Boolean(this.var_100.name_22) && this.var_100.name_22.var_4184 == -1)
         {
            if(this.var_275 != null && Boolean(contains(this.var_275)))
            {
               removeChild(this.var_275);
            }
            this.var_275 = null;
         }
         else if(this.var_100.name_22 != null && this.var_100.name_22.var_4184 > 0)
         {
            if(this.var_275 != null && Boolean(this.var_275.parent))
            {
               this.var_275.method_1736 = this.var_786.method_4371(this.var_100.name_22.var_4184);
            }
            else
            {
               this.var_275 = this.var_786.method_920(this.var_100.name_22.var_4184);
               addChildAt(this.var_275,1);
               this.var_275.x = this.var_27.x + 72;
               this.var_275.y = NaN;
            }
            if(!this.var_1402.parent)
            {
               this.var_275.addChild(this.var_1402);
            }
            this.var_1402.x = (Number(this.var_275.method_1736.width) - Number(this.var_1402.width)) * 0.5;
            this.var_1402.y = (Number(this.var_275.method_1736.height) - Number(this.var_1402.height)) * 0.5;
            this.var_1402.visible = true;
            this.method_1340();
         }
         else
         {
            if(this.var_275 != null && Boolean(contains(this.var_275)))
            {
               this.var_275.method_1736 = this.var_786.method_4371(0);
            }
            else
            {
               this.var_275 = this.var_786.method_920(0);
               addChildAt(this.var_275,1);
               this.var_275.x = this.var_27.x + 72;
               this.var_275.y = NaN;
            }
            this.var_1402.visible = false;
            this.method_3276();
         }
      }
      
      private function method_4655() : void
      {
         var _loc1_:* = null;
         if(this.var_2455 != this.var_100.mapID)
         {
            this.var_2455 = this.var_100.mapID;
            _loc1_ = class_126.instance;
            this.var_511.text = _loc1_.method_4856(this.var_2455);
            this.var_2187.method_1455(_loc1_.method_535(this.var_2455));
         }
         if(this.var_786 != null && this.var_2455 == this.var_786.method_3379 && !this.var_4214)
         {
            this.method_1897().method_5274 = false;
            this.var_27.defaultTextFormat = this.var_2223;
            this.method_4193();
         }
         else
         {
            this.var_511.visible = true;
            this.method_1897().method_5274 = true;
            this.var_27.defaultTextFormat = this.var_3778;
            this.method_5988();
         }
         this.var_27.setTextFormat(this.var_27.defaultTextFormat);
      }
      
      private function method_2902() : void
      {
         if(this.var_100.var_4179.var_707 > 0 && !this.var_4214)
         {
            this.var_914.method_42.update(this.var_100.var_4179.var_111,this.var_100.var_4179.var_707);
         }
         else
         {
            this.var_914.method_42.update(0,1);
         }
         this.var_914.method_875.method_1455(this.var_4491 + "\n" + class_122.method_98(this.var_100.var_4179.var_111) + "|" + class_122.method_98(this.var_100.var_4179.var_707));
      }
      
      private function method_3030() : void
      {
         if(this.var_100.var_4179.var_2451 > 0 && !this.var_4214)
         {
            this.var_914.method_4259.update(this.var_100.var_4179.var_4409,this.var_100.var_4179.var_2451);
         }
         else
         {
            this.var_914.method_4259.update(0,1);
         }
         this.var_914.method_6264.method_1455(this.var_2121 + "\n" + class_122.method_98(this.var_100.var_4179.var_4409) + "|" + class_122.method_98(this.var_100.var_4179.var_2451));
      }
      
      private function method_1745() : void
      {
         if(this.var_100.var_4179.name_105 > 0 && !this.var_4214)
         {
            this.var_914.method_4971.update(this.var_100.var_4179.var_4678,this.var_100.var_4179.name_105);
         }
         else
         {
            this.var_914.method_4971.update(0,1);
         }
         this.var_914.method_5347.method_1455(this.var_77 + "\n" + class_122.method_98(this.var_100.var_4179.var_4678) + "|" + class_122.method_98(this.var_100.var_4179.name_105));
      }
      
      private function method_3269() : void
      {
         if(this.var_100.name_22.var_707 > 0 && !this.var_4214)
         {
            this.var_275.method_42.update(this.var_100.name_22.var_111,this.var_100.name_22.var_707);
         }
         else
         {
            this.var_275.method_42.update(0,1);
         }
         this.var_275.method_875.method_1455(this.var_4491 + "\n" + class_122.method_98(this.var_100.name_22.var_111) + "|" + class_122.method_98(this.var_100.name_22.var_707));
      }
      
      private function method_5096() : void
      {
         if(this.var_100.name_22.var_2451 > 0 && !this.var_4214)
         {
            this.var_275.method_4259.update(this.var_100.name_22.var_4409,this.var_100.name_22.var_2451);
         }
         else
         {
            this.var_275.method_4259.update(0,1);
         }
         this.var_275.method_6264.method_1455(this.var_2121 + "\n" + class_122.method_98(this.var_100.name_22.var_4409) + "|" + class_122.method_98(this.var_100.name_22.var_2451));
      }
      
      private function method_2735() : void
      {
         if(this.var_100.name_22.name_105 > 0 && !this.var_4214)
         {
            this.var_275.method_4971.update(this.var_100.name_22.var_4678,this.var_100.name_22.name_105);
         }
         else
         {
            this.var_275.method_4971.update(0,1);
         }
         this.var_275.method_5347.method_1455(this.var_77 + "\n" + class_122.method_98(this.var_100.name_22.var_4678) + "|" + class_122.method_98(this.var_100.name_22.name_105));
      }
      
      private function method_3745() : void
      {
         if(this.var_2800 != this.var_100.name_145 || this.var_5024 != this.var_100.var_5016)
         {
            this.var_2800 = this.var_100.name_145;
            this.var_5024 = this.var_100.var_5016;
            this.var_27.text = this.var_5024;
         }
         if(this.var_4426 != this.var_100.var_2305)
         {
            this.var_4426 = this.var_100.var_2305;
            this.var_27.filters = !!this.var_4426 ? this.var_88 : null;
         }
      }
      
      public function set method_83(param1:class_1688) : void
      {
         this.var_786 = param1;
         this.method_5924();
      }
      
      private function method_5924() : void
      {
         class_62.getInstance().sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(this.method_3628,"ui",new <String>["group_sys_small_target"],Bitmap,null,false));
      }
      
      public function cleanup() : void
      {
         this.method_5988();
         this.method_3276();
      }
      
      private function method_4193() : void
      {
         if(this.var_1754)
         {
            return;
         }
         this.var_1754 = true;
         this.var_27.mouseEnabled = this.var_1754;
         this.var_27.addEventListener(MouseEvent.CLICK,this.method_4205);
         this.method_1897().addEventListener(MouseEvent.CLICK,this.method_4205);
      }
      
      private function method_5988() : void
      {
         if(!this.var_1754)
         {
            return;
         }
         this.var_1754 = false;
         this.var_27.mouseEnabled = this.var_1754;
         this.var_27.removeEventListener(MouseEvent.CLICK,this.method_4205);
         this.method_1897().removeEventListener(MouseEvent.CLICK,this.method_4205);
      }
      
      public function get method_1109() : int
      {
         return this.var_3900;
      }
      
      public function get name_111() : Boolean
      {
         return this.var_100.name_111;
      }
      
      public function method_1423(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         if(this.var_921 != this.var_100.var_3592 || this.var_100.var_311 != this.var_3604 || param1)
         {
            this.var_921 = this.var_100.var_3592;
            this.var_3604 = this.var_100.var_311;
            if(this.var_921 == class_428.const_1802)
            {
               if(this.var_2089 != null && Boolean(this.var_2089.parent))
               {
                  this.var_2089.parent.removeChild(this.var_2089);
               }
            }
            else
            {
               if(this.var_2089 == null)
               {
                  this.var_2089 = new class_2316();
                  this.var_2089.maxHeight = Number(this.var_27.height) - Number(const_2669);
                  this.var_2089.method_4219 = const_1828;
               }
               _loc2_ = int(this.method_1906(this.var_921));
               _loc3_ = uint(this.method_205(_loc2_));
               this.var_2089.toolTip = this.method_3093(_loc2_);
               this.var_2089.color = _loc3_;
               this.var_2089.method_6112 = this.var_921;
               this.var_2089.x = int(this.var_275.x + this.var_275.width - Number(this.var_2089.width));
               this.var_2089.y = int(this.var_27.y);
               this.var_2089.method_1407 = this.var_3604;
               if(!contains(this.var_2089))
               {
                  addChildAt(this.var_2089,1);
               }
            }
            this.method_1852(true);
         }
      }
      
      private function method_3093(param1:int) : String
      {
         var _loc2_:String = class_126.getInstance().method_6272(param1);
         return class_88.getItem(_loc2_);
      }
      
      private function method_205(param1:int) : uint
      {
         return class_126.getInstance().method_402(param1);
      }
      
      private function method_1906(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == class_428.const_1802)
         {
            _loc2_ = 0;
         }
         else if(true)
         {
            _loc2_ = 0;
         }
         else if(param1 == class_81.var_3592)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      private function method_1852(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(this.var_3959 != this.var_100.name_111 || param1)
         {
            this.var_3959 = this.var_100.name_111;
            if(!this.var_3959)
            {
               if(this.var_2722 != null && Boolean(this.var_2722.parent))
               {
                  this.var_2722.parent.removeChild(this.var_2722);
               }
            }
            else
            {
               if(this.var_2722 == null)
               {
                  this.var_2722 = this.var_786.method_1977("boss_icon.png");
               }
               if(!contains(this.var_2722))
               {
                  addChildAt(this.var_2722,1);
               }
               _loc2_ = !!this.var_2089 ? int(this.var_2089.x) : this.var_275.width + this.var_275.x;
               this.var_2722.x = _loc2_ - Number(this.var_2722.width);
               this.var_2722.y = this.var_27.y;
            }
         }
      }
      
      public function get method_2770() : class_1156
      {
         return this.var_100;
      }
      
      public function set method_2770(param1:class_1156) : void
      {
         this.var_100 = param1;
      }
      
      private function method_5345(param1:MouseEvent = null) : void
      {
         TweenLite.to(this.var_4039,0.2,{"alpha":0});
      }
      
      private function method_510(param1:MouseEvent = null) : void
      {
         TweenLite.to(this.var_4039,0.2,{"alpha":0.1});
      }
      
      private function method_670(param1:MouseEvent = null) : void
      {
         this.var_786.method_5613(this.var_100);
      }
      
      private function method_4205(param1:MouseEvent = null) : void
      {
         if(this.var_786 != null)
         {
            this.var_786.method_2362(this.var_100.id);
         }
      }
   }
}
