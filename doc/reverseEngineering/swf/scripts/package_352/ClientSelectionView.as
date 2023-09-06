package package_352
{
   import com.greensock.layout.AlignMode;
   import com.greensock.layout.AutoFitArea;
   import com.greensock.layout.ScaleMode;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class ClientSelectionView extends Sprite
   {
      
      public static var var_2064:String = "3D";
      
      public static var var_23:String = "2D";
      
      public static var var_2184:String = "FAQ";
       
      
      private var var_1215:AutoFitArea;
      
      private var _bg:Bitmap;
      
      private var var_321:Center;
      
      public function ClientSelectionView()
      {
         this.var_321 = new Center();
         super();
         this._bg = ResourceManager.getBitmap("clientSelection","bg");
         addChild(this._bg);
         var _loc1_:DisplayObject = ResourceManager.getBitmap("clientSelection","bot_left");
         var _loc2_:DisplayObject = ResourceManager.getBitmap("clientSelection","bot_right");
         var _loc3_:DisplayObject = ResourceManager.getBitmap("clientSelection","up_left");
         var _loc4_:DisplayObject = ResourceManager.getBitmap("clientSelection","up_right");
         if(false)
         {
            this.var_321.button3d.addEventListener(MouseEvent.CLICK,this.method_3498);
            this.var_321.button2d.addEventListener(MouseEvent.CLICK,this.method_5233);
         }
         else
         {
            this.var_321.button3d.addEventListener(MouseEvent.CLICK,this.method_5233);
            this.var_321.button2d.addEventListener(MouseEvent.CLICK,this.method_268);
         }
         this.var_1215 = new AutoFitArea(this);
         this.var_1215.attach(addChild(_loc1_),ScaleMode.NONE,AlignMode.LEFT,AlignMode.BOTTOM);
         this.var_1215.attach(addChild(_loc2_),ScaleMode.NONE,AlignMode.RIGHT,AlignMode.BOTTOM);
         this.var_1215.attach(addChild(_loc3_),ScaleMode.NONE,AlignMode.LEFT,AlignMode.TOP);
         this.var_1215.attach(addChild(_loc4_),ScaleMode.NONE,AlignMode.RIGHT,AlignMode.TOP);
         this.var_1215.attach(addChild(this.var_321),ScaleMode.NONE,AlignMode.CENTER,AlignMode.CENTER);
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
      }
      
      private function addedToStage(param1:Event) : void
      {
         this.updateSize();
         stage.addEventListener(Event.RESIZE,this.updateSize);
      }
      
      private function method_3498(param1:MouseEvent) : void
      {
         if(false)
         {
            dispatchEvent(new Event(var_2064));
         }
         else
         {
            dispatchEvent(new Event(var_23));
         }
         dispatchEvent(new Event(var_2064));
         class_215.removeDisplayObject(this);
      }
      
      private function method_5233(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(var_23));
         class_215.removeDisplayObject(this);
      }
      
      private function method_268(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(var_2184));
      }
      
      private function updateSize(param1:* = null) : void
      {
         setTimeout(this.resize,1);
      }
      
      private function resize() : void
      {
         if(stage)
         {
            this._bg.width = stage.stageWidth;
            this._bg.height = stage.stageHeight;
            this.var_1215.height = stage.stageHeight;
            this.var_1215.width = stage.stageWidth;
            this.var_1215.update();
         }
      }
   }
}

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import net.bigpoint.darkorbit.class_18;
import package_9.ResourceManager;

class SelectionButton extends Sprite
{
   
   private static const STATE_NORMAL:Rectangle = new Rectangle(0,0,278,90);
   
   private static const STATE_HOVER:Rectangle = new Rectangle(0,90,278,90);
   
   private static const STATE_DOWN:Rectangle = new Rectangle(0,180,278,90);
    
   
   private var _text:TextField;
   
   private var _img:Bitmap;
   
   function SelectionButton(param1:String = "")
   {
      super();
      this._img = ResourceManager.getBitmap("clientSelection","button");
      addChild(this._img);
      this._img.scrollRect = STATE_NORMAL;
      this._text = new TextField();
      this._text.width = width;
      this._text.height = height;
      this._text.autoSize = TextFieldAutoSize.CENTER;
      this._text.defaultTextFormat = class_18.const_2457;
      this._text.embedFonts = class_18.var_3911;
      this._text.text = param1;
      this._text.mouseEnabled = false;
      this._text.y = 20;
      addChild(this._text);
      addEventListener(MouseEvent.MOUSE_OVER,this.over);
      addEventListener(MouseEvent.MOUSE_OUT,this.out);
      addEventListener(MouseEvent.MOUSE_DOWN,this.down);
   }
   
