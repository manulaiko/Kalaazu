package package_247
{
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;
   import package_158.class_1008;
   
   public class class_1523 extends class_1521
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1523()
      {
         super();
         mx_internal::_document = this;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         super.creationCompleteHandler(param1);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_1008 = param1 as class_1008;
         if(_loc2_.var_3699 > 0)
         {
            rowLabel.htmlText = "<font size=\'12\' color=\'#undefined\'>" + _loc2_.var_3699.toString() + "</font>";
         }
         else
         {
            rowLabel.htmlText = "";
         }
      }
   }
}
