package spark.primitives
{
   import mx.core.mx_internal;
   import spark.components.Group;
   import spark.components.ResizeMode;
   import spark.layouts.BasicLayout;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class Graphic extends Group
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var version:Number = 1;
      
      private var _viewHeight:Number;
      
      private var _viewWidth:Number;
      
      public function Graphic()
      {
         super();
         super.layout = new BasicLayout();
         resizeMode = ResizeMode.SCALE;
      }
      
      public function get viewHeight() : Number
      {
         return this._viewHeight;
      }
      
      public function set viewHeight(param1:Number) : void
      {
         if(param1 != this._viewHeight)
         {
            this._viewHeight = param1;
            invalidateSize();
         }
      }
      
      public function get viewWidth() : Number
      {
         return this._viewWidth;
      }
      
      public function set viewWidth(param1:Number) : void
      {
         if(param1 != this._viewWidth)
         {
            this._viewWidth = param1;
            invalidateSize();
         }
      }
      
      override public function set layout(param1:LayoutBase) : void
      {
         throw new Error(resourceManager.getString("components","layoutReadOnly"));
      }
      
      override protected function measure() : void
      {
         super.measure();
         if(!isNaN(this.viewWidth))
         {
            measuredMinWidth = measuredWidth = this.viewWidth;
         }
         if(!isNaN(this.viewHeight))
         {
            measuredMinHeight = measuredHeight = this.viewHeight;
         }
      }
   }
}
