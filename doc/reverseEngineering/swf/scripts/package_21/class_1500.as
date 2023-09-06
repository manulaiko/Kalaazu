package package_21
{
   import mx.core.IFlexModuleFactory;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_38.class_787;
   import package_47.class_976;
   
   public class class_1500 extends class_977
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1500()
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
      
      override protected function createChildren() : void
      {
         super.createChildren();
         columnLabelContainer.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_amount_of_players");
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = "null";
         var _loc3_:String = "null";
         var _loc4_:class_787 = param1 as class_787;
         rowLabel.htmlText = "<font size=\'12\' color=\'#" + _loc2_ + "\'>" + _loc4_.var_3387.toString() + "</font>" + "<font size=\'12\' color=\'#" + _loc3_ + "\'>" + "/" + _loc4_.var_917.toString() + "</font>";
      }
   }
}
