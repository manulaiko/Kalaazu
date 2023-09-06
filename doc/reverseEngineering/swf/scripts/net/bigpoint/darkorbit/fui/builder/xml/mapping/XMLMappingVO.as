package net.bigpoint.darkorbit.fui.builder.xml.mapping
{
   public class XMLMappingVO
   {
       
      
      private var _creationMethod:Function;
      
      private var _hasChildren:Boolean = false;
      
      private var _addToDisplayList:Boolean = true;
      
      public function XMLMappingVO(param1:Function, param2:Boolean = false, param3:Boolean = true)
      {
         super();
         this._creationMethod = param1;
         this._hasChildren = param2;
         this._addToDisplayList = param3;
      }
      
      public function get creationMethod() : Function
      {
         return this._creationMethod;
      }
      
      public function get addToDisplayList() : Boolean
      {
         return this._addToDisplayList;
      }
      
      public function get hasChildren() : Boolean
      {
         return this._hasChildren;
      }
      
      public function clone() : XMLMappingVO
      {
         return new XMLMappingVO(this._creationMethod,this._hasChildren,this._addToDisplayList);
      }
   }
}
