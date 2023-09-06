package package_118
{
   public class class_1186 extends class_325
   {
       
      
      private var _format:class_325;
      
      public function class_1186()
      {
         super();
      }
      
      public function get format() : class_325
      {
         return this._format;
      }
      
      public function set format(param1:*) : void
      {
         if(param1 is class_325)
         {
            this._format = param1;
            return;
         }
         if(param1 is String)
         {
            this._format = class_325.method_6498(param1);
            return;
         }
         throw new Error(param1 + " is neither a Placeholder, nor a String.");
      }
      
      override public function link() : void
      {
         super.link();
         if(this._format !== null)
         {
            this._format.link();
         }
      }
   }
}
