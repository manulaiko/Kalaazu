package net.bigpoint.darkorbit.fui.components.list.itemlist
{
   import flash.events.Event;
   
   public class ItemListEvent extends Event
   {
      
      private static const NAME:String = "ItemListEvent.";
      
      public static const CLICKED:String = NAME + "clicked";
      
      public static const SELECTION_CHANGED:String = NAME + "selectionChanged";
       
      
      private var _vo:Object;
      
      public function ItemListEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get vo() : Object
      {
         return this._vo;
      }
      
      public function set vo(param1:Object) : void
      {
         this._vo = param1;
      }
   }
}
