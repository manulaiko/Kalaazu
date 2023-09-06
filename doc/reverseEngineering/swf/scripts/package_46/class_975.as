package package_46
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.xml.XMLBasedUIBuilder;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   
   public class class_975 extends Container implements class_974
   {
      
      private static const const_3058:String = "commonui.window.inProgressOverlay";
       
      
      private var var_841:IWindow;
      
      private var var_259:Sprite;
      
      private var var_3496:Coreponent;
      
      private var var_3006:class_73;
      
      private var var_3098:class_73;
      
      private var var_950:Sprite;
      
      private var var_4929:Coreponent;
      
      private var var_4942:class_73;
      
      private var var_1923:class_73;
      
      private var var_3825:Sprite;
      
      public function class_975(param1:IWindow)
      {
         super();
         this.var_841 = param1;
      }
      
      protected function create() : void
      {
         UISystem.getInstance().buildByTemplate(const_3058,this,XMLBasedUIBuilder.TYPE,true);
         this.var_259 = this.getChildByName("darkLayer") as Sprite;
         this.var_3496 = this.getChildByName("cogBigContainer") as Coreponent;
         this.var_3006 = new class_73(this.var_3496.x,this.var_3496.y);
         this.var_3098 = new class_73(Number(this.var_3496.x) - 30,this.var_3496.y);
         this.var_3496.x = this.var_3098.x;
         this.var_3496.y = this.var_3098.y;
         this.var_950 = this.var_3496.getChildByName("cogBig") as Sprite;
         this.var_4929 = this.getChildByName("cogSmallContainer") as Coreponent;
         this.var_4942 = new class_73(this.var_4929.x,this.var_4929.y);
         this.var_1923 = new class_73(this.var_4929.x + 30,this.var_4929.y);
         this.var_4929.x = this.var_1923.x;
         this.var_4929.y = this.var_1923.y;
         this.var_3825 = this.var_4929.getChildByName("cogSmall") as Sprite;
      }
      
      public function show() : void
      {
         if(this.numChildren == 0)
         {
            this.create();
         }
         this.method_6375();
      }
      
      public function hide() : void
      {
         this.method_5809();
      }
      
      private function method_6375() : void
      {
         var _loc1_:Sprite = this.var_841.getUIContainer();
         _loc1_.mouseChildren = false;
         _loc1_.filters = [new BlurFilter(2,2,BitmapFilterQuality.LOW)];
         this.var_3825.visible = true;
         this.var_950.visible = true;
         this.var_3825.removeEventListener(Event.ENTER_FRAME,this.method_2786);
         this.var_3825.addEventListener(Event.ENTER_FRAME,this.method_2786);
         TweenLite.to(this.var_259,0.2,{"alpha":1});
         TweenLite.to(this.var_4929,0.4,{
            "alpha":1,
            "x":this.var_4942.x,
            "y":this.var_4942.y
         });
         TweenLite.to(this.var_3496,0.4,{
            "alpha":1,
            "x":this.var_3006.x,
            "y":this.var_3006.y
         });
      }
      
      private function method_5809() : void
      {
         var _loc1_:Sprite = this.var_841.getUIContainer();
         _loc1_.mouseChildren = true;
         _loc1_.filters = [];
         TweenLite.to(this.var_259,0.2,{"alpha":0});
         TweenLite.to(this.var_4929,0.3,{
            "alpha":0,
            "x":this.var_1923.x,
            "y":this.var_1923.y,
            "onComplete":this.method_259
         });
         TweenLite.to(this.var_3496,0.3,{
            "alpha":0,
            "x":this.var_3098.x,
            "y":this.var_3098.y
         });
      }
      
      private function method_2786(param1:Event) : void
      {
         this.var_3825.rotation += -1;
         this.var_950.rotation += 1;
      }
      
      private function method_259() : void
      {
         this.var_3825.removeEventListener(Event.ENTER_FRAME,this.method_2786);
      }
   }
}
