package package_377
{
   public class class_2475
   {
       
      
      private var var_196:Vector.<class_2150>;
      
      private var _index:int;
      
      private var var_157:int;
      
      public function class_2475()
      {
         super();
         this.var_196 = new Vector.<class_2150>();
      }
      
      public function getItem() : class_2150
      {
         var _loc1_:* = null;
         if(this._index == this.var_157)
         {
            _loc1_ = new class_2150();
            var _loc2_:* = this._index++;
            this.var_196[_loc2_] = _loc1_;
            ++this.var_157;
         }
         else
         {
            _loc1_ = this.var_196[this._index++];
         }
         return _loc1_;
      }
      
      public function method_3017() : void
      {
         this._index = 0;
      }
      
      public function dispose() : void
      {
         this.var_196.length = 0;
      }
   }
}