   private function down(param1:MouseEvent) : void
   {
      this._img.scrollRect = STATE_DOWN;
   }
   
   private function out(param1:MouseEvent) : void
   {
      this._img.scrollRect = STATE_NORMAL;
   }
   
   private function over(param1:MouseEvent) : void
   {
      this._img.scrollRect = STATE_HOVER;
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.fui.components.custom.ResultLabel;
import net.bigpoint.darkorbit.settings.Settings;
import package_76.class_1495;
import package_9.ResourceManager;

class Center extends Sprite
{
    
   
   private const FILTERS:Array = [new GlowFilter(15436324,0.9,15,15,1,3)];
   
   private var _2dViewButton:TextField;
   
   private var _3dViewButton:SelectionButton;
   
   function Center()
   {
      var method_1666:ResultLabel;
      var var_499:BitmapData;
      var infoText:TextField;
      var errorIcon:Bitmap = null;
      super();
      addChild(ResourceManager.getBitmap("clientSelection","center"));
      method_1666 = new ResultLabel();
      method_1666.width = 1600;
      method_1666.height = 100;
      method_1666.y = 600;
      var_499 = ResourceManager.getBitmapData("clientSelection","gradient");
      var_499 = class_1495.scaleBitmapData(var_499,1,100 / var_499.height);
      method_1666.gradient = var_499;
      method_1666.textFormat = class_18.const_3017;
      method_1666.embededFonts = true;
      method_1666.filters = this.FILTERS;
      method_1666.text = class_88.getItem("client_selection_headline").toUpperCase();
      method_1666.x = Number(width) * 0.5 - method_1666.width * 0.5;
      if(false)
      {
         errorIcon = ResourceManager.getBitmap("clientSelection","error_icon");
         errorIcon.x = Number(width) / 2 - errorIcon.width * 0.5;
         errorIcon.y = method_1666.y + 70;
         addChild(errorIcon);
      }
      infoText = new TextField();
      infoText.embedFonts = class_18.var_3911;
      infoText.defaultTextFormat = class_18.clientSelection;
      infoText.autoSize = TextFieldAutoSize.CENTER;
      infoText.wordWrap = true;
      infoText.multiline = true;
      infoText.y = Settings.has3DCapabilities ? method_1666.y + 116 : errorIcon.y + errorIcon.height;
      infoText.width = Number(this.width) - 500;
      infoText.htmlText = Settings.has3DCapabilities ? class_88.getItem("client_selection_info") : class_88.getItem("client_selection_info_no_3d");
      infoText.x = Number(width) * 0.5 - infoText.width * 0.5;
      addChild(infoText);
      this._3dViewButton = new SelectionButton(Settings.has3DCapabilities ? class_88.getItem("client_selection_3d") : class_88.getItem("client_selection_continue_2d"));
      this._3dViewButton.buttonMode = true;
      this._3dViewButton.x = Number(width) / 2 - Number(this._3dViewButton.width) / 2;
      this._3dViewButton.y = infoText.y + infoText.height + 20;
      addChild(this._3dViewButton);
      this._2dViewButton = new TextField();
      this._2dViewButton.embedFonts = class_18.var_3911;
      this._2dViewButton.selectable = false;
      this._2dViewButton.width = this._3dViewButton.width;
      this._2dViewButton.autoSize = TextFieldAutoSize.CENTER;
      this._2dViewButton.wordWrap = true;
      this._2dViewButton.multiline = true;
      this._2dViewButton.defaultTextFormat = class_18.const_1992;
      this._2dViewButton.htmlText = "<a href=\'event:null\'>" + (Settings.has3DCapabilities ? class_88.getItem("client_selection_2d") : class_88.getItem("client_selection_faq")) + "</a>";
      this._2dViewButton.y = this._3dViewButton.y + 85;
      this._2dViewButton.x = Number(width) / 2 - Number(this._2dViewButton.width) / 2;
      addChild(this._2dViewButton);
      addChild(method_1666);
      this._2dViewButton.addEventListener(MouseEvent.MOUSE_OVER,function(param1:MouseEvent):void
      {
         _2dViewButton.textColor = 255;
      });
      this._2dViewButton.addEventListener(MouseEvent.MOUSE_OUT,function(param1:MouseEvent):void
      {
         _2dViewButton.textColor = uint(class_18.const_1992.color);
      });
   }
   
   public function get button2d() : TextField
   {
      return this._2dViewButton;
   }
   
   public function get button3d() : SelectionButton
   {
      return this._3dViewButton;
   }
}
