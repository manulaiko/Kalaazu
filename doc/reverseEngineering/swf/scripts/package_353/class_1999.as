package package_353
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_25.MinimapMediator;
   import package_84.class_1134;
   
   public class class_1999 extends class_1134
   {
       
      
      public function class_1999()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         name_47.method_876(this.commandComplete);
      }
      
      override protected function commandComplete() : void
      {
         facade.registerMediator(new MinimapMediator(name_47.minimap));
         super.commandComplete();
      }
   }
}
