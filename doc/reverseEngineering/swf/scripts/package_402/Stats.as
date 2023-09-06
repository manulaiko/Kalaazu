package package_402
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   
   public class Stats extends Sprite
   {
       
      
      protected const WIDTH:uint = 70;
      
      protected const HEIGHT:uint = 100;
      
      protected var xml:XML;
      
      protected var text:TextField;
      
      protected var style:StyleSheet;
      
      protected var timer:uint;
      
      protected var fps:uint;
      
      protected var ms:uint;
      
      protected var var_4454:uint;
      
      protected var mem:Number;
      
      protected var var_1196:Number;
      
      protected var var_3887:BitmapData;
      
      protected var var_3714:Rectangle;
      
      protected var var_730:uint;
      
      protected var var_3675:uint;
      
      protected var var_4858:uint;
      
      protected var colors:Colors;
      
      public function Stats()
      {
         this.colors = new Colors();
         super();
         this.var_1196 = 0;
         this.xml = <xml><fps>FPS:</fps><ms>MS:</ms><mem>MEM:</mem><memMax>MAX:</memMax></xml>;
         this.style = new StyleSheet();
         this.style.setStyle("xml",{
            "fontSize":"9px",
            "fontFamily":"_sans",
            "leading":"-2px"
         });
         this.style.setStyle("fps",{"color":this.method_4172(this.colors.fps)});
         this.style.setStyle("ms",{"color":this.method_4172(this.colors.ms)});
         this.style.setStyle("mem",{"color":this.method_4172(this.colors.mem)});
         this.style.setStyle("memMax",{"color":this.method_4172(this.colors.memmax)});
         this.text = new TextField();
         this.text.width = 70;
         this.text.height = 50;
         this.text.styleSheet = this.style;
         this.text.condenseWhite = true;
         this.text.selectable = false;
         this.text.mouseEnabled = false;
         this.var_3714 = new Rectangle(69,0,1,50);
         addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.destroy,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         graphics.beginFill(this.colors.bg);
         graphics.drawRect(0,0,70,100);
         graphics.endFill();
         addChild(this.text);
         this.var_3887 = new BitmapData(70,50,false,this.colors.bg);
         graphics.beginBitmapFill(this.var_3887,new Matrix(1,0,0,1,0,50));
         graphics.drawRect(0,50,70,50);
         addEventListener(MouseEvent.CLICK,this.method_5532);
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function destroy(param1:Event) : void
      {
         graphics.clear();
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         this.var_3887.dispose();
         removeEventListener(MouseEvent.CLICK,this.method_5532);
         removeEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function update(param1:Event) : void
      {
      }
      
      private function method_5532(param1:MouseEvent) : void
      {
         if(Number(mouseY) / Number(height) > 0.5)
         {
            --stage.frameRate;
         }
         else
         {
            ++stage.frameRate;
         }
         this.xml.fps = "FPS: " + this.fps + " / " + stage.frameRate;
         this.text.htmlText = this.xml;
      }
      
      private function method_4172(param1:int) : String
      {
         return "#" + param1.toString(16);
      }
   }
}

class Colors
{
    
   
   public var bg:uint = 51;
   
   public var fps:uint = 16776960;
   
   public var ms:uint = 65280;
   
   public var mem:uint = 65535;
   
   public var memmax:uint = 16711792;
   
   function Colors()
   {
      super();
   }
}
