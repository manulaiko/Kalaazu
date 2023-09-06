package org.osmf.net.httpstreaming.f4f
{
   class GlobalRandomAccessEntry
   {
       
      
      private var _time:Number;
      
      private var _segment:uint;
      
      private var _fragment:uint;
      
      private var _afraOffset:Number;
      
      private var _offsetFromAfra:Number;
      
      function GlobalRandomAccessEntry()
      {
         super();
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      public function set time(param1:Number) : void
      {
         this._time = param1;
      }
      
      public function get segment() : uint
      {
         return this._segment;
      }
      
      public function set segment(param1:uint) : void
      {
         this._segment = param1;
      }
      
      public function get fragment() : uint
      {
         return this._fragment;
      }
      
      public function set fragment(param1:uint) : void
      {
         this._fragment = param1;
      }
      
      public function get afraOffset() : Number
      {
         return this._afraOffset;
      }
      
      public function set afraOffset(param1:Number) : void
      {
         this._afraOffset = param1;
      }
      
      public function get offsetFromAfra() : Number
      {
         return this._offsetFromAfra;
      }
      
      public function set offsetFromAfra(param1:Number) : void
      {
         this._offsetFromAfra = param1;
      }
   }
}
