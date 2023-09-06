package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.text.IText;
   
   public class AbstractCreator
   {
      
      public static const ATTRIBUTEVALUE_SIZE_WILDCARD:String = "package_1";
      
      public static const ATTRIBUTEVALUE_SIZE_FILL:String = "fill";
      
      public static const ATTRIBUTEVALUE_SIZE_RELATIVE:String = "%";
      
      public static const ATTRIBUTENAME_WIDTH:String = "width";
      
      public static const ATTRIBUTENAME_HEIGHT:String = "height";
      
      public static const ATTRIBUTENAME_RELATIVE_WIDTH:String = "relativeWidth";
      
      public static const ATTRIBUTENAME_RELATIVE_HEIGHT:String = "relativeHeight";
      
      public static const ATTRIBUTENAME_SIZEHANDLING:String = "sizeHandling";
      
      public static const ATTRIBUTENAME_LIBRARY:String = "library";
      
      public static const ATTRIBUTENAME_LIBRARYID:String = "libraryID";
      
      protected static const ATTRIBUTE_SEPARATOR:String = ":";
      
      protected static const LOCALIZE_ATTRIBUTE_NAME_AE:String = "localize" + ATTRIBUTE_SEPARATOR;
      
      protected static const LOCALIZE_ATTRIBUTE_NAME_BE:String = "localise" + ATTRIBUTE_SEPARATOR;
       
      
      protected var attributeToMethodMap:Dictionary;
      
      public function AbstractCreator()
      {
         this.attributeToMethodMap = new Dictionary();
         super();
         this.initializeAttributeMapping();
      }
      
      protected static function isBoolean(param1:String) : Boolean
      {
         var _loc2_:String = param1.toLowerCase();
         var _loc3_:Boolean = false;
         if(_loc2_ == "true")
         {
            _loc3_ = true;
         }
         else if(_loc2_ == "false")
         {
            _loc3_ = false;
         }
         return _loc3_;
      }
      
      protected function initializeAttributeMapping() : void
      {
         this.attributeToMethodMap["tooltipData"] = this.handleTooltipDataAttribute;
         this.attributeToMethodMap["text"] = this.handleTextAttribute;
      }
      
      protected function handleTooltipDataAttribute(param1:Object, param2:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:Coreponent = param1 as Coreponent;
         if(_loc3_)
         {
            if(_loc4_ = String(param2))
            {
               _loc3_.tooltipData = this.attemptTolocalizeText(_loc4_);
            }
         }
      }
      
      protected function handleTextAttribute(param1:Object, param2:String) : void
      {
         var _loc3_:IText = param1 as IText;
         if(Boolean(_loc3_) && Boolean(param2))
         {
            _loc3_.text = this.attemptTolocalizeText(param2);
         }
      }
      
      protected function mapXMLNodeAttributes(param1:Object, param2:XML) : void
      {
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc3_:XMLList = param2.attributes();
         for each(_loc4_ in _loc3_)
         {
            if(_loc11_ = this.invokeSpecificAttributeHandler(param1,_loc4_))
            {
               _loc12_ = _loc4_.name();
               if((_loc13_ = param1 as Object).hasOwnProperty(_loc12_))
               {
                  _loc14_ = (_loc14_ = _loc4_.valueOf()) == "true" ? true : (_loc14_ == "false" ? false : _loc14_);
                  _loc13_[_loc12_] = _loc14_;
               }
               else
               {
                  UISystem.log("Couldn´t map attribute {" + _loc12_ + "} with the following value={" + _loc4_.valueOf() + "}",UISystem.LOG_LEVEL_WARN);
               }
            }
         }
         if(param1 as DisplayObject == null)
         {
            return;
         }
         var _loc5_:Object = param2.attribute(ATTRIBUTENAME_WIDTH);
         var _loc6_:Object = param2.attribute(ATTRIBUTENAME_HEIGHT);
         var _loc7_:Number = Number(_loc5_);
         var _loc8_:Number = Number(_loc6_);
         if(isNaN(_loc7_))
         {
            _loc9_ = String(_loc5_);
         }
         if(isNaN(_loc8_))
         {
            _loc10_ = String(_loc6_);
         }
         if(_loc9_)
         {
            this.handleSpecialAttribute(param1,ATTRIBUTENAME_RELATIVE_WIDTH,_loc9_);
         }
         if(_loc10_)
         {
            this.handleSpecialAttribute(param1,ATTRIBUTENAME_RELATIVE_HEIGHT,_loc10_);
         }
         if(_loc7_ == 0)
         {
            this.setDefaultWidthBasedOnSkin(param1);
         }
         if(_loc8_ == 0)
         {
            this.setDefaultHeightBasedOnSkin(param1);
         }
      }
      
      protected function handleSpecialAttribute(param1:Object, param2:String, param3:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         if(param3.indexOf(ATTRIBUTEVALUE_SIZE_RELATIVE) != -1)
         {
            _loc4_ = param3.indexOf(ATTRIBUTEVALUE_SIZE_RELATIVE);
            _loc5_ = Number(param3.substr(0,_loc4_));
            param1[param2] = _loc5_;
            param1[ATTRIBUTENAME_SIZEHANDLING] = Coreponent.SIZE_RELATIVE;
         }
         else
         {
            switch(param3)
            {
               case ATTRIBUTEVALUE_SIZE_WILDCARD:
               case ATTRIBUTEVALUE_SIZE_FILL:
                  param1[ATTRIBUTENAME_SIZEHANDLING] = Coreponent.SIZE_FILL;
            }
         }
      }
      
      protected function setDefaultWidthBasedOnSkin(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 as Coreponent != null)
         {
            _loc2_ = (param1 as Coreponent).skin;
            if(_loc2_)
            {
               _loc3_ = _loc2_.measureRawSkinSize;
               param1[ATTRIBUTENAME_WIDTH] = _loc3_.width;
            }
         }
         else if(param1 as DisplayObject != null)
         {
            if(_loc4_ = param1 as DisplayObject)
            {
               if(_loc4_.width > 0)
               {
                  param1[ATTRIBUTENAME_WIDTH] = _loc4_.width;
               }
            }
         }
         else
         {
            this.traceSizeAssignError(param1);
         }
      }
      
      protected function setDefaultHeightBasedOnSkin(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 as Coreponent != null)
         {
            _loc2_ = (param1 as Coreponent).skin;
            if(_loc2_)
            {
               _loc3_ = _loc2_.measureRawSkinSize;
               param1[ATTRIBUTENAME_HEIGHT] = _loc3_.height;
            }
         }
         else if(param1 as DisplayObject != null)
         {
            if(_loc4_ = param1 as DisplayObject)
            {
               if(_loc4_.height > 0)
               {
                  param1[ATTRIBUTENAME_HEIGHT] = _loc4_.height;
               }
            }
         }
         else
         {
            this.traceSizeAssignError(param1);
         }
      }
      
      private function traceSizeAssignError(param1:Object) : void
      {
         var _loc2_:String = "UNKNOW";
         if(param1)
         {
            if(param1.hasOwnProperty("name"))
            {
               _loc2_ = param1["name"];
            }
         }
         UISystem.log("Couldn´t assign default size. Perhaps you didn´t assign a skin to the current component with the name=[" + _loc2_ + " ]");
      }
      
      protected function invokeSpecificAttributeHandler(param1:Object, param2:XML) : Boolean
      {
         var _loc3_:String = param2.name();
         if(this.attributeToMethodMap[_loc3_])
         {
            this.attributeToMethodMap[_loc3_](param1,param2.valueOf());
            return false;
         }
         return true;
      }
      
      protected function attemptTolocalizeText(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc3_:String = param1;
         _loc2_ = param1.indexOf(LOCALIZE_ATTRIBUTE_NAME_AE);
         if(_loc2_ < 0)
         {
            _loc2_ = param1.indexOf(LOCALIZE_ATTRIBUTE_NAME_BE);
         }
         if(_loc2_ >= 0)
         {
            _loc4_ = param1.split(ATTRIBUTE_SEPARATOR)[1];
            return UISystem.localize(_loc4_);
         }
         return _loc3_;
      }
   }
}
