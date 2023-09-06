package spark.components
{
   import flash.events.Event;
   import mx.core.mx_internal;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class HGroup extends Group
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function HGroup()
      {
         super();
         super.layout = new HorizontalLayout();
      }
      
      private function get horizontalLayout() : HorizontalLayout
      {
         return HorizontalLayout(layout);
      }
      
      public function get gap() : int
      {
         return this.horizontalLayout.gap;
      }
      
      public function set gap(param1:int) : void
      {
         this.horizontalLayout.gap = param1;
      }
      
      [Bindable("propertyChange")]
      public function get columnCount() : int
      {
         return this.horizontalLayout.columnCount;
      }
      
      public function get paddingLeft() : Number
      {
         return this.horizontalLayout.paddingLeft;
      }
      
      public function set paddingLeft(param1:Number) : void
      {
         this.horizontalLayout.paddingLeft = param1;
      }
      
      public function get paddingRight() : Number
      {
         return this.horizontalLayout.paddingRight;
      }
      
      public function set paddingRight(param1:Number) : void
      {
         this.horizontalLayout.paddingRight = param1;
      }
      
      public function get paddingTop() : Number
      {
         return this.horizontalLayout.paddingTop;
      }
      
      public function set paddingTop(param1:Number) : void
      {
         this.horizontalLayout.paddingTop = param1;
      }
      
      public function get paddingBottom() : Number
      {
         return this.horizontalLayout.paddingBottom;
      }
      
      public function set paddingBottom(param1:Number) : void
      {
         this.horizontalLayout.paddingBottom = param1;
      }
      
      public function get requestedMaxColumnCount() : int
      {
         return this.horizontalLayout.requestedMaxColumnCount;
      }
      
      public function set requestedMaxColumnCount(param1:int) : void
      {
         this.horizontalLayout.requestedMaxColumnCount = param1;
      }
      
      public function get requestedMinColumnCount() : int
      {
         return this.horizontalLayout.requestedMinColumnCount;
      }
      
      public function set requestedMinColumnCount(param1:int) : void
      {
         this.horizontalLayout.requestedMinColumnCount = param1;
      }
      
      public function get requestedColumnCount() : int
      {
         return this.horizontalLayout.requestedColumnCount;
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         this.horizontalLayout.requestedColumnCount = param1;
      }
      
      public function get columnWidth() : Number
      {
         return this.horizontalLayout.columnWidth;
      }
      
      public function set columnWidth(param1:Number) : void
      {
         this.horizontalLayout.columnWidth = param1;
      }
      
      public function get variableColumnWidth() : Boolean
      {
         return this.horizontalLayout.variableColumnWidth;
      }
      
      public function set variableColumnWidth(param1:Boolean) : void
      {
         this.horizontalLayout.variableColumnWidth = param1;
      }
      
      public function get horizontalAlign() : String
      {
         return this.horizontalLayout.horizontalAlign;
      }
      
      public function set horizontalAlign(param1:String) : void
      {
         this.horizontalLayout.horizontalAlign = param1;
      }
      
      public function get verticalAlign() : String
      {
         return this.horizontalLayout.verticalAlign;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         this.horizontalLayout.verticalAlign = param1;
      }
      
      [Bindable("indexInViewChanged")]
      public function get firstIndexInView() : int
      {
         return this.horizontalLayout.firstIndexInView;
      }
      
      [Bindable("indexInViewChanged")]
      public function get lastIndexInView() : int
      {
         return this.horizontalLayout.lastIndexInView;
      }
      
      override public function set layout(param1:LayoutBase) : void
      {
         throw new Error(resourceManager.getString("components","layoutReadOnly"));
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         switch(param1)
         {
            case "indexInViewChanged":
            case "propertyChange":
               if(!hasEventListener(param1))
               {
                  this.horizontalLayout.addEventListener(param1,this.redispatchHandler);
                  break;
               }
         }
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         switch(param1)
         {
            case "indexInViewChanged":
            case "propertyChange":
               if(!hasEventListener(param1))
               {
                  this.horizontalLayout.removeEventListener(param1,this.redispatchHandler);
                  break;
               }
         }
      }
      
      private function redispatchHandler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
   }
}
