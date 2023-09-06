package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_942 implements ICommand
   {
      
      public static const ID:int = 667;
       
      
      public var major:int = 0;
      
      public var minor:int = 0;
      
      public var build:int = 0;
      
      public var var_4956:Boolean = false;
      
      public function class_942(param1:int = 0, param2:int = 74, param3:int = 7, param4:Boolean = false)
      {
         super();
         this.major = param1;
         this.minor = param2;
         this.build = param3;
         this.var_4956 = param4;
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
         this.major = param1.readInt();
         this.minor = param1.readInt();
         this.build = param1.readInt();
         this.var_4956 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(this.major);
         param1.writeInt(this.minor);
         param1.writeInt(this.build);
         param1.writeBoolean(this.var_4956);
      }
   }
}
