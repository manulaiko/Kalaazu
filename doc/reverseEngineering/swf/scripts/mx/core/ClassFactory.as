package mx.core
{
   public class ClassFactory implements IFactory
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var generator:Class;
      
      public var properties:Object = null;
      
      public function ClassFactory(param1:Class = null)
      {
         super();
         this.generator = param1;
      }
      
      public function newInstance() : *
      {
         var _loc2_:* = null;
         var _loc1_:Object = new this.generator();
         if(this.properties != null)
         {
            for(_loc2_ in this.properties)
            {
               _loc1_[_loc2_] = this.properties[_loc2_];
            }
         }
         return _loc1_;
      }
   }
}
