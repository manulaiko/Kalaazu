package package_448
{
   public class class_2505
   {
       
      
      private var _repeat:Boolean = false;
      
      private var _playlist:Vector.<class_2507>;
      
      public function class_2505(param1:Vector.<class_2507>, param2:Boolean)
      {
         this._playlist = new Vector.<class_2507>();
         super();
         this._playlist = param1;
         this._repeat = param2;
      }
      
      public function get repeat() : Boolean
      {
         return this._repeat;
      }
      
      public function get playlist() : Vector.<class_2507>
      {
         return this._playlist;
      }
   }
}
