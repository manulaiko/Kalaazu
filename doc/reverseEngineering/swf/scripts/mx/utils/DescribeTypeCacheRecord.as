package mx.utils
{
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public dynamic class DescribeTypeCacheRecord extends Proxy
   {
       
      
      private var cache:Object;
      
      public var typeDescription:XML;
      
      public var typeName:String;
      
      public function DescribeTypeCacheRecord()
      {
         this.cache = {};
         super();
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         var _loc2_:* = this.cache[param1];
         if(_loc2_ === undefined)
         {
            _loc2_ = DescribeTypeCache.extractValue(param1,this);
            this.cache[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      override flash_proxy function hasProperty(param1:*) : Boolean
      {
         if(param1 in this.cache)
         {
            return true;
         }
         var _loc2_:* = DescribeTypeCache.extractValue(param1,this);
         if(_loc2_ === undefined)
         {
            return false;
         }
         this.cache[param1] = _loc2_;
         return true;
      }
   }
}
