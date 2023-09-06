package package_270
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.events.model.EventProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_262;
   import package_133.class_1855;
   import package_38.class_381;
   import package_84.class_1134;
   import package_9.ResourceManager;
   
   public class class_1967 extends class_1134
   {
       
      
      public function class_1967()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:class_1855 = param1.getBody() as class_1855;
         var _loc3_:class_90 = name_47.map;
         if(Boolean(_loc3_) && Boolean(_loc2_.method_5572[_loc3_.method_1480()]))
         {
            if((Boolean(_loc4_ = retrieveProxy(EventProxy.NAME) as EventProxy)) && Boolean(_loc4_.method_1341(class_381.const_2583)))
            {
               if(_loc5_ = _loc2_.method_5572[_loc3_.mapID])
               {
                  ResourceManager.name_15.load(_loc5_,this.method_5442);
                  return;
               }
            }
            _loc3_.init();
         }
      }
      
      private function method_5442(param1:class_262) : void
      {
         name_47.map.init(param1.method_4925());
      }
   }
}
