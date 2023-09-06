package flashx.textLayout.conversion
{
   class SingletonAttributeImporter implements IFormatImporter
   {
       
      
      private var _keyToMatch:String;
      
      private var _rslt:String = null;
      
      function SingletonAttributeImporter(param1:String)
      {
         super();
         this._keyToMatch = param1;
      }
      
      public function reset() : void
      {
         this._rslt = null;
      }
      
      public function get result() : Object
      {
         return this._rslt;
      }
      
      public function importOneFormat(param1:String, param2:String) : Boolean
      {
         if(param1 == this._keyToMatch)
         {
            this._rslt = param2;
            return true;
         }
         return false;
      }
   }
}
