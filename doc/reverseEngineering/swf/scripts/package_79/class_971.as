package package_79
{
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import package_11.class_39;
   import package_241.class_1496;
   import package_30.class_218;
   import package_70.SimpleWindowEvent;
   
   public class class_971 extends Sprite
   {
      
      private static const const_2632:int = 8;
      
      public static const const_53:int = 140;
       
      
      private var _hPanel:class_1496;
      
      private var var_3289:class_39;
      
      private var var_2433:Dictionary;
      
      private var var_218:Sprite;
      
      private var var_1686:TextField;
      
      private var var_5038:TextField;
      
      private var var_3571:Sprite;
      
      public function class_971(param1:class_39, param2:Sprite)
      {
         super();
         this.var_3289 = param1;
         this.var_218 = param2;
         addChild(this._hPanel = new class_1496());
         addChild(this.var_3571 = new Sprite());
         this.method_5768();
         alpha = 0;
         visible = false;
      }
      
      private function method_5768() : void
      {
         addChild(this.var_1686 = new TextField());
         addChild(this.var_5038 = new TextField());
      }
      
      public function show(param1:String, param2:String, param3:Vector.<class_234>, param4:int, param5:int) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         this.setText(this.var_1686,class_88.getItem(param1),class_18.const_180,param4 - 2 * Number(const_2632),class_18.const_1111);
         this.setText(this.var_5038,class_88.getItem(param2),class_18.const_2667,param4 - 2 * Number(const_2632),class_18.const_662);
         this.var_2433 = new Dictionary();
         this._hPanel.method_3928();
         for each(_loc6_ in param3)
         {
            _loc7_ = new class_218(_loc6_.method_3494,class_88.getItem(_loc6_.method_6308),this.var_3289.getEmbeddedMovieClip("button1"));
            this.var_2433[_loc7_] = _loc6_;
            this._hPanel.addItem(_loc7_,10,10);
            _loc7_.addEventListener(MouseEvent.CLICK,this.method_967);
         }
         this.updateLayout(param4,param5);
         this.method_1700(true);
         this.method_1914 = true;
      }
      
      private function method_967(param1:MouseEvent) : void
      {
         var _loc2_:class_234 = this.var_2433[param1.currentTarget];
         this.hide(false,_loc2_.method_1638);
         if(_loc2_.clickCallback != null)
         {
            _loc2_.clickCallback(_loc2_.method_5038);
         }
      }
      
      public function hide(param1:Boolean = true, param2:int = 0) : void
      {
         this.method_1700(false);
         if(param1)
         {
            this.method_1914 = false;
         }
         else
         {
            alpha = 0;
            visible = false;
         }
         setTimeout(dispatchEvent,param2,new SimpleWindowEvent(SimpleWindowEvent.HIDE_POPUP,false,true));
      }
      
      private function updateLayout(param1:int, param2:int) : void
      {
         this._hPanel.method_5870(param1);
         var _loc3_:* = param2 - (this.var_1686.height + this.var_5038.height + this._hPanel.height + 15) >> 1;
         this.var_1686.y = _loc3_ - 5;
         this.var_1686.x = const_2632 + param1 - Number(this.var_1686.width) >> 1;
         this.method_6421(this.var_1686.y + this.var_1686.height + 1,param1);
         this.var_5038.y = this.var_3571.y + 7;
         this.var_5038.x = const_2632 + param1 - Number(this.var_5038.width) >> 1;
         this._hPanel.y = this.var_5038.y + this.var_5038.height + 20;
      }
      
      private function method_1700(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            TweenLite.to(this.var_218,0.3,{"colorTransform":{
               "tint":0,
               "tintAmount":(param2 ? 0.8 : 0)
            }});
         }
         var _loc3_:* = !param1;
         this.var_218.mouseEnabled = !param1;
         this.var_218.mouseChildren = _loc3_;
      }
      
      private function method_6421(param1:int, param2:int) : void
      {
         while(this.var_3571.numChildren)
         {
            this.var_3571.removeChildAt(0);
         }
         this.var_3571.y = param1;
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.lineStyle(1,8289918);
         _loc3_.graphics.moveTo(8,0);
         _loc3_.graphics.lineTo(param2 - 20,0);
         this.var_3571.addChild(_loc3_);
      }
      
      private function setText(param1:TextField, param2:String, param3:TextFormat, param4:int, param5:int) : TextField
      {
         param3.align = TextFormatAlign.LEFT;
         param1.defaultTextFormat = param3;
         param1.width = param4;
         param1.embedFonts = class_18.var_1745;
         param1.height = param5;
         param1.textColor = 15262143;
         param1.multiline = true;
         param1.wordWrap = true;
         param1.mouseEnabled = false;
         param1.antiAliasType = AntiAliasType.ADVANCED;
         param1.autoSize = TextFieldAutoSize.LEFT;
         param1.htmlText = param2;
         return param1;
      }
      
      private function set method_1914(param1:Boolean) : void
      {
         TweenLite.to(this,0.3,{"autoAlpha":int(param1)});
      }
   }
}
