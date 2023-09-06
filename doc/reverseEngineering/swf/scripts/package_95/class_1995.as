package package_95
{
   import flash.events.Event;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.net.class_59;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_352.ClientSelectionView;
   import package_84.class_1134;
   
   public class class_1995 extends class_1134
   {
       
      
      public function class_1995()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         if(false)
         {
            assetsProxy.loadAndCall("clientSelection",this.method_6152,[]);
         }
         else if(false)
         {
            Settings.FORCE_2D.value = false;
            commandComplete();
         }
         else
         {
            Settings.FORCE_2D.value = true;
            commandComplete();
         }
      }
      
      public function method_6152() : void
      {
         var _loc1_:ClientSelectionView = new ClientSelectionView();
         _loc1_.addEventListener(ClientSelectionView.var_23,this.method_5462);
         _loc1_.addEventListener(ClientSelectionView.var_2064,this.method_5885);
         _loc1_.addEventListener(ClientSelectionView.var_2184,this.method_1411);
         name_47.stage.addChild(_loc1_);
      }
      
      private function method_5885(param1:Event) : void
      {
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_23,this.method_5462);
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_2064,this.method_5885);
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_2184,this.method_5885);
         Settings.FORCE_2D.value = false;
         commandComplete();
      }
      
      private function method_5462(param1:Event) : void
      {
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_23,this.method_5462);
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_2064,this.method_5885);
         (param1.target as ClientSelectionView).removeEventListener(ClientSelectionView.var_2184,this.method_5885);
         Settings.FORCE_2D.value = true;
         commandComplete();
      }
      
      private function method_1411(param1:Event) : void
      {
         class_59.call(class_59.const_1192,[class_88.getItem("client_selection_faq_link")]);
      }
   }
}
