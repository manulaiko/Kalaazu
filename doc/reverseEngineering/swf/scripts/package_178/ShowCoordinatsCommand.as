package package_178
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class ShowCoordinatsCommand extends class_243
   {
       
      
      public function ShowCoordinatsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:CoordinatsView = CoordinatsView.getInstance(name_47.stage);
         if(false)
         {
            name_47.stage.addChild(_loc2_);
         }
      }
   }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Timer;

class CoordinatsView extends Sprite
{
   
   private static var _instance:CoordinatsView;
    
   
   private var _timer:Timer;
   
   private var _textField:TextField;
   
   private var _mouseLayer:DisplayObject;
   
   function CoordinatsView(param1:DisplayObject)
   {
      super();
      this._mouseLayer = param1;
      this._timer = new Timer(100);
      this._timer.addEventListener(TimerEvent.TIMER,this.listener);
      this._textField = new TextField();
      this._textField.backgroundColor = 16777215;
      this._textField.textColor = 0;
      this._textField.background = true;
      this._textField.autoSize = TextFieldAutoSize.CENTER;
      addEventListener(Event.REMOVED,this.removeListener);
      addEventListener(Event.REMOVED_FROM_STAGE,this.removeListener);
      this._timer.start();
      addChild(this._textField);
   }
   
   public static function getInstance(param1:DisplayObject) : CoordinatsView
   {
      if(!_instance)
      {
         _instance = new CoordinatsView(param1);
      }
      return _instance;
   }
   
   private function removeListener(param1:Event) : void
   {
      this._timer.stop();
   }
   
   private function listener(param1:TimerEvent) : void
   {
      this._textField.text = this._mouseLayer.mouseX + "/" + this._mouseLayer.mouseY;
   }
}
