package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_359 implements ICommand
   {
      
      public static const ID:int = 11751;
       
      
      public var var_4257:Vector.<class_360>;
      
      public var baseKey:String = "";
      
      public var var_4872:class_117;
      
      public function class_359(param1:String = "", param2:class_117 = null, param3:Vector.<class_360> = null)
      {
         super();
         this.baseKey = param1;
         if(param2 == null)
         {
            this.var_4872 = new class_117();
         }
         else
         {
            this.var_4872 = param2;
         }
         if(param3 == null)
         {
            this.var_4257 = new Vector.<class_360>();
         }
         else
         {
            this.var_4257 = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 6;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         param1.readShort();
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_4257.length > 0)
         {
            this.var_4257.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_360).read(param1);
            this.var_4257.push(_loc4_);
            _loc2_++;
         }
         this.baseKey = param1.readUTF();
         this.var_4872 = class_127.getInstance().createInstance(param1.readShort()) as class_117;
         this.var_4872.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeShort(-27064);
         param1.writeShort(-14597);
         param1.writeInt(this.var_4257.length);
         for each(_loc2_ in this.var_4257)
         {
            _loc2_.write(param1);
         }
         param1.writeUTF(this.baseKey);
         this.var_4872.write(param1);
      }
   }
}
