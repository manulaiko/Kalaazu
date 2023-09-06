package flashx.textLayout.conversion
{
   public class TLFormatImporter implements IFormatImporter
   {
       
      
      private var _classType:Class;
      
      private var _description:Object;
      
      private var _rslt:Object;
      
      public function TLFormatImporter(param1:Class, param2:Object)
      {
         super();
         this._classType = param1;
         this._description = param2;
      }
      
      public function get classType() : Class
      {
         return this._classType;
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
         if(this._description.hasOwnProperty(param1))
         {
            if(this._rslt == null)
            {
               this._rslt = new this._classType();
            }
            this._rslt[param1] = this._description[param1].setHelper(undefined,param2);
            return true;
         }
         return false;
      }
   }
}
