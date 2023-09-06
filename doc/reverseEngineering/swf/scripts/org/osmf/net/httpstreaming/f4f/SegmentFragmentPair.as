package org.osmf.net.httpstreaming.f4f
{
   class SegmentFragmentPair
   {
       
      
      private var _firstSegment:uint;
      
      private var _fragmentsPerSegment:uint;
      
      private var _fragmentsAccrued:uint;
      
      function SegmentFragmentPair(param1:uint, param2:uint)
      {
         super();
         this._firstSegment = param1;
         this._fragmentsPerSegment = param2;
      }
      
      public function get firstSegment() : uint
      {
         return this._firstSegment;
      }
      
      public function get fragmentsPerSegment() : uint
      {
         return this._fragmentsPerSegment;
      }
      
      public function set fragmentsAccrued(param1:uint) : void
      {
         this._fragmentsAccrued = param1;
      }
      
      public function get fragmentsAccrued() : uint
      {
         return this._fragmentsAccrued;
      }
   }
}
