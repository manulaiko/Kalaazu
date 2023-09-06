package spark.components.gridClasses
{
   import mx.core.IDataRenderer;
   import mx.core.IIMESupport;
   import mx.core.IVisualElement;
   import mx.managers.IFocusManagerComponent;
   import spark.components.DataGrid;
   
   public interface IGridItemEditor extends IDataRenderer, IVisualElement, IFocusManagerComponent, IIMESupport
   {
       
      
      function get dataGrid() : DataGrid;
      
      function get column() : GridColumn;
      
      function set column(param1:GridColumn) : void;
      
      function get columnIndex() : int;
      
      function get rowIndex() : int;
      
      function set rowIndex(param1:int) : void;
      
      function prepare() : void;
      
      function discard() : void;
      
      function save() : Boolean;
   }
}
