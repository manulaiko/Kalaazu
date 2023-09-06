package spark.components
{
   import flash.events.Event;
   import mx.collections.IList;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.utils.BitFlagUtil;
   import spark.components.supportClasses.SkinnableContainerBase;
   import spark.events.RendererExistenceEvent;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class SkinnableDataContainer extends SkinnableContainerBase implements IItemRendererOwner
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const AUTO_LAYOUT_PROPERTY_FLAG:uint = 1;
      
      private static const DATA_PROVIDER_PROPERTY_FLAG:uint = 2;
      
      private static const ITEM_RENDERER_PROPERTY_FLAG:uint = 4;
      
      private static const ITEM_RENDERER_FUNCTION_PROPERTY_FLAG:uint = 8;
      
      private static const LAYOUT_PROPERTY_FLAG:uint = 16;
      
      private static const TYPICAL_ITEM_PROPERTY_FLAG:uint = 32;
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var dataGroupProperties:Object;
      
      public function SkinnableDataContainer()
      {
         this.dataGroupProperties = {};
         super();
      }
      
      public function get autoLayout() : Boolean
      {
         var _loc1_:* = undefined;
         if(this.dataGroup)
         {
            return this.dataGroup.autoLayout;
         }
         _loc1_ = this.dataGroupProperties.autoLayout;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.autoLayout = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,AUTO_LAYOUT_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.autoLayout = param1;
         }
      }
      
      [Bindable("dataProviderChanged")]
      public function get dataProvider() : IList
      {
         return !!this.dataGroup ? this.dataGroup.dataProvider : this.dataGroupProperties.dataProvider;
      }
      
      public function set dataProvider(param1:IList) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.dataProvider = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,DATA_PROVIDER_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.dataProvider = param1;
         }
         dispatchEvent(new Event("dataProviderChanged"));
      }
      
      public function get itemRenderer() : IFactory
      {
         return !!this.dataGroup ? this.dataGroup.itemRenderer : this.dataGroupProperties.itemRenderer;
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.itemRenderer = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,ITEM_RENDERER_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.itemRenderer = param1;
         }
      }
      
      public function get itemRendererFunction() : Function
      {
         return !!this.dataGroup ? this.dataGroup.itemRendererFunction : this.dataGroupProperties.itemRendererFunction;
      }
      
      public function set itemRendererFunction(param1:Function) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.itemRendererFunction = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,ITEM_RENDERER_FUNCTION_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.itemRendererFunction = param1;
         }
      }
      
      public function get layout() : LayoutBase
      {
         return !!this.dataGroup ? this.dataGroup.layout : this.dataGroupProperties.layout;
      }
      
      public function set layout(param1:LayoutBase) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.layout = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,LAYOUT_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.layout = param1;
         }
      }
      
      public function get typicalItem() : Object
      {
         return !!this.dataGroup ? this.dataGroup.typicalItem : this.dataGroupProperties.typicalItem;
      }
      
      public function set typicalItem(param1:Object) : void
      {
         if(this.dataGroup)
         {
            this.dataGroup.typicalItem = param1;
            this.dataGroupProperties = BitFlagUtil.update(this.dataGroupProperties as uint,TYPICAL_ITEM_PROPERTY_FLAG,true);
         }
         else
         {
            this.dataGroupProperties.typicalItem = param1;
         }
      }
      
      public function itemToLabel(param1:Object) : String
      {
         if(param1 !== null)
         {
            return param1.toString();
         }
         return " ";
      }
      
      public function updateRenderer(param1:IVisualElement, param2:int, param3:Object) : void
      {
         param1.owner = this;
         if(param1 is IItemRenderer)
         {
            IItemRenderer(param1).itemIndex = param2;
         }
         if(param1 is IItemRenderer)
         {
            IItemRenderer(param1).label = this.itemToLabel(param3);
         }
         if(param1 is IDataRenderer && param1 !== param3)
         {
            IDataRenderer(param1).data = param3;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:* = 0;
         super.partAdded(param1,param2);
         if(param2 == this.dataGroup)
         {
            _loc3_ = 0;
            if(this.dataGroupProperties.layout !== undefined)
            {
               this.dataGroup.layout = this.dataGroupProperties.layout;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,LAYOUT_PROPERTY_FLAG,true);
            }
            if(this.dataGroupProperties.autoLayout !== undefined)
            {
               this.dataGroup.autoLayout = this.dataGroupProperties.autoLayout;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,AUTO_LAYOUT_PROPERTY_FLAG,true);
            }
            if(this.dataGroupProperties.dataProvider !== undefined)
            {
               this.dataGroup.dataProvider = this.dataGroupProperties.dataProvider;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,DATA_PROVIDER_PROPERTY_FLAG,true);
            }
            if(this.dataGroupProperties.itemRenderer !== undefined)
            {
               this.dataGroup.itemRenderer = this.dataGroupProperties.itemRenderer;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,ITEM_RENDERER_PROPERTY_FLAG,true);
            }
            if(this.dataGroupProperties.itemRendererFunction !== undefined)
            {
               this.dataGroup.itemRendererFunction = this.dataGroupProperties.itemRendererFunction;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,ITEM_RENDERER_FUNCTION_PROPERTY_FLAG,true);
            }
            if(this.dataGroupProperties.typicalItem !== undefined)
            {
               this.dataGroup.typicalItem = this.dataGroupProperties.typicalItem;
               _loc3_ = BitFlagUtil.update(_loc3_ as uint,TYPICAL_ITEM_PROPERTY_FLAG,true);
            }
            this.dataGroupProperties = _loc3_;
            this.dataGroup.mx_internal::rendererUpdateDelegate = this;
            if(hasEventListener(RendererExistenceEvent.RENDERER_ADD))
            {
               this.dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            }
            if(hasEventListener(RendererExistenceEvent.RENDERER_REMOVE))
            {
               this.dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         super.partRemoved(param1,param2);
         if(param2 == this.dataGroup)
         {
            this.dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            this.dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            _loc3_ = {};
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,LAYOUT_PROPERTY_FLAG))
            {
               _loc3_.layout = this.dataGroup.layout;
            }
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,AUTO_LAYOUT_PROPERTY_FLAG))
            {
               _loc3_.autoLayout = this.dataGroup.autoLayout;
            }
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,DATA_PROVIDER_PROPERTY_FLAG))
            {
               _loc3_.dataProvider = this.dataGroup.dataProvider;
            }
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,ITEM_RENDERER_PROPERTY_FLAG))
            {
               _loc3_.itemRenderer = this.dataGroup.itemRenderer;
            }
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,ITEM_RENDERER_FUNCTION_PROPERTY_FLAG))
            {
               _loc3_.itemRendererFunction = this.dataGroup.itemRendererFunction;
            }
            if(BitFlagUtil.isSet(this.dataGroupProperties as uint,TYPICAL_ITEM_PROPERTY_FLAG))
            {
               _loc3_.typicalItem = this.dataGroup.typicalItem;
            }
            this.dataGroupProperties = _loc3_;
            this.dataGroup.dataProvider = null;
            this.dataGroup.layout = null;
            this.dataGroup.mx_internal::rendererUpdateDelegate = null;
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == RendererExistenceEvent.RENDERER_ADD && Boolean(this.dataGroup))
         {
            this.dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
         }
         if(param1 == RendererExistenceEvent.RENDERER_REMOVE && Boolean(this.dataGroup))
         {
            this.dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == RendererExistenceEvent.RENDERER_ADD && Boolean(this.dataGroup))
         {
            if(!hasEventListener(RendererExistenceEvent.RENDERER_ADD))
            {
               this.dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            }
         }
         if(param1 == RendererExistenceEvent.RENDERER_REMOVE && Boolean(this.dataGroup))
         {
            if(!hasEventListener(RendererExistenceEvent.RENDERER_REMOVE))
            {
               this.dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            }
         }
      }
      
      [SkinPart(required="false")]
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      [SkinPart(required="false")]
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
   }
}
