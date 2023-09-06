package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_781 implements ICommand
   {
      
      public static const ID:int = 6195;
       
      
      public var var_2427:class_429;
      
      public var var_1197:Vector.<class_441>;
      
      public var value:Number = 0;
      
      public function class_781(param1:class_429 = null, param2:Number = 0, param3:Vector.<class_441> = null)
      {
         super();
         if(param1 == null)
         {
            this.var_2427 = new class_429();
         }
         else
         {
            this.var_2427 = param1;
         }
         this.value = param2;
         if(param3 == null)
         {
            this.var_1197 = new Vector.<class_441>();
         }
         else
         {
            this.var_1197 = param3;
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
         this.var_2427 = class_127.getInstance().createInstance(param1.readShort()) as class_429;
         this.var_2427.read(param1);
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_1197.length > 0)
         {
            this.var_1197.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_441).read(param1);
            this.var_1197.push(_loc4_);
            _loc2_++;
         }
         this.value = param1.readFloat();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         this.var_2427.write(param1);
         param1.writeInt(this.var_1197.length);
         for each(_loc2_ in this.var_1197)
         {
            _loc2_.write(param1);
         }
         param1.writeFloat(this.value);
      }
   }
}
