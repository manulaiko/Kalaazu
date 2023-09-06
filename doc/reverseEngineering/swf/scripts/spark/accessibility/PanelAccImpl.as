package spark.accessibility
{
   import flash.accessibility.AccessibilityImplementation;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import mx.accessibility.AccConst;
   import mx.accessibility.AccImpl;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.ResizeEvent;
   import spark.components.Panel;
   import spark.events.SkinPartEvent;
   
   public class PanelAccImpl extends AccImpl
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      mx_internal var accImplSprite:Sprite;
      
      private var titleDisplayAccImpl:AccessibilityImplementation;
      
      public function PanelAccImpl(param1:UIComponent)
      {
         super(param1);
         role = AccConst.ROLE_SYSTEM_GROUPING;
      }
      
      public static function enableAccessibility() : void
      {
         Panel.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
      }
      
      mx_internal static function createAccessibilityImplementation(param1:UIComponent) : void
      {
         var _loc2_:PanelAccImpl = new PanelAccImpl(param1);
         _loc2_.mx_internal::attach();
      }
      
      override protected function get eventsToHandle() : Array
      {
         return super.eventsToHandle.concat([ResizeEvent.RESIZE,SkinPartEvent.PART_ADDED,SkinPartEvent.PART_REMOVED]);
      }
      
      override public function get_accState(param1:uint) : uint
      {
         return getState(param1);
      }
      
      override protected function getName(param1:uint) : String
      {
         return Panel(master).title;
      }
      
      mx_internal function attach() : Sprite
      {
         var _loc1_:Panel = Panel(master);
         this.mx_internal::accImplSprite = new Sprite();
         _loc1_.mx_internal::$addChildAt(this.mx_internal::accImplSprite,0);
         this.mx_internal::accImplSprite.accessibilityImplementation = this;
         if(_loc1_.titleDisplay)
         {
            this.titleDisplayAccImpl = InteractiveObject(_loc1_.titleDisplay).accessibilityImplementation;
            InteractiveObject(_loc1_.titleDisplay).accessibilityImplementation = null;
         }
         if(_loc1_.tabIndex > 0 && this.mx_internal::accImplSprite.tabIndex == -1)
         {
            this.mx_internal::accImplSprite.tabIndex = _loc1_.tabIndex;
         }
         return this.mx_internal::accImplSprite;
      }
      
      override protected function eventHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.eventHandler(param1);
         switch(param1.type)
         {
            case ResizeEvent.RESIZE:
               _loc3_ = Panel(master);
               (_loc4_ = this.mx_internal::accImplSprite.graphics).clear();
               _loc4_.lineStyle(0,0,0);
               _loc4_.drawRect(0,0,_loc3_.width,_loc3_.height);
               break;
            case SkinPartEvent.PART_ADDED:
               _loc2_ = Panel(master).titleDisplay as InteractiveObject;
               if(SkinPartEvent(param1).instance == _loc2_)
               {
                  this.titleDisplayAccImpl = _loc2_.accessibilityImplementation;
                  _loc2_.accessibilityImplementation = null;
                  break;
               }
               break;
            case SkinPartEvent.PART_REMOVED:
               _loc2_ = Panel(master).titleDisplay as InteractiveObject;
               if(SkinPartEvent(param1).instance == _loc2_)
               {
                  _loc2_.accessibilityImplementation = this.titleDisplayAccImpl;
                  this.titleDisplayAccImpl = null;
                  break;
               }
         }
      }
   }
}
