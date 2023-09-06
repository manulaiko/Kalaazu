package mx.collections
{
   public interface ISortField
   {
       
      
      function get arraySortOnOptions() : int;
      
      function get compareFunction() : Function;
      
      function set compareFunction(param1:Function) : void;
      
      function get descending() : Boolean;
      
      function set descending(param1:Boolean) : void;
      
      function get name() : String;
      
      function set name(param1:String) : void;
      
      function get numeric() : Object;
      
      function set numeric(param1:Object) : void;
      
      function get usingCustomCompareFunction() : Boolean;
      
      function initializeDefaultCompareFunction(param1:Object) : void;
      
      function reverse() : void;
   }
}
