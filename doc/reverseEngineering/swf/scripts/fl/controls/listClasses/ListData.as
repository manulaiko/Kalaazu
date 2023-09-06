package fl.controls.listClasses
{
   import fl.core.UIComponent;
   
   public class ListData
   {
       
      
      protected var _index:uint;
      
      protected var _owner:UIComponent;
      
      protected var _label:String;
      
      protected var _icon:Object = null;
      
      protected var _row:uint;
      
      protected var _column:uint;
      
      public function ListData(param1:String, param2:Object, param3:UIComponent, param4:uint, param5:uint, param6:uint = 0)
      {
         super();
         _label = param1;
         _icon = param2;
         _owner = param3;
         _index = param4;
         _row = param5;
         _column = param6;
      }
      
      public function get row() : uint
      {
         return _row;
      }
      
      public function get owner() : UIComponent
      {
         return _owner;
      }
      
      public function get label() : String
      {
         return _label;
      }
      
      public function get index() : uint
      {
         return _index;
      }
      
      public function get icon() : Object
      {
         return _icon;
      }
      
      public function get column() : uint
      {
         return _column;
      }
   }
}
