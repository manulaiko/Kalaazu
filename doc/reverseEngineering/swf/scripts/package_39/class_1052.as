package package_39
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.ColorTransform;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import net.bigpoint.darkorbit.class_18;
   import package_26.class_333;
   import package_76.class_1562;
   
   public class class_1052 extends Sprite
   {
       
      
      private var var_2402:Sprite;
      
      private var var_4751:Sprite;
      
      private var iconContainer:Sprite;
      
      private var var_548:int = 0;
      
      private var var_731:Number = 0;
      
      private var var_717:Number = 0;
      
      private var icon:Bitmap;
      
      private var var_4433:Sprite;
      
      private var textContainer:Sprite;
      
      private var var_561:TextField;
      
      public var var_1925:class_333;
      
      public var var_2859:String;
      
      private var var_3131:class_1561;
      
      public var var_1332:Boolean = false;
      
      private var var_289:Boolean = false;
      
      private var var_1821:int;
      
      private var var_3519:Number;
      
      private var var_842:int;
      
      private var var_1530:Number;
      
      private var var_3506:Timer;
      
      private var var_1666:Number;
      
      private var updateInterval:Number = 0.1;
      
      public var var_4659:Number;
      
      private var var_4011:Boolean = false;
      
      public function class_1052(param1:uint, param2:Bitmap = null, param3:class_1561 = null)
      {
         super();
         if(!param3)
         {
            this.var_3131 = new class_1561();
            this.var_3131.barColor = param1;
         }
         else
         {
            this.var_3131 = param3;
         }
         this.icon = param2;
         this.init();
      }
      
      private function init() : void
      {
         this.var_2402 = new Sprite();
         this.var_4751 = new Sprite();
         this.iconContainer = new Sprite();
         this.iconContainer.useHandCursor = true;
         this.iconContainer.buttonMode = true;
         this.textContainer = new Sprite();
         this.var_4433 = new Sprite();
         this.var_2402.addChild(this.var_4751);
         this.var_561 = new TextField();
         this.var_561.antiAliasType = AntiAliasType.ADVANCED;
         this.var_561.embedFonts = class_18.var_3911;
         this.var_561.mouseEnabled = false;
         this.var_561.autoSize = TextFieldAutoSize.LEFT;
         this.var_561.wordWrap = false;
         this.var_561.multiline = false;
         var _loc1_:TextFormat = new TextFormat(class_18.const_2442.font,10,16777215,false);
         this.var_561.defaultTextFormat = _loc1_;
         this.textContainer.addChild(this.var_561);
         this.var_4433.addEventListener(MouseEvent.CLICK,this.method_6038);
         this.var_4433.useHandCursor = true;
         this.var_4433.buttonMode = true;
         this.textContainer.visible = false;
         this.method_3148();
         this.addChild(this.textContainer);
         this.addChild(this.var_2402);
         this.addChild(this.iconContainer);
         this.addChild(this.var_4433);
         this.updateLayout();
         this.update(0,100);
      }
      
      private function method_3148() : void
      {
         if(this.icon)
         {
            this.iconContainer.addChild(this.icon);
         }
      }
      
      private function updateLayout() : void
      {
         var _loc1_:int = 0;
         if(this.icon != null)
         {
            _loc1_ = this.iconContainer.width + 5;
         }
         this.var_2402.x = _loc1_;
         this.var_2402.y = Number(this.iconContainer.height) * 0.5;
         this.method_2272(_loc1_);
         this.var_561.width = this.var_3131.var_3145;
         this.var_561.x = this.iconContainer.width + 2;
         this.var_561.y = -Number(this.var_561.height) * 0.5;
      }
      
      public function method_177() : void
      {
         this.setChildIndex(this.textContainer,this.numChildren - 1);
         this.textContainer.visible = true;
         this.var_4011 = true;
      }
      
      public function method_3166() : void
      {
         this.var_4433.removeEventListener(MouseEvent.CLICK,this.method_6038);
         this.var_4433.useHandCursor = false;
         this.var_4433.buttonMode = false;
         this.iconContainer.buttonMode = false;
         this.var_4433.buttonMode = false;
      }
      
      private function method_945() : void
      {
         var _loc1_:Boolean = Boolean(this.var_2402.visible);
         this.var_2402.visible = !_loc1_;
         this.textContainer.visible = _loc1_;
         this.var_2402.alpha = 0;
         this.textContainer.alpha = 0;
         TweenLite.to(this.var_2402,0.5,{"alpha":int(this.var_2402.visible)});
         TweenLite.to(this.textContainer,0.5,{"alpha":int(this.textContainer.visible)});
      }
      
      private function method_6038(param1:MouseEvent) : void
      {
         this.method_945();
      }
      
      private function method_3659(param1:int) : void
      {
         this.var_2402.graphics.clear();
         this.var_4751.graphics.clear();
         if(this.var_3131.var_4104)
         {
            this.var_2402.graphics.beginFill(this.var_3131.backgroundColor,1);
            this.var_2402.graphics.drawRect(0,0,this.var_3131.var_3145,this.var_3131.var_1175);
            this.var_2402.graphics.endFill();
         }
         else
         {
            this.var_2402.graphics.lineStyle(1,this.var_3131.backgroundColor);
            this.var_2402.graphics.moveTo(0,0);
            this.var_2402.graphics.lineTo(this.var_3131.var_3145,0);
            this.var_2402.graphics.lineTo(this.var_3131.var_3145,this.var_3131.var_1175);
            this.var_2402.graphics.lineTo(0,this.var_3131.var_1175);
            this.var_2402.graphics.lineTo(0,0);
         }
         if(this.var_3131.var_4104)
         {
            this.var_4751.graphics.beginFill(this.var_3131.barColor,1);
            this.var_4751.graphics.drawRect(0,0,1,Number(this.var_3131.var_1175) - Number(this.var_3131.gap) * 2);
            this.var_4751.graphics.endFill();
            this.var_4751.x = this.var_4751.y = this.var_3131.gap;
         }
         else
         {
            this.var_4751.graphics.beginFill(this.var_3131.barColor,1);
            this.var_4751.graphics.drawRect(0,0,1,this.var_3131.var_1175 - 1 - Number(this.var_3131.gap));
            this.var_4751.graphics.endFill();
            this.var_4751.x = this.var_4751.y = this.var_3131.gap;
         }
         this.method_2272(this.var_2402.x);
         switch(this.var_3131.var_882)
         {
            case class_1561.TEXTLAYOUT_VALUE_OF_TOTLA:
               this.var_561.text = class_122.method_98(this.var_731) + "/" + class_122.method_98(this.var_717);
               break;
            case class_1561.TEXTLAYOUT_VALUE_ONLY:
            default:
               this.var_561.text = class_122.method_98(this.var_731);
         }
         TweenLite.to(this.var_4751,0.5,{"width":param1});
      }
      
      private function method_2272(param1:int) : void
      {
         this.var_4433.graphics.clear();
         this.var_4433.graphics.beginFill(0,0);
         this.var_4433.graphics.drawRect(param1,0,this.var_3131.var_3145,Number(this.var_3131.var_1175) * 4);
         this.var_4433.graphics.endFill();
      }
      
      public function method_3662(param1:Number) : void
      {
         this.var_561.text = "x " + param1;
         if(this.var_4011)
         {
            this.var_561.x = this.var_4751.x + Number(this.var_3131.var_3145) / 2 - Number(this.var_561.width) / 2;
            this.var_561.y = Number(this.var_4751.y) - 2;
         }
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         if(param1 > param2)
         {
            param1 = param2;
         }
         this.var_731 = param1;
         this.var_717 = param2;
         this.var_548 = (Number(this.var_3131.var_3145) - 2 * Number(this.var_3131.gap)) * param1 / param2;
         this.method_3659(this.var_548);
         if(this.var_1925 != null)
         {
            if(param2 == 0)
            {
               this.var_1925.method_1455(this.var_2859);
            }
            else
            {
               this.var_1925.method_1455(this.var_2859 + "\n" + class_122.method_98(param1) + "|" + class_122.method_98(param2));
            }
         }
         if(this.var_1332)
         {
            this.method_5896();
         }
      }
      
      public function method_5417(param1:int = -1, param2:Number = 0.2) : void
      {
         this.var_289 = true;
         this.var_842 = 0;
         this.var_1821 = param1;
         this.var_3519 = param2;
         this.method_717();
      }
      
      private function method_717() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null;
         if(this.var_289)
         {
            if(this.var_1821 != -1)
            {
               ++this.var_842;
            }
            _loc1_ = 3;
            _loc2_ = {};
            if(this.var_3131.var_431 == class_1561.const_1655)
            {
               _loc1_ = 1.5;
               _loc2_ = this.var_2402;
            }
            TweenMax.to(_loc2_,this.var_3519,{
               "colorMatrixFilter":{"brightness":_loc1_},
               "ease":Linear.easeNone,
               "onComplete":this.method_5544
            });
         }
      }
      
      private function method_5544() : void
      {
         var _loc1_:* = {};
         if(this.var_3131.var_431 == class_1561.const_1655)
         {
            _loc1_ = this.var_2402;
         }
         if(this.var_289)
         {
            if(this.var_1821 == -1 || this.var_842 < this.var_1821)
            {
               TweenMax.to(_loc1_,this.var_3519 + 0.2,{
                  "colorMatrixFilter":{"brightness":1},
                  "ease":Linear.easeNone,
                  "onComplete":this.method_717
               });
            }
            else
            {
               TweenMax.to(_loc1_,this.var_3519 + 0.2,{
                  "colorMatrixFilter":{"brightness":1},
                  "ease":Linear.easeNone
               });
               this.var_289 = false;
            }
         }
         else
         {
            TweenMax.to(this,this.var_3519 + 0.2,{
               "colorMatrixFilter":{"brightness":1},
               "ease":Linear.easeNone
            });
         }
      }
      
      public function method_4394(param1:int) : void
      {
         this.var_1530 = param1;
         if(this.var_3506 != null)
         {
            this.method_1026();
         }
         var _loc2_:int = Math.round(10 * Number(this.var_1530));
         this.var_3506 = new Timer(100,_loc2_);
         this.var_3506.addEventListener(TimerEvent.TIMER,this.method_2827);
         this.var_3506.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_1127);
         this.var_3506.start();
         this.var_1666 = 1;
      }
      
      private function method_1127(param1:TimerEvent) : void
      {
         this.method_1026();
      }
      
      private function method_2827(param1:TimerEvent) : void
      {
         this.var_1666 += this.updateInterval;
         var _loc2_:Number = Number(this.var_1530) - Number(this.var_1666);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ == 0 && this.var_3506 != null)
         {
            this.method_1026();
         }
         if(_loc2_ <= this.var_4659 && _loc2_ > 0 && this.var_289 == false)
         {
            this.method_5417();
         }
         this.method_3271(_loc2_);
      }
      
      private function method_3271(param1:Number) : void
      {
         this.update(param1,this.var_717);
      }
      
      private function method_1026() : void
      {
         this.var_289 = false;
         this.var_3506.stop();
         this.var_3506.removeEventListener(TimerEvent.TIMER,this.method_2827);
         this.var_3506.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_1127);
         this.var_3506 = null;
      }
      
      private function method_5896() : void
      {
         var _loc1_:Number = Number(this.var_731) / Number(this.var_717);
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.color = class_1562.interpolate(this.var_3131.barColor,this.var_3131.borderColor,_loc1_);
         this.var_4751.transform.colorTransform = _loc2_;
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this.var_3131.var_3145 = param1;
         this.var_3131.var_1175 = param2;
         this.method_3659(this.var_548);
      }
      
      public function setColor(param1:uint) : void
      {
         this.var_3131.barColor = param1;
         this.method_3659(this.var_548);
      }
      
      public function method_6527(param1:uint) : void
      {
         this.var_3131.borderColor = param1;
         this.var_1332 = true;
      }
      
      public function set method_2838(param1:uint) : void
      {
         this.var_3131.borderColor = param1;
      }
      
      public function method_467(param1:Bitmap) : void
      {
         if(Boolean(this.icon) && Boolean(this.icon.parent))
         {
            this.icon.parent.removeChild(this.icon);
         }
         this.icon = param1;
         this.method_3148();
         this.updateLayout();
      }
   }
}
