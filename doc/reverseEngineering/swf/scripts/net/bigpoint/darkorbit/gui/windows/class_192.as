package net.bigpoint.darkorbit.gui.windows
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.gui.class_226;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
   import net.bigpoint.darkorbit.net.class_74;
   import package_11.class_39;
   import package_14.class_52;
   import package_22.class_198;
   import package_27.class_82;
   import package_30.VideoElement;
   import package_30.class_185;
   import package_30.class_209;
   import package_30.class_218;
   import package_33.class_93;
   import package_46.class_131;
   import package_9.ResourceManager;
   import package_9.class_50;
   import package_99.class_266;
   
   public class class_192 extends class_131 implements class_52
   {
      
      public static const const_2000:int = 9876;
       
      
      public var startX:int = 0;
      
      public var startY:int = 0;
      
      public var name_141:int = 0;
      
      public var name_18:int = 0;
      
      public var align:String = "n";
      
      public var var_566:Number = 0.5;
      
      protected var simpleContainer:class_93;
      
      protected var var_2249:VideoElement;
      
      protected var var_3997:class_209;
      
      public var var_1822:int;
      
      public var var_1615:int;
      
      public var languageKeys:Vector.<String>;
      
      protected var var_5019:class_218;
      
      protected var var_2348:class_218;
      
      private var var_2062:int = 0;
      
      private var var_2362:SoundChannel;
      
      private var name_59:class_226;
      
      private var valid:Boolean;
      
      protected var _showButtons:Boolean;
      
      private var var_4029:Number = 0;
      
      private var var_1661:Boolean = false;
      
      private var factionID:int;
      
      private var var_3247:int;
      
      public function class_192(param1:class_58, param2:FeatureWindowVO, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:int = 0)
      {
         this.languageKeys = new Vector.<String>();
         super();
         this.var_3247 = param3;
         param2.definition.draggable = true;
         param2.definition.closeable = param5 != VideoElement.const_1684;
         var _loc9_:class_39 = class_39(ResourceManager.name_15.getFinisher("window"));
         preinitialize(param2,param1,_loc9_);
         this.var_1822 = param4;
         this.var_1615 = param5;
         this.factionID = param8;
         this.align = param6;
         this._showButtons = param7;
         class_50.method_5621(this);
      }
      
      protected function init() : void
      {
         this.simpleContainer = new class_93(_guiManager,class_93.const_1852);
         this.method_1421();
         this.method_5238();
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         if(this._showButtons)
         {
            this.method_949(_loc1_);
            this.method_324(_loc1_);
            this.method_1625();
         }
         this.method_1655(this.simpleContainer);
         this.simpleContainer.x = 15;
         this.simpleContainer.y = 35;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         switch(this.align)
         {
            case "n":
               this.startX = Number(class_50.method_1849()) - _loc2_ / 2;
               this.startY = -_loc3_ - 100;
               this.name_141 = Number(class_50.method_1849()) - _loc2_ / 2;
               this.name_18 = 5;
               break;
            case "ne":
               this.startX = class_50.method_6533() + 10;
               this.startY = 5;
               this.name_141 = Number(class_50.method_6533()) - _loc2_ - 30;
               this.name_18 = 5;
               break;
            case "e":
               this.startX = class_50.method_6533() + 10;
               this.startY = Number(class_50.method_5866()) - _loc3_ / 2;
               this.name_141 = Number(class_50.method_6533()) - _loc2_ - 30;
               this.name_18 = Number(class_50.method_5866()) - _loc3_ / 2;
               break;
            case "se":
               this.startX = class_50.method_6533() + 10;
               this.startY = Number(class_50.method_1269()) - _loc3_ - 30;
               this.name_141 = Number(class_50.method_6533()) - _loc2_ - 30;
               this.name_18 = Number(class_50.method_1269()) - _loc3_ - 30;
               break;
            case "s":
               this.startX = Number(class_50.method_1849()) - _loc2_ / 2;
               this.startY = Number(class_50.method_1269()) - 10;
               this.name_141 = Number(class_50.method_1849()) - _loc2_ / 2;
               this.name_18 = Number(class_50.method_1269()) - _loc3_ - 30;
               break;
            case "sw":
               this.startX = -_loc2_ - 10;
               this.startY = Number(class_50.method_1269()) - _loc3_ - 30;
               this.name_141 = 5;
               this.name_18 = Number(class_50.method_1269()) - _loc3_ - 30;
               break;
            case "w":
               this.startX = -_loc2_ - 10;
               this.startY = Number(class_50.method_5866()) - _loc3_ / 2;
               this.name_141 = 5;
               this.name_18 = Number(class_50.method_5866()) - _loc3_ / 2;
               break;
            case "nw":
               this.startX = -_loc2_ - 10;
               this.startY = 65;
               this.name_141 = 5;
               this.name_18 = 65;
               break;
            case "c":
               this.startX = Number(class_50.method_1849()) - _loc2_ / 2;
               this.startY = -_loc3_ - 100;
               this.name_141 = Number(class_50.method_1849()) - _loc2_ / 2;
               this.name_18 = Number(class_50.method_5866()) - _loc3_ / 2;
         }
         this.x = this.startX;
         this.y = this.startY;
         class_50.method_4278().addChild(this);
      }
      
      protected function method_324(param1:class_39) : void
      {
         this.var_5019 = new class_218(class_185.const_1146,"",param1.getEmbeddedMovieClip("button1"));
         this.var_5019.addEventListener(MouseEvent.CLICK,this.method_3214);
         this.simpleContainer.addElement(this.var_5019,class_93.const_2374);
         this.var_5019.y = Number(this.var_2249.height) - Number(this.var_5019.height);
         this.var_5019.visible = false;
      }
      
      protected function method_949(param1:class_39) : void
      {
         this.var_2348 = new class_218(class_185.const_386,class_88.getItem("video_btn_showAll"),param1.getEmbeddedMovieClip("button1"));
         this.var_2348.addEventListener(MouseEvent.CLICK,this.method_3816);
         this.var_2348.x = this.var_3997.textArea.width + this.var_2249.width - Number(this.var_2348.width);
         this.var_2348.y = Number(this.var_2249.height) - Number(this.var_2348.height);
         this.var_2348.visible = false;
         this.simpleContainer.addElement(this.var_2348,class_93.const_2374);
      }
      
      protected function method_5238() : void
      {
         this.var_3997 = new class_209(238,125,TextFormatAlign.LEFT);
         this.simpleContainer.addElement(this.var_3997,class_93.const_2568);
      }
      
      protected function method_1421() : void
      {
         this.var_2249 = new VideoElement(this.var_1822,this.var_1615,this.factionID);
         this.simpleContainer.addElement(this.var_2249);
      }
      
      private function method_1625() : void
      {
         var _loc1_:String = this.method_3994();
         if(this.languageKeys.length > 0)
         {
            _loc1_ = "video_btn_continue";
         }
         this.var_5019.method_4577 = class_88.getItem(_loc1_);
         this.var_5019.x = this.var_3997.textArea.width + this.var_2249.width - Number(this.var_5019.width);
      }
      
      protected function method_3994() : String
      {
         return "label_close";
      }
      
      public function method_3837() : void
      {
         this.method_851();
         this.valid = true;
         var _loc1_:String = VideoElement.method_5060(this.var_1615,this.var_1822);
         if(ResourceManager.name_15.isLoaded(_loc1_))
         {
            this.show();
         }
         else
         {
            ResourceManager.name_15.load(_loc1_,this.method_969);
         }
      }
      
      private function method_851() : void
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         if(this.var_1615 == VideoElement.const_1684)
         {
            _loc1_ = class_88.getItem("video_window_header");
            _loc2_ = class_88.getItem("video_name_" + this.var_1822);
            if(_loc2_.length > 0 && _loc2_ != "{video_name_" + this.var_1822 + "}")
            {
               _loc1_ += " [" + _loc2_ + "]";
            }
         }
         else if(this.var_1615 == VideoElement.const_2648)
         {
            _loc1_ = class_88.getItem("title_helpvideo");
         }
         var_3405.text = _loc1_;
      }
      
      private function method_969(param1:class_39 = null) : void
      {
         if(this.valid)
         {
            this.show();
         }
      }
      
      private function show() : void
      {
         this.init();
         this.x = this.startX;
         this.y = this.startY;
         TweenLite.to(this,this.var_566,{
            "x":this.name_141,
            "y":this.name_18,
            "onComplete":this.method_5842
         });
      }
      
      public function hide() : void
      {
         this.valid = false;
         this.x = this.name_141;
         this.y = this.name_18;
         TweenLite.to(this,this.var_566,{
            "ease":Linear.easeNone,
            "x":this.startX,
            "y":this.startY,
            "onComplete":this.method_2067
         });
         if(Boolean(this.var_2249) && Boolean(this.var_2249.var_1881))
         {
            this.var_2249.var_1881.alpha = 1;
         }
         if(maximized)
         {
            this.var_2362 = class_82.playSoundEffect(class_126.const_2053);
         }
         TweenMax.delayedCall(0.25,this.method_526);
      }
      
      private function method_526() : void
      {
         if(this.var_2362 != null)
         {
            class_82.method_401(this.var_2362);
         }
      }
      
      private function method_2067() : void
      {
         this.simpleContainer.removeAllElements();
         this.var_2249.cleanup();
         this.cleanup();
         this.method_5185();
         class_50.removeObserver(this);
         _guiManager.method_1705(_featureWindowVO.id);
         _guiManager.method_6185().method_6154().sendCommand(class_74.const_2873,[class_74.VIDEO_WINDOW,class_74.const_2192,_featureWindowVO.id]);
      }
      
      private function method_3654() : void
      {
         this.var_1661 = true;
      }
      
      public function updateTimer(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(this.var_1661)
         {
            this.var_4029 += param1;
            if(this.var_4029 > 24)
            {
               if(this.name_59.method_2051())
               {
                  this.method_5185();
                  if(this._showButtons)
                  {
                     this.var_2348.visible = false;
                     this.method_1625();
                     this.var_5019.visible = true;
                  }
                  return;
               }
               _loc2_ = "";
               _loc3_ = this.name_59.method_2021(2);
               if((_loc4_ = _loc3_.charAt(_loc3_.length - 1)) == "<")
               {
                  _loc5_ = 0;
                  while(_loc4_ != ">")
                  {
                     if(_loc5_ > 20)
                     {
                        break;
                     }
                     _loc3_ = this.name_59.method_2021(1);
                     _loc4_ = _loc3_.charAt(_loc3_.length - 1);
                     _loc2_ = _loc2_ + _loc3_ + "\n";
                     _loc5_++;
                  }
               }
               _loc2_ = _loc2_ + _loc3_ + "\n";
               if(Number(this.var_2062) % Number(class_266.getRandomCount(1,6)) == 0)
               {
                  class_82.playSoundEffect(class_126.const_2347);
               }
               ++this.var_2062;
               this.var_3997.textArea.htmlText = _loc2_;
               this.var_3997.textArea.verticalScrollPosition = this.var_3997.textArea.maxVerticalScrollPosition;
               this.var_4029 = 0;
            }
         }
      }
      
      private function method_5842() : void
      {
         if(this.var_2249.var_1881)
         {
            this.var_2249.var_1881.alpha = 0.1;
         }
         this.var_2362 = class_82.playSoundEffect(class_126.const_2053);
         TweenMax.delayedCall(0.25,this.method_526);
         this.method_3648();
      }
      
      public function method_3648() : void
      {
         if(this.languageKeys.length == 0)
         {
            return;
         }
         var _loc1_:String = class_88.getItem(this.languageKeys[0]);
         _loc1_ = this.method_412(_loc1_);
         this.setText(_loc1_);
         this.languageKeys.shift();
         if(Boolean(this._showButtons) && this.var_2348 != null && this.var_5019 != null)
         {
            this.var_2348.visible = true;
            this.var_5019.visible = false;
         }
      }
      
      private function method_412(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc2_:Array = class_198.var_4406;
         for(_loc3_ in _loc2_)
         {
            param1 = param1.replace(new RegExp("<" + _loc3_ + ">","g"),"<font color=\'#" + _loc2_[_loc3_] + "\'>");
            param1 = param1.replace(new RegExp("</" + _loc3_ + ">","g"),"</font>");
         }
         return param1;
      }
      
      public function setText(param1:String) : void
      {
         this.var_2062 = 0;
         this.name_59 = new class_226(param1);
         this.method_3654();
      }
      
      protected function method_3214(param1:MouseEvent) : void
      {
         this.nextPage();
      }
      
      public function nextPage() : void
      {
         if(this.languageKeys.length != 0)
         {
            this.method_3648();
         }
         else
         {
            this.method_1893();
         }
      }
      
      protected function method_1893() : void
      {
         _guiManager.removeVideoWindow(_featureWindowVO.id + this.var_3247);
      }
      
      protected function method_3816(param1:MouseEvent) : void
      {
         this.method_5185();
         this.var_3997.textArea.htmlText = this.name_59.method_3393();
         this.var_3997.textArea.verticalScrollPosition = this.var_3997.textArea.maxVerticalScrollPosition;
         this.var_2348.visible = false;
         this.method_1625();
         this.var_5019.visible = true;
      }
      
      private function method_5185() : void
      {
         this.var_1661 = false;
      }
      
      public function set showButtons(param1:Boolean) : void
      {
         if(this._showButtons != param1)
         {
            this._showButtons = param1;
            this.method_2353();
         }
      }
      
      protected function method_2353() : void
      {
         var _loc1_:* = null;
         if(this._showButtons)
         {
            _loc1_ = class_39(ResourceManager.name_15.getFinisher("ui"));
            this.method_949(_loc1_);
            this.method_324(_loc1_);
            this.method_1625();
         }
         else
         {
            this.method_3961();
            this.method_2044();
         }
      }
      
      protected function method_2044() : void
      {
         this.simpleContainer.method_591(class_185.const_1146);
      }
      
      protected function method_3961() : void
      {
         this.simpleContainer.method_591(class_185.const_386);
      }
   }
}
