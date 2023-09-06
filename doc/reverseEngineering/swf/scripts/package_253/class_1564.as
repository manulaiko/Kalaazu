package package_253
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_9.ResourceManager;
   
   public class class_1564 extends Sprite
   {
       
      
      private var var_4153:MovieClip;
      
      private var var_2095:int = 1;
      
      private var var_466:int = 2;
      
      private var var_4432:int = 3;
      
      private var var_2756:int = 4;
      
      private var _active:Boolean = true;
      
      public function class_1564()
      {
         super();
      }
      
      public function method_2464(param1:String) : void
      {
         this.var_4153 = ResourceManager.getMovieClip("window",param1);
         this.addChild(this.var_4153);
         this.var_4153.gotoAndStop(this.var_2095);
         this.addListeners();
      }
      
      private function addListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_3991);
         addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonRollover);
         addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonRollout);
         addEventListener(MouseEvent.MOUSE_UP,this.handleButtonUp);
      }
      
      private function method_25() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_3991);
         removeEventListener(MouseEvent.MOUSE_OVER,this.handleButtonRollover);
         removeEventListener(MouseEvent.MOUSE_OUT,this.handleButtonRollout);
         removeEventListener(MouseEvent.MOUSE_UP,this.handleButtonUp);
      }
      
      private function handleButtonRollout(param1:MouseEvent) : void
      {
         this.var_4153.gotoAndStop(this.var_2095);
      }
      
      private function handleButtonRollover(param1:MouseEvent) : void
      {
         this.var_4153.gotoAndStop(this.var_466);
      }
      
      private function method_3991(param1:MouseEvent) : void
      {
         this.var_4153.gotoAndStop(this.var_4432);
      }
      
      private function handleButtonUp(param1:MouseEvent) : void
      {
         this.var_4153.gotoAndStop(this.var_466);
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
         if(param1)
         {
            this.addListeners();
            this.var_4153.gotoAndStop(this.var_2095);
            this.buttonMode = true;
         }
         else
         {
            this.method_25();
            this.var_4153.gotoAndStop(this.var_2756);
            this.buttonMode = false;
         }
      }
   }
}
