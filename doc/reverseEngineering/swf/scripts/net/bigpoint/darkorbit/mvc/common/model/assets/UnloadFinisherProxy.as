package net.bigpoint.darkorbit.mvc.common.model.assets
{
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_11.class_38;
   
   public class UnloadFinisherProxy extends Proxy
   {
      
      public static const NAME:String = "UnloadFinisherProxy";
       
      
      public function UnloadFinisherProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         sendNotification(AssetNotifications.UNLOAD_FINISHER_PROXY_READY);
      }
      
      private function get finisherList() : Vector.<class_38>
      {
         return data as Vector.<class_38>;
      }
      
      public function unloadAllFinisher() : void
      {
         while(this.finisherList.length > 0)
         {
            this.finisherList.pop().dispose();
         }
      }
      
      public function addFinisher(param1:class_38) : void
      {
         if(param1.name_58.id == "ui")
         {
            return;
         }
         if(false && Boolean(param1))
         {
            this.finisherList.push(param1);
         }
      }
   }
}
