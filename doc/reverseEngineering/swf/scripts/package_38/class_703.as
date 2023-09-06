package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_703 implements ICommand
   {
      
      public static const ID:int = 14575;
       
      
      public var var_2241:int = 0;
      
      public var updates:Vector.<class_432>;
      
      public function class_703(param1:int = 0, param2:Vector.<class_432> = null)
      {
         super();
         this.var_2241 = param1;
         if(param2 == null)
         {
            this.updates = new Vector.<class_432>();
         }
         else
         {
            this.updates = param2;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         param1.readShort();
         this.var_2241 = param1.readInt();
         this.var_2241 = Number(this.var_2241) << 15 | Number(this.var_2241) >>> 17;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.updates.length > 0)
         {
            this.updates.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_432).read(param1);
            this.updates.push(_loc4_);
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
         var _loc2_:* = null;
         param1.writeShort(-24867);
         param1.writeInt(Number(this.var_2241) >>> 15 | Number(this.var_2241) << 17);
         param1.writeInt(this.updates.length);
         for each(_loc2_ in this.updates)
         {
            _loc2_.write(param1);
         }
      }
   }
}
