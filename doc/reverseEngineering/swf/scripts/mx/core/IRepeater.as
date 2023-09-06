package mx.core
{
   public interface IRepeater
   {
       
      
      function get container() : IContainer;
      
      function get count() : int;
      
      function set count(param1:int) : void;
      
      function get currentIndex() : int;
      
      function get currentItem() : Object;
      
      function get dataProvider() : Object;
      
      function set dataProvider(param1:Object) : void;
      
      function get recycleChildren() : Boolean;
      
      function set recycleChildren(param1:Boolean) : void;
      
      function get startingIndex() : int;
      
      function set startingIndex(param1:int) : void;
      
      function initializeRepeater(param1:IContainer, param2:Boolean) : void;
      
      function executeChildBindings() : void;
   }
}
