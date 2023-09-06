package package_133
{
   import package_132.class_382;
   
   public class class_1850 implements class_382
   {
       
      
      private var _id:uint;
      
      private var _active:Boolean;
      
      public function class_1850(param1:uint, param2:Boolean)
      {
         super();
         this._active = param2;
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isActive() : Boolean
      {
         return this._active;
      }
   }
}
