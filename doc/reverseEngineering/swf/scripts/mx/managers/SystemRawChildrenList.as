package mx.managers
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import mx.core.IChildList;
   import mx.core.mx_internal;
   
   public class SystemRawChildrenList implements IChildList
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var owner:SystemManager;
      
      public function SystemRawChildrenList(param1:SystemManager)
      {
         super();
         this.owner = param1;
      }
      
      public function get numChildren() : int
      {
         return this.owner.mx_internal::$numChildren;
      }
      
      public function getChildAt(param1:int) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_getChildAt(param1);
      }
      
      public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_addChild(param1);
      }
      
      public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_addChildAt(param1,param2);
      }
      
      public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_removeChild(param1);
      }
      
      public function removeChildAt(param1:int) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_removeChildAt(param1);
      }
      
      public function getChildByName(param1:String) : DisplayObject
      {
         return this.owner.mx_internal::rawChildren_getChildByName(param1);
      }
      
      public function getChildIndex(param1:DisplayObject) : int
      {
         return this.owner.mx_internal::rawChildren_getChildIndex(param1);
      }
      
      public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         this.owner.mx_internal::rawChildren_setChildIndex(param1,param2);
      }
      
      public function getObjectsUnderPoint(param1:Point) : Array
      {
         return this.owner.mx_internal::rawChildren_getObjectsUnderPoint(param1);
      }
      
      public function contains(param1:DisplayObject) : Boolean
      {
         return this.owner.mx_internal::rawChildren_contains(param1);
      }
   }
}
