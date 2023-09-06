package package_30
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.gui.windows.class_1691;
   
   public class class_1192 extends class_179
   {
       
      
      private var rows:Array;
      
      public var var_997:int;
      
      private var var_1826:Array;
      
      public function class_1192(param1:class_58, param2:int)
      {
         this.rows = [];
         this.var_1826 = [];
         super(const_2900,param1,param2);
         this.var_1826[1] = [1,2,3,2,1,3,3,1,2];
         this.var_1826[2] = [1,2,3,2,1,3,3,2,1];
         this.var_1826[3] = [1,3,2,2,3,1,3,1,2];
      }
      
      public function method_5781(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:class_1691;
         if((_loc4_ = this.method_5776(param1)) == null)
         {
            _loc4_ = new class_1691(this,param1,param2);
            this.rows.push(_loc4_);
            this.method_5044();
         }
         _loc4_.update(param3);
      }
      
      private function method_5044() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = this.var_1826[String(class_81.factionID)];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = int(_loc1_[_loc2_]);
            if(_loc3_ == name_13)
            {
               if((_loc4_ = this.method_2649(_loc1_[_loc2_ + 1])) != null)
               {
                  _loc4_.y = 11;
                  if(name_13 != class_81.factionID)
                  {
                     _loc4_.method_848();
                  }
               }
               if((_loc5_ = this.method_2649(_loc1_[_loc2_ + 2])) != null)
               {
                  _loc5_.y = 22;
               }
            }
            _loc2_ += 3;
         }
      }
      
      private function method_5776(param1:int) : class_1691
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.rows.length)
         {
            _loc3_ = this.rows[_loc2_];
            if(param1 == _loc3_.getID())
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function method_2649(param1:int) : class_1691
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.rows.length)
         {
            _loc3_ = this.rows[_loc2_];
            if(param1 == _loc3_.name_13)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function get order() : int
      {
         return this.var_997;
      }
      
      public function set order(param1:int) : void
      {
         this.var_997 = param1;
      }
   }
}
