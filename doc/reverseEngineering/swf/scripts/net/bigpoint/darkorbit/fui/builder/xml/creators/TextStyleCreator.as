package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import flash.text.TextFieldAutoSize;
   import flashx.textLayout.formats.TextAlign;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
   
   public class TextStyleCreator extends AbstractCreator
   {
       
      
      public function TextStyleCreator()
      {
         super();
      }
      
      override protected function initializeAttributeMapping() : void
      {
         super.initializeAttributeMapping();
         this.attributeToMethodMap["autoSize"] = this.handleAutoSizeAttribute;
         this.attributeToMethodMap["align"] = this.handleAlignAttribute;
      }
      
      private function handleAlignAttribute(param1:Object, param2:String) : void
      {
         param2 = param2.toLowerCase();
         var _loc3_:TextStyleVO = param1 as TextStyleVO;
         switch(param2)
         {
            case TextAlign.LEFT:
            case TextAlign.RIGHT:
            case TextAlign.CENTER:
            case TextAlign.JUSTIFY:
            case TextAlign.END:
            case TextAlign.START:
               _loc3_.align = param2;
         }
      }
      
      public function create(param1:XML) : TextStyleVO
      {
         var _loc2_:TextStyleVO = new TextStyleVO("null");
         mapXMLNodeAttributes(_loc2_,param1);
         TextStyleRepository.getInstance().register(_loc2_);
         return _loc2_;
      }
      
      protected function handleAutoSizeAttribute(param1:Object, param2:String) : void
      {
         param2 = param2.toLowerCase();
         var _loc3_:TextStyleVO = param1 as TextStyleVO;
         switch(param2)
         {
            case TextFieldAutoSize.LEFT:
            case TextFieldAutoSize.RIGHT:
            case TextFieldAutoSize.CENTER:
            case TextFieldAutoSize.NONE:
               _loc3_.autoSize = param2;
         }
      }
   }
}
