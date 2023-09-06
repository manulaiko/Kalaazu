package spark.effects.interpolation
{
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class NumberInterpolator implements IInterpolator
   {
      
      private static var theInstance:NumberInterpolator;
       
      
      private var resourceManager:IResourceManager;
      
      public function NumberInterpolator()
      {
         this.resourceManager = ResourceManager.getInstance();
         super();
      }
      
      public static function getInstance() : NumberInterpolator
      {
         if(!theInstance)
         {
            theInstance = new NumberInterpolator();
         }
         return theInstance;
      }
      
      public function interpolate(param1:Number, param2:Object, param3:Object) : Object
      {
         if(param1 == 0)
         {
            return param2;
         }
         if(param1 == 1)
         {
            return param3;
         }
         if(param2 is Number && isNaN(Number(param2)) || param3 is Number && isNaN(Number(param3)))
         {
            throw new Error(this.resourceManager.getString("sparkEffects","cannotCalculateValue",[param2,param3]));
         }
         return Number(param2) + param1 * (Number(param3) - Number(param2));
      }
      
      public function increment(param1:Object, param2:Object) : Object
      {
         return Number(param1) + Number(param2);
      }
      
      public function decrement(param1:Object, param2:Object) : Object
      {
         return Number(param1) - Number(param2);
      }
   }
}
