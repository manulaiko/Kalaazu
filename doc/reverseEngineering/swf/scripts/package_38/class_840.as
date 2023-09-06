package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_840 implements ICommand
   {
      
      public static const ID:int = 12315;
       
      
      public var fps:int = 0;
      
      public var version:String = "";
      
      public var var_1271:Vector.<int>;
      
      public var var_3138:int = 0;
      
      public function class_840(param1:String = "", param2:int = 0, param3:int = 0, param4:Vector.<int> = null)
      {
         super();
         this.version = param1;
         this.fps = param2;
         this.var_3138 = param3;
         if(param4 == null)
         {
            this.var_1271 = new Vector.<int>();
         }
         else
         {
            this.var_1271 = param4;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 14;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         this.fps = param1.readInt();
         this.fps = Number(this.fps) >>> 5 | Number(this.fps) << 27;
         this.version = param1.readUTF();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_1271.length > 0)
         {
            this.var_1271.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) >>> 16 | _loc4_ << 16;
            this.var_1271.push(_loc4_);
            _loc2_++;
         }
         this.var_3138 = param1.readInt();
         this.var_3138 = Number(this.var_3138) >>> 12 | Number(this.var_3138) << 20;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeInt(Number(this.fps) << 5 | Number(this.fps) >>> 27);
         param1.writeUTF(this.version);
         param1.writeInt(this.var_1271.length);
         for each(_loc2_ in this.var_1271)
         {
            param1.writeInt(_loc2_ << 16 | _loc2_ >>> 16);
         }
         param1.writeInt(Number(this.var_3138) << 12 | Number(this.var_3138) >>> 20);
      }
   }
}
