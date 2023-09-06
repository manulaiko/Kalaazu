package package_110
{
   public class Version
   {
      
      public static const VERSION:String = "10.0";
      
      public static const BUILD:String = "3311";
       
      
      private var _version:String = "10.0";
      
      public function Version()
      {
         super();
         if(BUILD != "%BUILD.NUMBER%")
         {
            this._version += "." + BUILD;
         }
         this._version += "";
      }
      
      public function method_422() : String
      {
         return this._version;
      }
   }
}
