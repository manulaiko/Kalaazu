package package_431
{
   import away3d.arcane;
   import flash.geom.*;
   
   public class class_2435 extends class_2405
   {
       
      
      protected var var_3323:Boolean = true;
      
      protected var _totalDuration:uint = 0;
      
      protected var var_4034:uint;
      
      protected var var_3419:Boolean = true;
      
      protected var var_2631:Boolean = false;
      
      protected var var_2973:uint = 0;
      
      protected var var_625:Vector.<uint>;
      
      public function class_2435()
      {
         this.var_625 = new Vector.<uint>();
         super();
      }
      
      public function get method_3310() : Boolean
      {
         return this.var_3323;
      }
      
      public function set method_3310(param1:Boolean) : void
      {
         if(this.var_3323 == param1)
         {
            return;
         }
         this.var_3323 = param1;
         this.var_3419 = true;
      }
      
      public function get method_6520() : Boolean
      {
         return this.var_2631;
      }
      
      public function set method_6520(param1:Boolean) : void
      {
         if(this.var_2631 == param1)
         {
            return;
         }
         this.var_2631 = param1;
         this.var_3419 = true;
      }
      
      public function get totalDuration() : uint
      {
         if(this.var_3419)
         {
            this.method_109();
         }
         return this._totalDuration;
      }
      
      public function get lastFrame() : uint
      {
         if(this.var_3419)
         {
            this.method_109();
         }
         return this.var_4034;
      }
      
      public function get method_1948() : Vector.<uint>
      {
         return this.var_625;
      }
      
      protected function method_109() : void
      {
         this.var_3419 = false;
         this.var_4034 = Boolean(this.var_3323) && Boolean(this.var_2631) ? uint(this.var_2973) : this.var_2973 - 1;
         this._totalDuration = 0;
      }
   }
}
