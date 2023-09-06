package package_451
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.fui.components.core.transitions.AlphaFadeEffect;
   import package_38.class_595;
   import package_392.class_2265;
   import package_392.class_2266;
   import package_448.class_2505;
   import package_448.class_2507;
   import package_448.class_2514;
   
   public class HintSystemWelcomeContentDescription extends class_2266 implements class_2265
   {
      
      private static const const_40:String = "HintSystemWelcomeContentDescription";
      
      private static const const_2876:String = "hint-system_image_welcome_screen_";
       
      
      public function HintSystemWelcomeContentDescription(param1:String)
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
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_content == null)
         {
            _loc1_ = class_126.getInstance().method_3731[class_81.factionID];
            _loc2_ = new class_2514();
            _loc2_.title = class_88.getItem("gameentry_hintwindow_title_welcome");
            _loc2_.message = method_6274("gameentry_hintwindow_message_welcome");
            _loc2_.message = _loc2_.message.replace("%MENTORNAME%",_loc1_);
            _loc2_.message = _loc2_.message.replace("%HERONAME%",class_81.name_148);
            _loc2_.method_4859 = class_595.OPEN;
            _loc3_ = new Vector.<class_2507>();
            _loc3_.push(this.method_3576());
            _loc4_ = new class_2505(_loc3_,false);
            _loc2_.method_6490 = _loc4_;
            _content = _loc2_;
         }
         return _content;
      }
      
      protected function method_3576() : class_2507
      {
         var _loc1_:String = const_2876 + class_81.method_2322;
         return new class_2507(_loc1_,new AlphaFadeEffect(),4500);
      }
      
      override public function get method_108() : int
      {
         return 100;
      }
   }
}
