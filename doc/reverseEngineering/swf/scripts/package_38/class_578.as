package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_578 implements ICommand
   {
      
      public static const ID:int = 30741;
       
      
      public var visible:Boolean = false;
      
      public var var_3106:String = "";
      
      public var slotBarId:String = "";
      
      public var var_268:Vector.<class_671>;
      
      public var var_776:String = "";
      
      public function class_578(param1:String = "", param2:Vector.<class_671> = null, param3:String = "", param4:String = "", param5:Boolean = false)
      {
         super();
         this.slotBarId = param1;
         if(param2 == null)
         {
            this.var_268 = new Vector.<class_671>();
         }
         else
         {
            this.var_268 = param2;
         }
         this.var_3106 = param3;
         this.var_776 = param4;
         this.visible = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 11;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.visible = param1.readBoolean();
         this.var_3106 = param1.readUTF();
         param1.readShort();
         this.slotBarId = param1.readUTF();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_268.length > 0)
         {
            this.var_268.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_671).read(param1);
            this.var_268.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         this.var_776 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeBoolean(this.visible);
         param1.writeUTF(this.var_3106);
         param1.writeShort(-18790);
         param1.writeUTF(this.slotBarId);
         param1.writeInt(this.var_268.length);
         for each(_loc2_ in this.var_268)
         {
            _loc2_.write(param1);
         }
         param1.writeShort(-4919);
         param1.writeUTF(this.var_776);
      }
   }
}
