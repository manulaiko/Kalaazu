package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_876 implements ICommand
   {
      
      public static const ID:int = 1338;
       
      
      public var var_767:Vector.<class_610>;
      
      public var complete:Boolean = false;
      
      public function class_876(param1:Vector.<class_610> = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.var_767 = new Vector.<class_610>();
         }
         else
         {
            this.var_767 = param1;
         }
         this.complete = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         param1.readShort();
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_767.length > 0)
         {
            this.var_767.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_610).read(param1);
            this.var_767.push(_loc4_);
            _loc2_++;
         }
         this.complete = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeShort(4509);
         param1.writeShort(-7005);
         param1.writeInt(this.var_767.length);
         for each(_loc2_ in this.var_767)
         {
            _loc2_.write(param1);
         }
         param1.writeBoolean(this.complete);
      }
   }
}
