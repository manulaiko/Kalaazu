package net.bigpoint.darkorbit.fui.components.core.data
{
   public class VectorCollection implements ICollection
   {
       
      
      private var _collection:Object;
      
      public function VectorCollection(param1:Object)
      {
         super();
         if(param1)
         {
            this._collection = param1;
         }
         else
         {
            this._collection = new Vector.<Object>();
         }
      }
      
      public function getItemAt(param1:uint) : Object
      {
         if(param1 >= 0 && param1 < this.length)
         {
            return this._collection[param1];
         }
         return null;
      }
      
      public function get length() : uint
      {
         return !!this._collection ? uint(this._collection.length) : 0;
      }
      
      public function set collection(param1:Object) : void
      {
         this._collection = !!param1 ? param1 : this._collection;
      }
   }
}
