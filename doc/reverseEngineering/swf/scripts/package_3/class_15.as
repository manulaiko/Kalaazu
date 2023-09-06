package package_3
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.primitives.Line;
   
   public class class_15 extends Line
   {
       
      
      private var _88844982outerDocument:class_2;
      
      public function class_15()
      {
         super();
         this.stroke = this.method_5784();
      }
      
      private function method_5784() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 936542;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : class_2
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:class_2) : void
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
