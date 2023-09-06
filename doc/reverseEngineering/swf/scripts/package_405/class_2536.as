package package_405
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
   import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;
   import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBoxEvent;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import package_406.class_2535;
   
   public class class_2536 extends DefaultItemDataAssigner
   {
       
      
      protected var var_1900:CheckBox;
      
      protected var _label:Label;
      
      protected var var_1446:Button;
      
      public function class_2536()
      {
         super();
         _mouseEnabled = true;
         _mouseChildrenEnabled = true;
         initialize();
      }
      
      override public function assignChildren() : void
      {
         super.assignChildren();
         this.var_1900 = getChildByName("settingsCheckBox") as CheckBox;
         this._label = getChildByName("settingLabel") as Label;
         this.var_1446 = getChildByName("infoIconInterfaceSettings") as Button;
         this.var_1900.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED,this.method_622);
      }
      
      private function get method_1315() : class_2535
      {
         return data as class_2535;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1 as class_2535;
         if(this.method_1315)
         {
            this._label.text = class_88.getItem(this.method_1315.method_572);
            this.var_1900.selection = this.method_1315.method_3850;
            if(this.method_1315.method_151)
            {
               this.var_1446.tooltipData = class_88.getItem(this.method_1315.method_151);
               this.var_1446.visible = true;
            }
            else
            {
               this.var_1446.visible = false;
            }
         }
      }
      
      private function method_622(param1:CheckBoxEvent) : void
      {
         this.method_1315.method_3850 = this.var_1900.selection;
         this.dispatchEvent(new class_2531(class_2531.LISTED_CHECKBOX_CHANGED,this.method_1315));
      }
   }
}
