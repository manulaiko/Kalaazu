package package_314
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_11.class_65;
   import package_389.class_2257;
   
   public class class_1794 extends AsyncCommand
   {
      
      private static const const_2262:uint = 2;
       
      
      private var var_3002:uint = 0;
      
      public function class_1794()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:String = "null";
         var _loc3_:* = _loc2_ + "_bg";
         var _loc4_:* = _loc2_ + "_char";
         var _loc5_:AssetsProxy;
         (_loc5_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy).load(_loc3_,this.method_4993);
         _loc5_.load(_loc4_,this.method_4112);
      }
      
      protected function method_4993(param1:class_65) : void
      {
         ++this.var_3002;
         var _loc2_:class_2257 = facade.retrieveMediator(class_2257.NAME) as class_2257;
         _loc2_.method_4993(param1);
         this.method_1648();
      }
      
      protected function method_4112(param1:class_65) : void
      {
         ++this.var_3002;
         var _loc2_:class_2257 = facade.retrieveMediator(class_2257.NAME) as class_2257;
         _loc2_.method_4112(param1);
         this.method_1648();
      }
      
      protected function method_1648() : void
      {
         if(this.var_3002 == const_2262)
         {
            commandComplete();
         }
      }
   }
}
