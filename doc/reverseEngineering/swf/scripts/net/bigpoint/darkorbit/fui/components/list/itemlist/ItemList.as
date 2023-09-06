package net.bigpoint.darkorbit.fui.components.list.itemlist
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.core.data.ICollection;
   import net.bigpoint.darkorbit.fui.components.core.interfaces.IDraggable;
   import net.bigpoint.darkorbit.fui.components.core.interfaces.IDropable;
   import net.bigpoint.darkorbit.fui.components.core.layout.ILayout;
   import net.bigpoint.darkorbit.fui.components.list.IItemDataAssigner;
   import net.bigpoint.darkorbit.fui.components.list.IList;
   import net.bigpoint.darkorbit.fui.components.list.layouts.AbstractItemListLayout;
   import net.bigpoint.darkorbit.fui.components.list.layouts.VerticalItemListLayout;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
   import net.bigpoint.darkorbit.fui.system.utils.DisplayObjectPool;
   
   public class ItemList extends Container implements IList, IDropable, IDraggable
   {
      
      protected static const ITEM_CONTAINER:String = "itemsContainer";
      
      protected static const UNSELECTED_INDEX:int = -1;
       
      
      protected var _itemList:ICollection;
      
      protected var _itemsLayout:AbstractItemListLayout;
      
      protected var _itemRendererTemplate:XML;
      
      protected var _itemDataAssigner:Class;
      
      protected var _itemsContainer:Container;
      
      protected var _objectPool:DisplayObjectPool;
      
      protected var _selectedIndex:int = -1;
      
      protected var _scrollPosition:Number = 0;
      
      protected var _scrollMouseSpeed:Number = 50;
      
      protected var _selectedItem:IItemDataAssigner;
      
      public function ItemList()
      {
         this._itemRendererTemplate = DefaultItemDataAssigner.DEFAULT_ITEMRENDERER_TEMPLATE;
         this._itemDataAssigner = DefaultItemDataAssigner;
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         _alignment = new ItemListAlignment(this);
         this._objectPool = new DisplayObjectPool();
         this._itemsContainer = new Container();
         this._itemsContainer.name = ITEM_CONTAINER;
         this.addChild(this._itemsContainer);
         _minWidth = 40;
         _minHeight = 40;
         this._itemsLayout = new VerticalItemListLayout(this,this._itemsContainer);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheelEvent);
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(isInvalidate(InvalidationType.FILLITEMS) && this._itemList != null)
         {
            this.fillItems();
         }
      }
      
      override protected function drawSize() : void
      {
         super.drawSize();
         var _loc1_:Number = getCalculatedWidth();
         var _loc2_:Number = this.getCalculatedHeight();
         this._itemsContainer.setSize(_loc1_,_loc2_);
         invalidate(InvalidationType.LAYOUT);
      }
      
      override protected function drawLayout() : void
      {
         if(this._itemList == null)
         {
            return;
         }
         this.createItems();
         this._itemsLayout.execute();
         this.fillItems();
         validate(InvalidationType.LAYOUT);
         validate(InvalidationType.FILLITEMS);
         var _loc1_:ScrollEvent = new ScrollEvent(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED);
         _loc1_.contentSize = this._itemsLayout.sigmaItemSize * this._itemList.length;
         _loc1_.viewSize = this.getCalculatedHeight();
         dispatchEvent(_loc1_);
      }
      
      protected function createItems() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc1_:uint = this._itemsLayout.getVisibleItemsCount();
         var _loc2_:int = _loc1_ - this._itemsContainer.numChildren;
         if(_loc2_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = this.getPoolItem();
               this._itemsContainer.addChild(_loc3_);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = Math.abs(_loc2_);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               this.removePoolItem();
               _loc6_++;
            }
            this._itemsContainer.forceRedraw(InvalidationType.LAYOUT);
         }
      }
      
      protected function getPoolItem() : Coreponent
      {
         var _loc1_:* = null;
         if(this._objectPool.isEmpty())
         {
            _loc1_ = this.createItemAndPutIntoPool();
         }
         _loc1_ = this._objectPool.getObject() as Coreponent;
         _loc1_.invalidate(InvalidationType.SIZE);
         _loc1_.invalidate(InvalidationType.POSITION);
         this.addItemEventListeners(_loc1_);
         return _loc1_;
      }
      
      protected function createItemAndPutIntoPool() : Coreponent
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._itemRendererTemplate)
         {
            _loc1_ = new this._itemDataAssigner() as Coreponent;
            _loc2_ = _loc1_ as DisplayObjectContainer;
            UISystem.getInstance().build(this._itemRendererTemplate,_loc2_,true);
            this._objectPool.putObject(_loc1_);
            return _loc1_;
         }
         return null;
      }
      
      public function get itemHeight() : Number
      {
         var _loc1_:DisplayObject = this._objectPool.getObject() || this.createItemAndPutIntoPool();
         var _loc2_:Number = _loc1_.height;
         var _loc3_:Coreponent = _loc1_ as Coreponent;
         if(_loc3_)
         {
            _loc2_ = _loc2_ + _loc3_.marginTop + _loc3_.marginBottom;
         }
         this._objectPool.putObject(_loc1_);
         return _loc2_;
      }
      
      public function get itemWidth() : Number
      {
         var _loc1_:DisplayObject = this._objectPool.getObject() || this.createItemAndPutIntoPool();
         var _loc2_:Number = _loc1_.width;
         this._objectPool.putObject(_loc1_);
         return _loc2_;
      }
      
      protected function removePoolItem() : void
      {
         var _loc1_:DisplayObject = this._itemsContainer.removeChildAt(0);
         this.removeItemEventListeners(_loc1_);
         this._objectPool.putObject(_loc1_);
      }
      
      protected function fillItems() : void
      {
         var _loc1_:* = null;
         var _loc7_:* = 0;
         var _loc2_:uint = this._itemsContainer.numChildren;
         var _loc3_:int = this._itemList.length + 1;
         var _loc4_:Number;
         var _loc5_:int = (_loc4_ = Math.max(0,_loc3_ - this._itemsLayout.pageSize)) * this._scrollPosition;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            _loc1_ = this._itemsContainer.getChildAt(_loc6_) as IItemDataAssigner;
            if((_loc7_ = _loc5_ + _loc6_) < _loc3_)
            {
               _loc1_.data = this._itemList.getItemAt(_loc7_);
               _loc1_.index = _loc7_;
            }
            else
            {
               _loc1_.data = null;
               _loc1_.index = -1;
            }
            if(_loc7_ == this._selectedIndex)
            {
               _loc1_.selected = true;
            }
            else
            {
               _loc1_.selected = false;
            }
            _loc6_++;
         }
      }
      
      protected function removeAllVisibleItems() : void
      {
         while(this._itemsContainer.numChildren > 0)
         {
            this.removeItem();
         }
      }
      
      protected function removeItem() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         _loc1_ = this._itemsContainer.getChildAt(0) as Sprite;
         this.removeItemEventListeners(_loc1_);
         _loc2_ = _loc1_ as IItemDataAssigner;
         _loc2_.dispose();
      }
      
      protected function addItemEventListeners(param1:DisplayObject) : void
      {
         param1.addEventListener(MouseEvent.CLICK,this.handleItemClickEvent);
      }
      
      protected function removeItemEventListeners(param1:DisplayObject) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.handleItemClickEvent);
      }
      
      override public function dispose() : void
      {
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheelEvent);
         this._objectPool.dispose();
         this._itemsLayout.dispose();
         this.removeAllVisibleItems();
         super.dispose();
         this._itemList = null;
      }
      
      protected function handleMouseWheelEvent(param1:MouseEvent) : void
      {
      }
      
      protected function handleItemClickEvent(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         _loc2_ = param1.currentTarget as IItemDataAssigner;
         var _loc3_:ItemListEvent = new ItemListEvent(ItemListEvent.CLICKED);
         _loc3_.vo = _loc2_.data;
         dispatchEvent(_loc3_);
         if(this._selectedItem == _loc2_)
         {
            return;
         }
         this._selectedItem = _loc2_;
         this._selectedIndex = this.selectedIndex;
         var _loc4_:uint = this._itemsContainer.numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            (_loc5_ = this._itemsContainer.getChildAt(_loc6_) as IItemDataAssigner).unselect();
            _loc6_++;
         }
         if(_loc2_)
         {
            _loc2_.select();
         }
         var _loc7_:ItemListEvent;
         (_loc7_ = new ItemListEvent(ItemListEvent.SELECTION_CHANGED)).vo = _loc2_.data;
         dispatchEvent(_loc7_);
      }
      
      public function set list(param1:ICollection) : void
      {
         if(param1 == this._itemList || param1 == null)
         {
         }
         this._selectedIndex = UNSELECTED_INDEX;
         this._itemList = param1;
         invalidate(InvalidationType.LAYOUT);
      }
      
      public function get list() : ICollection
      {
         return this._itemList;
      }
      
      public function setScrollPositionInPercent(param1:Number) : void
      {
         if(param1 >= 0 && param1 <= 1)
         {
            this._scrollPosition = param1;
            forceRedraw(InvalidationType.FILLITEMS);
         }
      }
      
      public function getScrollPositionInPercent() : Number
      {
         return this._scrollPosition;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var _loc2_:Number = this._itemList.length;
         if(param1 >= 0 && param1 < _loc2_)
         {
            this._selectedIndex = param1;
         }
         else
         {
            this._selectedIndex = UNSELECTED_INDEX;
         }
         dispatchEvent(new Event(Event.SELECT));
      }
      
      public function get selectedIndex() : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._itemList == null || this._selectedItem == null)
         {
            return this._selectedIndex = UNSELECTED_INDEX;
         }
         var _loc1_:uint = this._itemList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._itemList.getItemAt(_loc2_);
            _loc4_ = this._selectedItem.data;
            if(_loc3_ == _loc4_)
            {
               this._selectedIndex = _loc2_;
               return this._selectedIndex;
            }
            _loc2_++;
         }
         return UNSELECTED_INDEX;
      }
      
      public function get selectedItem() : IItemDataAssigner
      {
         return this._selectedItem;
      }
      
      public function set scrollMouseSpeed(param1:Number) : void
      {
         param1 = param1 <= 0 ? 0 : (param1 >= 1000 ? 1000 : param1);
         this._scrollMouseSpeed = param1;
      }
      
      public function get scrollMouseSpeed() : Number
      {
         return this._scrollMouseSpeed;
      }
      
      public function set itemRendererTemplate(param1:XML) : void
      {
         this._itemRendererTemplate = param1;
      }
      
      public function set itemDataAssigner(param1:Class) : void
      {
         this._itemDataAssigner = param1;
         var _loc2_:Coreponent = this.getPoolItem();
         if(_loc2_)
         {
            this._itemsLayout.assignItemSize(_loc2_);
         }
      }
      
      public function set itemGap(param1:uint) : void
      {
         this._itemsLayout.gap = param1;
         invalidate(InvalidationType.LAYOUT);
      }
      
      public function get itemGap() : uint
      {
         return this._itemsLayout.gap;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         super.setSize(param1,param2);
      }
      
      override public function set layout(param1:ILayout) : void
      {
         var _loc2_:* = 0;
         if(this._itemsLayout)
         {
            this._itemsLayout.dispose();
            _loc2_ = this._itemsLayout.gap;
         }
         this._itemsLayout = param1 as AbstractItemListLayout;
         this._itemsLayout.itemListComponent = this;
         this._itemsLayout.itemsContainer = this._itemsContainer;
         this._itemsLayout.gap = _loc2_;
         if(this._itemDataAssigner)
         {
            this.itemDataAssigner = this._itemDataAssigner;
         }
      }
      
      override public function getCalculatedHeight() : Number
      {
         return super.getCalculatedHeight();
      }
      
      public function get itemsContainer() : Container
      {
         return this._itemsContainer;
      }
   }
}
