package package_321
{
   import package_320.class_2517;
   
   public class class_2269
   {
       
      
      private var var_2989:Number = 0;
      
      private var var_2840:Number = 0;
      
      private var var_1899:class_2270;
      
      private var var_113:class_2270;
      
      private var var_123:class_2270;
      
      private var _list:Vector.<class_2270>;
      
      public function class_2269()
      {
         this.var_1899 = new class_2270(class_2517.MMO,0,0,true);
         this.var_113 = new class_2270(class_2517.EIC,0,0,false);
         this.var_123 = new class_2270(class_2517.VRU,0,0,false);
         this._list = new <class_2270>[this.var_1899,this.var_113,this.var_123];
         super();
      }
      
      public function set playerScore(param1:Number) : void
      {
         this.var_2989 = param1;
      }
      
      public function get playerScore() : Number
      {
         return this.var_2989;
      }
      
      public function set name_107(param1:Number) : void
      {
         this.var_1899.score = param1;
         this.method_1293();
         this.method_4048();
      }
      
      private function method_4048() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._list)
         {
            _loc1_.method_261 = _loc1_.score == this.var_2840;
         }
      }
      
      private function method_1293() : void
      {
         var _loc1_:* = null;
         this.var_2840 = Math.max(this.var_1899.score,this.var_113.score,this.var_123.score);
         for each(_loc1_ in this._list)
         {
            _loc1_.name_48 = this.var_2840;
         }
      }
      
      public function set name_139(param1:Number) : void
      {
         this.var_113.score = param1;
         this.method_1293();
         this.method_4048();
      }
      
      public function set name_27(param1:Number) : void
      {
         this.var_123.score = param1;
         this.method_1293();
         this.method_4048();
      }
      
      public function get name_48() : Number
      {
         return this.var_2840;
      }
      
      public function get list() : Vector.<class_2270>
      {
         return this._list;
      }
   }
}
