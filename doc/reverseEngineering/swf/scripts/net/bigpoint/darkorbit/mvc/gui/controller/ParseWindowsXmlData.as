package net.bigpoint.darkorbit.mvc.gui.controller
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowDefinitionVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_117;
   import package_38.class_357;
   import package_38.class_358;
   import package_38.class_360;
   import package_84.class_243;
   
   public class ParseWindowsXmlData extends class_243
   {
       
      
      public function ParseWindowsXmlData()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.parseData(class_9.var_2751.windows);
      }
      
      private function parseData(param1:XMLList) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         guiProxy.featureWindows = new Vector.<FeatureWindowVO>();
         for each(_loc2_ in param1.window)
         {
            _loc3_ = this.parseWindowDefinition(_loc2_);
            _loc4_ = new FeatureWindowVO(_loc2_.@id,_loc2_.@titleKey,new class_73(_loc2_.@x,_loc2_.@y),new class_73(_loc2_.@width,_loc2_.@height),ParserUtility.parseBooleanFromXmlAtribute(_loc2_.@maximized),_loc3_,this.getMsgKeyListWildcardFromTextKey(_loc2_.@helpKey),this.getMsgKeyListWildcardFromTextKey(_loc2_.@titleKey),ParserUtility.parseBooleanFromXmlAtribute(_loc2_.@showOnTop));
            guiProxy.featureWindows.push(_loc4_);
         }
         sendNotification(FeaturesMenuNotifications.DATA_READY);
      }
      
      private function parseWindowDefinition(param1:XML) : FeatureWindowDefinitionVO
      {
         return new FeatureWindowDefinitionVO(ParserUtility.parseBooleanFromXmlAtribute(param1.@closeable),ParserUtility.parseBooleanFromXmlAtribute(param1.@resizable),ParserUtility.parseBooleanFromXmlAtribute(param1.@minimizable,true),ParserUtility.parseBooleanFromXmlAtribute(param1.@expandable),ParserUtility.parseBooleanFromXmlAtribute(param1.@zoomable),ParserUtility.parseBooleanFromXmlAtribute(param1.@draggable,true),ParserUtility.parseBooleanFromXmlAtribute(param1.@openCloseAnimation,true),ParserUtility.parseBooleanFromXmlAtribute(param1.@transparencySupport,true),ParserUtility.parseFourCommaSeparatedValuesFromXmlAttribute(param1.@resizebound),param1.infoFieldContainer,param1.containers.simpleContainer);
      }
      
      private function getMsgKeyListWildcardFromTextKey(param1:String) : class_358
      {
         var _loc2_:class_357 = new class_357(0,param1,new class_117(class_117.LOCALIZED),new Vector.<class_360>());
         return new class_358(new <class_357>[_loc2_]);
      }
   }
}
