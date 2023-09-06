package spark.effects.interpolation
{
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class MultiValueInterpolator implements IInterpolator
   {
       
      
      private var resourceManager:IResourceManager;
      
      private var _elementInterpolator:IInterpolator;
      
      public function MultiValueInterpolator(param1:IInterpolator = null)
      {
         this.resourceManager = ResourceManager.getInstance();
         this._elementInterpolator = NumberInterpolator.getInstance();
         super();
         if(param1 != null)
         {
            this.elementInterpolator = param1;
         }
      }
      
      public function get elementInterpolator() : IInterpolator
      {
         return this._elementInterpolator;
      }
      
      public function set elementInterpolator(param1:IInterpolator) : void
      {
         this._elementInterpolator = !!param1 ? param1 : NumberInterpolator.getInstance();
      }
      
      public function interpolate(param1:Number, param2:Object, param3:Object) : Object
      {
         var _loc4_:* = null;
         if(param2.length != param3.length)
         {
            throw new Error(this.resourceManager.getString("sparkEffects","arraysNotOfEqualLength"));
         }
         if(param2 is Array)
         {
            _loc4_ = [];
         }
         else
         {
            _loc4_ = param2.splice(0,0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_[_loc5_] = this._elementInterpolator.interpolate(param1,param2[_loc5_],param3[_loc5_]);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function increment(param1:Object, param2:Object) : Object
      {
         var _loc3_:* = null;
         if(param1 is Array)
         {
            _loc3_ = [];
         }
         else
         {
            _loc3_ = param1.splice(0,0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = this._elementInterpolator.increment(param1[_loc4_],param2);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function decrement(param1:Object, param2:Object) : Object
      {
         var _loc3_:* = null;
         if(param1 is Array)
         {
            _loc3_ = [];
         }
         else
         {
            _loc3_ = param1.splice(0,0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = this._elementInterpolator.decrement(param1[_loc4_],param2);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
