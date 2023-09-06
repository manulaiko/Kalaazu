package org.osmf.metadata
{
   public class NonSynthesizingMetadata extends Metadata
   {
       
      
      private var _synthesizer:MetadataSynthesizer;
      
      public function NonSynthesizingMetadata()
      {
         this._synthesizer = new NullMetadataSynthesizer();
         super();
      }
      
      override public function get synthesizer() : MetadataSynthesizer
      {
         return this._synthesizer;
      }
   }
}
