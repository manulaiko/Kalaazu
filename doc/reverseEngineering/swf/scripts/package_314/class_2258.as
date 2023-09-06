package package_314
{
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_28.EventStreamClient;
   import package_38.class_668;
   import package_38.class_672;
   import package_388.HintSystemNotifications;
   import package_389.class_2257;
   import package_392.class_2265;
   import package_448.class_2504;
   import package_76.TimeMeasuring;
   
   public class class_2258 extends SimpleCommand
   {
       
      
      public function class_2258()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         super.execute(param1);
         var _loc2_:Array = param1.getBody() as Array;
         _loc3_ = _loc2_[0] as class_2265;
         var _loc4_:class_2257;
         (_loc4_ = facade.retrieveMediator(class_2257.NAME) as class_2257).method_2298();
         if(_loc3_)
         {
            _loc7_ = int(_loc3_.id);
            _loc8_ = new class_672(_loc7_);
            (_loc9_ = new class_668(_loc8_)).name_78 = _loc3_.name_78;
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc9_);
            if(_loc3_.content.method_5410 != null)
            {
               _loc11_ = _loc3_.content.method_5410;
               _loc12_ = "null";
               (_loc13_ = new class_2504()).method_3359 = _loc12_;
               facade.registerCommand(_loc12_,_loc11_);
               facade.sendNotification(_loc12_,_loc13_);
            }
            if((_loc10_ = (_loc10_ = Number(TimeMeasuring.stop(_loc7_.toString(),TimeMeasuring.const_285))) > 0 ? _loc10_ : 0) > 0)
            {
               if(!(_loc14_ = _loc3_.method_1230))
               {
                  throw new Error("ContentDescription::ContentName is missing! You have to specify the contentName for the content with the following ID = " + _loc7_);
               }
               EventStreamClient.track("hint_closed",{
                  "hintIdentifier":_loc14_,
                  "timeSinceOpen":_loc10_
               });
            }
         }
         var _loc6_:FeatureBtn;
         var _loc5_:FeaturesMenuMediator;
         if(_loc6_ = (_loc5_ = facade.retrieveMediator(FeaturesMenuMediator.NAME) as FeaturesMenuMediator).getGameFeatureBtnById(GuiConstants.HELP_WINDOW))
         {
            _loc15_ = _loc6_.localToGlobal(new Point(0,0));
            _loc4_.method_2246(_loc15_);
         }
      }
   }
}
