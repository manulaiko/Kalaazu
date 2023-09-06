package package_315
{
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_11.class_39;
   import package_388.class_2256;
   
   public class class_1790 extends AsyncCommand
   {
       
      
      public function class_1790()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
         _loc2_.lazyLoad(class_2256.name_129,this.method_919,this.method_75);
      }
      
      protected function method_919(param1:class_39) : void
      {
         commandComplete();
      }
      
      protected function method_75(param1:class_39) : void
      {
      }
   }
}
