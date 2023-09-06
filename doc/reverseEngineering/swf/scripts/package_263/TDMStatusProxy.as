package package_263
{
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_344.class_1927;
   import package_38.class_529;
   import package_38.class_959;
   import package_83.TDMStatusNotification;
   
   public class TDMStatusProxy extends Proxy
   {
      
      public static const NAME:String = "TDMStatusProxy";
       
      
      public function TDMStatusProxy(param1:Object)
      {
         super(NAME,param1);
      }
      
      private function get model() : class_1666
      {
         return data as class_1666;
      }
      
      public function update(param1:class_959) : void
      {
         this.method_1563(param1.name_151,param1.name_48);
         this.method_725(param1.name_101,param1.name_89);
         this.method_6531(param1.name_109);
         this.method_1979(param1.name_71);
      }
      
      private function method_1979(param1:int) : void
      {
         if(this.model.name_71 != param1)
         {
            this.model.name_71 = param1;
            sendNotification(TDMStatusNotification.UPDATE_REMAINING_LIVES,this.model.name_71);
         }
      }
      
      private function method_6531(param1:Vector.<class_529>) : void
      {
         if(this.model.method_1889(param1))
         {
            this.model.name_109 = param1;
            sendNotification(TDMStatusNotification.UPDATE_OVERALL_SCORE,this.model.name_109);
         }
      }
      
      private function method_725(param1:int, param2:int) : void
      {
         if(this.model.name_101 != param1 || this.model.name_89 != param2)
         {
            this.model.name_89 = param2;
            this.model.name_101 = param1;
            sendNotification(TDMStatusNotification.UPDATE_REMAINIG_SECONDS,this.model.name_101);
         }
      }
      
      private function method_1563(param1:Vector.<class_529>, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(this.model.method_2329(param1))
         {
            this.model.method_6169(param1,param2);
            _loc3_ = uint(this.model.name_151.length);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               if((_loc4_ = this.model.name_151[_loc5_]).faction == class_81.factionID)
               {
                  sendNotification(TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_PLAYER,_loc4_);
               }
               else
               {
                  sendNotification(TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_OPPONENT,_loc4_);
               }
               _loc5_++;
            }
         }
      }
   }
}
