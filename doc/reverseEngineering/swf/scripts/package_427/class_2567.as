package package_427
{
   import flash.geom.Point;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.mvc.display.class_1708;
   
   public class class_2567 implements IDisposable
   {
       
      
      private var _textField:class_1708;
      
      private var _alpha:Number = 1;
      
      private var _position:Point;
      
      private var var_1315:uint;
      
      private var _text:String = "";
      
      public function class_2567(param1:class_1708)
      {
         super();
         this._textField = param1;
         this.var_1315 = setInterval(this.method_668,300);
         this._alpha = this._textField.alpha;
         this._position = new Point(this._textField.x,this._textField.y);
         this._textField.htmlText = this._text;
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         if(this._textField)
         {
            this._textField.htmlText = param1;
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         clearInterval(this.var_1315);
      }
      
      private function method_668() : void
      {
         if(this._textField)
         {
            this.method_465();
            setTimeout(this.method_465,30);
            setTimeout(this.method_465,50);
            setTimeout(this.method_465,70);
            setTimeout(this.method_465,90);
            setTimeout(this.method_465,120);
            setTimeout(this.method_465,130);
            setTimeout(this.method_4849,140);
         }
      }
      
      private function method_4849() : void
      {
         this._textField.alpha = this._alpha;
      }
      
      private function method_465() : void
      {
         this._textField.x = int(this._position.x + Math.random() * 3 - 1.5);
         this._textField.y = int(this._position.y + Math.random() * 3 - 1.5);
         this._textField.alpha = Math.random() * Number(this._alpha);
      }
   }
}
