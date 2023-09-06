package package_255
{
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.setInterval;
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_14.class_52;
   import package_17.class_62;
   import package_28.EventStreamClient;
   import package_343.class_1916;
   import package_343.class_1919;
   import package_9.class_50;
   import package_97.class_257;
   
   public class StatsProxy extends Proxy implements IProxy, class_52
   {
      
      public static const NAME:String = "StatsProxy";
       
      
      private var var_4487:uint;
      
      private var _frameTicks:int;
      
      private var var_4421:int;
      
      private var var_1090:Number;
      
      private var var_3244:class_1916;
      
      private var var_3210:class_1919;
      
      private var var_2793:Dictionary;
      
      private var _tpf:Number = 0;
      
      public function StatsProxy()
      {
         this.var_2793 = new Dictionary();
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         this.var_1090 = 9.5367431640625e-7;
         this.var_3244 = new class_1916();
         this.var_3210 = new class_1919();
         class_50.method_5621(this);
         sendNotification(class_257.READY);
         this.var_4487 = setInterval(this.method_4828,60000);
      }
      
      public function updateTimer(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ++this._frameTicks;
         this._tpf += param1;
         if(this._tpf > 999)
         {
            ++this.var_4421;
            if(this.var_3244.currentFPS > this.var_3210.maxFPS)
            {
               this.var_3210.maxFPS = this.var_3244.currentFPS;
            }
            if(this.var_3244.currentFPS < this.var_3210.var_3297 || this.var_3210.var_3297 == 0)
            {
               this.var_3210.var_3297 = this.var_3244.currentFPS;
            }
            if(this.var_3244.var_3188 > this.var_3210.var_4164)
            {
               this.var_3210.var_4164 = this.var_3244.var_3188;
            }
            if(this.var_3244.var_3188 < this.var_3210.var_901 || this.var_3210.var_901 == 0)
            {
               this.var_3210.var_901 = this.var_3244.var_3188;
            }
            this.var_3210.var_945 = (Number(this.var_3210.var_945) * (this.var_4421 - 1) + this.var_3244.currentFPS) / Number(this.var_4421);
            this.var_3210.var_1292 = (Number(this.var_3210.var_1292) * (this.var_4421 - 1) + this.var_3244.var_3188) / Number(this.var_4421);
            this.var_3244.currentFPS = this._frameTicks;
            if(class_50.getInstance().method_5413)
            {
               this.var_3244.var_3021.unshift(this._frameTicks);
               if(this.var_3244.var_3021.length > 50)
               {
                  _loc2_ = class_62.getInstance().retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
                  _loc3_ = !!_loc2_ ? _loc2_.connectionManager.method_2547 : Settings.defaultGameServer;
                  if(_loc3_)
                  {
                     _loc4_ = 0;
                     _loc5_ = 0;
                     _loc6_ = 0;
                     _loc8_ = (_loc7_ = this.var_3244.var_3021).length;
                     _loc9_ = 0;
                     while(_loc9_ < _loc8_)
                     {
                        _loc4_ += _loc7_[_loc9_];
                        _loc5_ = Math.min(_loc5_,_loc7_[_loc9_]);
                        _loc6_ = Math.max(_loc6_,_loc7_[_loc9_]);
                        _loc9_++;
                     }
                     _loc4_ /= _loc8_;
                     EventStreamClient.track("client_statistics_fps",{
                        "avg_fps":_loc4_,
                        "min_fps":_loc5_,
                        "max_fps":_loc6_,
                        "gameserver":_loc3_,
                        "time_interval":0.999
                     });
                  }
                  this.var_3244.var_3021.length = 0;
               }
            }
            this.var_3244.var_3188 = Number(0 * Number(this.var_1090));
            this._frameTicks = 0;
            this._tpf = 0;
            sendNotification(class_257.UPDATE,[this.var_3244]);
         }
      }
      
      public function method_3827(param1:String, param2:String) : void
      {
         this.var_2793[param1] = param2;
         this.method_5337();
         sendNotification(class_257.UPDATE,[this.var_3244]);
      }
      
      private function method_4828() : void
      {
         var _loc1_:class_50 = class_50.getInstance();
         if(_loc1_.map && _loc1_.map.hero && Boolean(_loc1_.method_5413))
         {
            EventStreamClient.track("usersystem_current_fps",{
               "position_area":Settings.mapID,
               "fps":this.var_3244.currentFPS,
               "position_x":int(_loc1_.map.hero.x),
               "position_y":int(_loc1_.map.hero.y)
            });
         }
      }
      
      private function method_5337() : void
      {
         var _loc1_:* = null;
         this.var_3244.var_4264 = "";
         for(_loc1_ in this.var_2793)
         {
            if(this.var_3244.var_4264 != "")
            {
               this.var_3244.var_4264 += " | ";
            }
            this.var_3244.var_4264 += _loc1_ + ": " + this.var_2793[_loc1_];
         }
      }
   }
}
