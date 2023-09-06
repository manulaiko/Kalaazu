package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_828 implements ICommand
   {
      
      public static const ID:int = 31946;
       
      
      public var videoId:int = 0;
      
      public var var_1533:class_516;
      
      public var windowId:int = 0;
      
      public var var_1164:Vector.<String>;
      
      public var showButtons:Boolean = false;
      
      public function class_828(param1:class_516 = null, param2:int = 0, param3:int = 0, param4:Boolean = false, param5:Vector.<String> = null)
      {
         super();
         if(param1 == null)
         {
            this.var_1533 = new class_516();
         }
         else
         {
            this.var_1533 = param1;
         }
         this.windowId = param2;
         this.videoId = param3;
         this.showButtons = param4;
         if(param5 == null)
         {
            this.var_1164 = new Vector.<String>();
         }
         else
         {
            this.var_1164 = param5;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.videoId = param1.readInt();
         this.videoId = Number(this.videoId) << 6 | Number(this.videoId) >>> 26;
         this.var_1533 = class_127.getInstance().createInstance(param1.readShort()) as class_516;
         this.var_1533.read(param1);
         this.windowId = param1.readInt();
         this.windowId = Number(this.windowId) << 5 | Number(this.windowId) >>> 27;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_1164.length > 0)
         {
            this.var_1164.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1.readUTF();
            this.var_1164.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         this.showButtons = param1.readBoolean();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeInt(Number(this.videoId) >>> 6 | Number(this.videoId) << 26);
         this.var_1533.write(param1);
         param1.writeInt(Number(this.windowId) >>> 5 | Number(this.windowId) << 27);
         param1.writeInt(this.var_1164.length);
         for each(_loc2_ in this.var_1164)
         {
            param1.writeUTF(_loc2_);
         }
         param1.writeShort(2031);
         param1.writeBoolean(this.showButtons);
         param1.writeShort(24252);
      }
   }
}
