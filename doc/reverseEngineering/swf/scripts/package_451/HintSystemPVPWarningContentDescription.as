package package_451
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_38.class_595;
   import package_392.class_2265;
   import package_392.class_2266;
   import package_448.class_2514;
   
   public class HintSystemPVPWarningContentDescription extends class_2266 implements class_2265
   {
      
      private static const const_40:String = "HintSystemPVPWarningContentDescription";
       
      
      public function HintSystemPVPWarningContentDescription(param1:String)
      {
         super(param1);
      }
      
      override public function method_3751(param1:String = "default") : String
      {
         return const_40;
      }
      
      override public function get content() : class_2514
      {
         var _loc1_:* = null;
         if(_content == null)
         {
            _loc1_ = new class_2514();
            _loc1_.title = class_88.getItem("gameentry_hintwindow_title_pvp");
            _loc1_.message = method_6274("gameentry_hintwindow_message_pvp");
            _loc1_.method_4859 = class_595.OPEN;
            _loc1_.method_6490 = method_2843();
            _content = _loc1_;
         }
         return _content;
      }
      
      override public function get method_108() : int
      {
         return 1400;
      }
   }
}
