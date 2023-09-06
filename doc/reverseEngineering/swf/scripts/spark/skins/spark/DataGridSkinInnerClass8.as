package spark.skins.spark
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.primitives.Rect;
   
   public class DataGridSkinInnerClass8 extends Rect
   {
       
      
      private var _88844982outerDocument:DataGridSkin;
      
      public function DataGridSkinInnerClass8()
      {
         super();
         this.fill = this._DataGridSkinInnerClass8_SolidColor1_c();
      }
      
      private function _DataGridSkinInnerClass8_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : DataGridSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:DataGridSkin) : void
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
