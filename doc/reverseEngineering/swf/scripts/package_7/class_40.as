package package_7
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.primitives.Rect;
   
   public class class_40 extends Rect
   {
       
      
      private var _88844982outerDocument:class_8;
      
      public function class_40()
      {
         super();
         this.fill = this.method_5389();
      }
      
      private function method_5389() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : class_8
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:class_8) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
