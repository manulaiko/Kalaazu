package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_602 implements ICommand
   {
      
      public static const ID:int = 24668;
       
      
      public var var_987:Vector.<int>;
      
      public function class_602(param1:Vector.<int> = null)
      {
         super();
         if(param1 == null)
         {
            this.var_987 = new Vector.<int>();
         }
         else
         {
            this.var_987 = param1;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_987.length > 0)
         {
            this.var_987.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) >>> 5 | _loc4_ << 27;
            this.var_987.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(11515);
         param1.writeInt(this.var_987.length);
         for each(_loc2_ in this.var_987)
         {
            param1.writeInt(_loc2_ << 5 | _loc2_ >>> 27);
         }
      }
   }
}
