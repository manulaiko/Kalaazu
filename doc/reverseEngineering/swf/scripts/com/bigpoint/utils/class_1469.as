package com.bigpoint.utils
{
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_1469
   {
       
      
      public const changed:class_68 = new class_70();
      
      private var _right:String;
      
      private var _left:String;
      
      public function class_1469(param1:String = null, param2:String = null)
      {
         super();
         this._left = param1;
         this._right = param2;
      }
      
      public function get right() : String
      {
         return this._right;
      }
      
      public function set right(param1:String) : void
      {
         if(this._right != param1)
         {
            this._right = param1;
            this.changed.dispatch();
         }
      }
      
      public function get left() : String
      {
         return this._left;
      }
      
      public function set left(param1:String) : void
      {
         if(this._left != param1)
         {
            this._left = param1;
            this.changed.dispatch();
         }
      }
      
      public function toString() : String
      {
         return this._left + "" + this._right;
      }
   }
}
