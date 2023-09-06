package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_473 implements ICommand
   {
      
      public static const ID:int = 16380;
       
      
      public var var_4076:Number = 0;
      
      public var var_2416:Vector.<class_577>;
      
      public function class_473(param1:Number = 0, param2:Vector.<class_577> = null)
      {
         super();
         this.var_4076 = param1;
         if(param2 == null)
         {
            this.var_2416 = new Vector.<class_577>();
         }
         else
         {
            this.var_2416 = param2;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 12;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         param1.readShort();
         this.var_4076 = param1.readDouble();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_2416.length > 0)
         {
            this.var_2416.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_577).read(param1);
            this.var_2416.push(_loc4_);
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
         param1.writeShort(6498);
         param1.writeDouble(this.var_4076);
         param1.writeInt(this.var_2416.length);
         for each(_loc2_ in this.var_2416)
         {
            _loc2_.write(param1);
         }
      }
   }
}
