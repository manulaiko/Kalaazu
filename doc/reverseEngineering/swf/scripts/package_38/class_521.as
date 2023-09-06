package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_521 implements ICommand
   {
      
      public static const ID:int = 32358;
       
      
      public var duration:int = 0;
      
      public var var_2772:int = 0;
      
      public var var_2934:Boolean = false;
      
      public function class_521(param1:Boolean = false, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_2934 = param1;
         this.var_2772 = param2;
         this.duration = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 9;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.duration = param1.readInt();
         this.duration = Number(this.duration) >>> 11 | Number(this.duration) << 21;
         this.var_2772 = param1.readInt();
         this.var_2772 = Number(this.var_2772) << 11 | Number(this.var_2772) >>> 21;
         this.var_2934 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.duration) << 11 | Number(this.duration) >>> 21);
         param1.writeInt(Number(this.var_2772) >>> 11 | Number(this.var_2772) << 21);
         param1.writeBoolean(this.var_2934);
      }
   }
}
