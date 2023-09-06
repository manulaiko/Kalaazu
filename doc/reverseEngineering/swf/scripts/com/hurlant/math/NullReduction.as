package com.hurlant.math
{
   public class NullReduction implements IReduction
   {
       
      
      public function NullReduction()
      {
         super();
      }
      
      public function reduce(param1:BigInteger) : void
      {
      }
      
      public function revert(param1:BigInteger) : BigInteger
      {
         return param1;
      }
      
      public function mulTo(param1:BigInteger, param2:BigInteger, param3:BigInteger) : void
      {
         param1.bi_internal::multiplyTo(param2,param3);
      }
      
      public function convert(param1:BigInteger) : BigInteger
      {
         return param1;
      }
      
      public function sqrTo(param1:BigInteger, param2:BigInteger) : void
      {
         param1.bi_internal::squareTo(param2);
      }
   }
}
