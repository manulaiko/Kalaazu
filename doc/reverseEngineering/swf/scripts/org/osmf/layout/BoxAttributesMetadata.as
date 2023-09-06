package org.osmf.layout
{
   import org.osmf.events.MetadataEvent;
   import org.osmf.metadata.NonSynthesizingMetadata;
   
   class BoxAttributesMetadata extends NonSynthesizingMetadata
   {
      
      public static const RELATIVE_SUM:String = "relativeSum";
      
      public static const ABSOLUTE_SUM:String = "absoluteSum";
       
      
      private var _relativeSum:Number;
      
      private var _absoluteSum:Number;
      
      function BoxAttributesMetadata()
      {
         super();
         this._relativeSum = 0;
         this._absoluteSum = 0;
      }
      
      override public function getValue(param1:String) : *
      {
         if(param1 == null)
         {
            return undefined;
         }
         if(param1 == RELATIVE_SUM)
         {
            return this.relativeSum;
         }
         if(param1 == ABSOLUTE_SUM)
         {
            return this.absoluteSum;
         }
         return undefined;
      }
      
      public function get relativeSum() : Number
      {
         return this._relativeSum;
      }
      
      public function set relativeSum(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._relativeSum != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,RELATIVE_SUM,param1,this._relativeSum);
            this._relativeSum = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get absoluteSum() : Number
      {
         return this._absoluteSum;
      }
      
      public function set absoluteSum(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._absoluteSum != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,ABSOLUTE_SUM,param1,this._absoluteSum);
            this._absoluteSum = param1;
            dispatchEvent(_loc2_);
         }
      }
   }
}
