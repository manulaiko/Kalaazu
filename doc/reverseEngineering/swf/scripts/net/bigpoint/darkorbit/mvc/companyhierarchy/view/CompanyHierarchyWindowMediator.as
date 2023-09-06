package net.bigpoint.darkorbit.mvc.companyhierarchy.view
{
   import mx.collections.ArrayList;
   import net.bigpoint.darkorbit.mvc.companyhierarchy.class_1936;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_55.class_1004;
   import package_55.class_151;
   
   public class CompanyHierarchyWindowMediator extends Mediator implements IMediator, class_1004
   {
      
      public static const NAME:String = "CompanyHierarchyWindowMediator";
       
      
      public function CompanyHierarchyWindowMediator(param1:class_151)
      {
         super(NAME,param1);
         param1.handler = this;
      }
      
      private function get companyHierarchyWindow() : class_151
      {
         return super.viewComponent as class_151;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [class_1936.const_60,class_1936.const_774];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case class_1936.const_60:
               this.companyHierarchyWindow.method_4857(param1.getBody() as ArrayList);
               break;
            case class_1936.const_774:
               this.companyHierarchyWindow.mainTabBar.selectedIndex = (param1.getBody() as int) - 1;
               this.companyHierarchyWindow.method_315();
         }
      }
      
      public function method_1331(param1:int) : void
      {
         param1 += 1;
         facade.sendNotification(class_1936.const_774,param1);
      }
   }
}
