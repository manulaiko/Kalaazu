package package_141
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;
   import package_103.class_2009;
   import package_103.class_273;
   import package_142.class_970;
   import package_242.IDraggable;
   import package_242.class_1894;
   
   public class class_2008 extends class_969 implements IDraggable
   {
      
      public static const const_865:String = "barDragStart";
      
      public static const const_2915:String = "barDragStop";
      
      public static const const_1438:String = "barChangeLayout";
      
      public static const const_2211:int = 1;
      
      private static const const_690:String = "arrowList";
      
      private static const const_502:String = "rotateButton";
      
      private static const const_2893:String = "dragButton";
      
      protected static const const_1067:Point = new Point(13,21);
      
      protected static const const_1984:Point = new Point(13,12);
      
      public static const const_1254:String = "rightButtonsAligment";
      
      public static const const_2287:String = "leftButtonsAligment";
       
      
      public var var_4606:class_2009;
      
      public var rotateButton:class_970;
      
      public var dragButton:class_970;
      
      public function class_2008(param1:DisplayObjectContainer)
      {
         super(param1);
         method_4622(false,this.rotateButton,0);
         method_4622(false,this.dragButton,0);
         this.addListeners();
         this.mouseEnabled = false;
      }
      
      override public function decorate() : void
      {
         method_4210(this.var_4606 = new class_2009(method_4492(const_690)));
         method_4210(this.rotateButton = new class_970(method_4492(const_502)));
         method_4210(this.dragButton = new class_970(method_4492(const_2893)));
      }
      
      private function addListeners() : void
      {
         this.dragButton.addEventListener(MouseEvent.MOUSE_DOWN,this.method_5025);
         this.dragButton.addEventListener(MouseEvent.MOUSE_UP,this.method_5418);
         this.rotateButton.addEventListener(MouseEvent.CLICK,this.method_643);
      }
      
      private function method_643(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(const_1438,true));
      }
      
      private function method_5025(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(const_865,true));
      }
      
      private function method_5418(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(const_2915,true));
      }
      
      public function showItems(param1:Array, param2:int, param3:int = 50, param4:Boolean = false, param5:SlotBarVO = null, param6:class_273 = null) : void
      {
         this.var_4606.showItems(param1,param2,param3,param6,param4);
         updateLayout();
      }
      
      public function method_246() : void
      {
         this.dragButton.y = Number(this.var_4606.height) / 2;
      }
      
      public function updateOnListLayoutChange(param1:Point, param2:Boolean = true) : void
      {
      }
      
      public function get dragOffset() : Point
      {
         return null;
      }
      
      public function get preview() : class_1894
      {
         return null;
      }
      
      public function get data() : Object
      {
         return null;
      }
      
      public function get asDisplayObject() : DisplayObject
      {
         return null;
      }
      
      public function get method_335() : Rectangle
      {
         return new Rectangle(Number(x) - Number(this.leftOffset),Number(y) - Number(this.topOffset),this.boundsWidth,this.boundsHeight);
      }
      
      public function get boundsWidth() : int
      {
         return 0;
      }
      
      public function get method_2383() : int
      {
         return 0;
      }
      
      public function get boundsHeight() : int
      {
         return height;
      }
      
      public function get leftOffset() : int
      {
         return 0;
      }
      
      public function get topOffset() : int
      {
         return 0;
      }
      
      public function get rightOffset() : int
      {
         return 0;
      }
      
      public function get bottomOffset() : int
      {
         return 0;
      }
      
      public function get realWidth() : int
      {
         return 0;
      }
      
      public function get realHeight() : int
      {
         return height;
      }
      
      public function get method_1381() : String
      {
         if(this.var_4606)
         {
            return this.var_4606.layout.id;
         }
         return null;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         super.mouseEnabled = param1;
         this.var_4606.mouseEnabled = param1;
         this.var_4606.listContainer.mouseEnabled = param1;
      }
   }
}
