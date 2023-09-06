package package_43
{
   import flash.utils.getTimer;
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_17.class_62;
   import package_28.EventStreamClient;
   
   public class class_121
   {
      
      public static const const_713:int = 1000;
      
      private static const const_2855:class_121 = new class_121();
       
      
      private const const_2238:Vector.<int> = new Vector.<int>(0);
      
      private var _time:int;
      
      public function class_121()
      {
         super();
         if(const_2855)
         {
            throw new Error("PingStats is singleton");
         }
      }
      
      public static function get instance() : class_121
      {
         return const_2855;
      }
      
      public function ping() : void
      {
         this._time = getTimer();
      }
      
      public function method_3868() : void
      {
         this.addData(getTimer() - Number(this._time));
      }
      
      private function addData(param1:int) : void
      {
         this.const_2238.push(param1);
         if(this.const_2238.length > 50)
         {
            this.track();
            this.const_2238.length = 0;
         }
      }
      
      private function track() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.const_2238.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ += this.const_2238[_loc5_];
            _loc2_ = Math.min(this.const_2238[_loc5_],_loc2_);
            _loc3_ = Math.max(this.const_2238[_loc5_],_loc3_);
            _loc5_++;
         }
         _loc1_ /= this.const_2238.length;
         var _loc6_:ConnectionProxy;
         var _loc7_:String = !!(_loc6_ = class_62.getInstance().retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy) ? _loc6_.connectionManager.method_2547 : Settings.defaultGameServer;
         EventStreamClient.track("client_statistics_ping",{
            "avg_ping":_loc1_,
            "min_ping":_loc2_,
            "max_ping":_loc3_,
            "gameserver":_loc7_,
            "time_interval":Number(const_713) * 0.001
         });
      }
   }
}
