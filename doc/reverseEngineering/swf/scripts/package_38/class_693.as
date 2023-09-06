package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_693 implements ICommand
   {
      
      public static const ID:int = 23769;
       
      
      public var var_3133:String = "";
      
      public var var_2408:String = "";
      
      public var var_2377:String = "";
      
      public function class_693(param1:String = "", param2:String = "", param3:String = "")
      {
         super();
         this.var_2377 = param1;
         this.var_2408 = param2;
         this.var_3133 = param3;
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
         this.var_3133 = param1.readUTF();
         this.var_2408 = param1.readUTF();
         param1.readShort();
         this.var_2377 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.var_3133);
         param1.writeUTF(this.var_2408);
         param1.writeShort(29941);
         param1.writeUTF(this.var_2377);
      }
   }
}
