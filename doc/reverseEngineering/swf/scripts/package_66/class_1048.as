package package_66
{
   import fl.controls.ComboBox;
   import net.bigpoint.darkorbit.gui.class_58;
   import package_30.class_91;
   
   public class class_1048 extends class_91
   {
       
      
      private var guiManager:class_58;
      
      private var var_3279:ComboBox;
      
      private var var_2488:Array;
      
      public function class_1048(param1:class_58)
      {
         this.var_2488 = [1,5,10,50,100,500,1000];
         super(const_1723);
         this.guiManager = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.var_3279 = new ComboBox();
         this.var_3279.focusEnabled = false;
         addChild(this.var_3279);
      }
      
      public function method_4625(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2488.length)
         {
            _loc3_ = int(this.var_2488[_loc2_]);
            if(_loc3_ < param1)
            {
               this.var_3279.addItem({"label":this.var_2488[_loc2_]});
            }
            _loc2_++;
         }
         this.var_3279.addItem({"label":param1});
      }
      
      public function get name_54() : ComboBox
      {
         return this.var_3279;
      }
   }
}
