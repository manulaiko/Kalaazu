package fl.data
{
   public dynamic class SimpleCollectionItem
   {
       
      
      public var data:String;
      
      public var label:String;
      
      public function SimpleCollectionItem()
      {
         super();
      }
      
      public function toString() : String
      {
         return "[SimpleCollectionItem: " + label + "," + data + "]";
      }
   }
}
