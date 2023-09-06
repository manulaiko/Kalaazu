package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_536 implements ICommand
   {
      
      public static const ID:int = 5772;
       
      
      public var link:String = "";
      
      public var key:String = "";
      
      public var var_2700:int = 0;
      
      public var closeable:Boolean = false;
      
      public var alignment:class_516;
      
      public var var_360:Vector.<String>;
      
      public var var_2205:Boolean = false;
      
      public var name_73:Number = 0;
      
      public function class_536(param1:Number = 0, param2:String = "", param3:String = "", param4:Vector.<String> = null, param5:int = 0, param6:class_516 = null, param7:Boolean = false, param8:Boolean = false)
      {
         super();
         this.name_73 = param1;
         this.key = param2;
         this.link = param3;
         if(param4 == null)
         {
            this.var_360 = new Vector.<String>();
         }
         else
         {
            this.var_360 = param4;
         }
         this.var_2700 = param5;
         if(param6 == null)
         {
            this.alignment = new class_516();
         }
         else
         {
            this.alignment = param6;
         }
         this.closeable = param7;
         this.var_2205 = param8;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 22;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.link = param1.readUTF();
         this.key = param1.readUTF();
         this.var_2700 = param1.readInt();
         this.var_2700 = Number(this.var_2700) >>> 6 | Number(this.var_2700) << 26;
         this.closeable = param1.readBoolean();
         this.alignment = class_127.getInstance().createInstance(param1.readShort()) as class_516;
         this.alignment.read(param1);
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_360.length > 0)
         {
            this.var_360.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1.readUTF();
            this.var_360.push(_loc4_);
            _loc2_++;
         }
         this.var_2205 = param1.readBoolean();
         this.name_73 = param1.readDouble();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeUTF(this.link);
         param1.writeUTF(this.key);
         param1.writeInt(Number(this.var_2700) << 6 | Number(this.var_2700) >>> 26);
         param1.writeBoolean(this.closeable);
         this.alignment.write(param1);
         param1.writeInt(this.var_360.length);
         for each(_loc2_ in this.var_360)
         {
            param1.writeUTF(_loc2_);
         }
         param1.writeBoolean(this.var_2205);
         param1.writeDouble(this.name_73);
      }
   }
}
