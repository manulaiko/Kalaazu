package mx.accessibility
{
   import flash.accessibility.Accessibility;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import mx.controls.sliderClasses.Slider;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.SliderEvent;
   
   public class SliderAccImpl extends AccImpl
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function SliderAccImpl(param1:UIComponent)
      {
         super(param1);
         role = AccConst.ROLE_SYSTEM_SLIDER;
         param1.addEventListener(FocusEvent.FOCUS_IN,this.focusInHandler);
      }
      
      public static function enableAccessibility() : void
      {
         Slider.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
      }
      
      mx_internal static function createAccessibilityImplementation(param1:UIComponent) : void
      {
         param1.accessibilityImplementation = new SliderAccImpl(param1);
      }
      
      override protected function get eventsToHandle() : Array
      {
         return super.eventsToHandle.concat(["change"]);
      }
      
      override public function get_accRole(param1:uint) : uint
      {
         return role;
      }
      
      override public function get_accValue(param1:uint) : String
      {
         var _loc2_:Number = Number(Slider(master).values[Math.max(param1 - 1,0)]);
         _loc2_ = (_loc2_ - Number(Slider(master).minimum)) / (Number(Slider(master).maximum) - Number(Slider(master).minimum)) * 100;
         return String(_loc2_) + " percent";
      }
      
      override public function getChildIDArray() : Array
      {
         var _loc1_:int = int(Slider(master).thumbCount);
         return createChildIDArray(_loc1_);
      }
      
      override protected function getName(param1:uint) : String
      {
         return "";
      }
      
      override public function get_accState(param1:uint) : uint
      {
         var _loc2_:uint = this.getState(param1);
         _loc2_ |= 0;
         if(param1 == 0)
         {
            _loc2_ |= 0;
         }
         else
         {
            _loc2_ |= 0 | 0;
         }
         return _loc2_;
      }
      
      override protected function getState(param1:uint) : uint
      {
         var _loc3_:Number = 0;
         var _loc2_:* = 0;
         if(!UIComponent(master).enabled)
         {
            _loc2_ |= 0;
         }
         else
         {
            _loc2_ |= 0;
            _loc3_ = 0;
            while(_loc3_ < Slider(master).thumbCount)
            {
               if(Slider(master).getThumbAt(_loc3_) == Slider(master).focusManager.getFocus())
               {
                  _loc2_ |= 0;
                  break;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      override protected function eventHandler(param1:Event) : void
      {
         var _loc2_:* = 0;
         $eventHandler(param1);
         switch(param1.type)
         {
            case "change":
               _loc2_ = SliderEvent(param1).thumbIndex + 1;
               Accessibility.sendEvent(master,0,AccConst.EVENT_OBJECT_SELECTION);
               Accessibility.sendEvent(master,0,AccConst.EVENT_OBJECT_VALUECHANGE,true);
         }
      }
      
      private function focusInHandler(param1:Event) : void
      {
         Accessibility.sendEvent(master,0,AccConst.EVENT_OBJECT_FOCUS);
      }
   }
}
