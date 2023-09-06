package mx.core
{
   import mx.collections.IList;
   
   public interface ISelectableList extends IList
   {
       
      
      function set selectedIndex(param1:int) : void;
      
      function get selectedIndex() : int;
   }
}
