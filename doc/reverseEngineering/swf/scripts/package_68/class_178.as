package package_68
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_62.ChatMediator;
   import package_63.ChatNotifications;
   import package_63.class_224;
   
   public class class_178 extends SimpleCommand
   {
       
      
      private var var_2094:Loader;
      
      public function class_178()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.createLoader();
         this.var_2094.load(new URLRequest(class_224.method_5407),new LoaderContext(true));
      }
      
      private function createLoader() : void
      {
         this.var_2094 = new Loader();
         var _loc1_:LoaderInfo = this.var_2094.contentLoaderInfo;
         _loc1_.addEventListener(Event.COMPLETE,this.method_583);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.method_2323);
         _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_2323);
      }
      
      private function removeLoader() : MovieClip
      {
         if(this.var_2094 == null)
         {
            return null;
         }
         var _loc1_:LoaderInfo = this.var_2094.contentLoaderInfo;
         _loc1_.removeEventListener(Event.COMPLETE,this.method_583);
         _loc1_.removeEventListener(IOErrorEvent.IO_ERROR,this.method_2323);
         _loc1_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_2323);
         return MovieClip(this.var_2094.content);
      }
      
      private function method_583(param1:Event) : void
      {
         var _loc2_:MovieClip = this.removeLoader();
         if(_loc2_)
         {
            if(!facade.hasMediator(ChatMediator.NAME))
            {
               facade.registerMediator(new ChatMediator(_loc2_));
            }
            facade.sendNotification(ChatNotifications.const_776);
         }
      }
      
      private function method_2323(param1:IOErrorEvent) : void
      {
         this.removeLoader();
      }
   }
}
