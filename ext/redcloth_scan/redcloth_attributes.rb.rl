# 
# redcloth_attributes.rb.rl
# 
# Copyright (C) 2009 Jason Garber
# 

%%{

  machine redcloth_attributes;
  include redcloth_common "redcloth_common.rb.rl";
  include redcloth_attributes "redcloth_attributes.rl";

}%%

module RedCloth
  class RedclothAttributes < BaseScanner
    class << self
      def redcloth_attribute_parser(machine, data)
        @data = data
        @regs = {}
        @p = 0
        @pe = @data.length

        %% write init; #%

        cs = machine

        %% write exec; #%

        return @regs
      end

      def redcloth_attributes(str)
        self.cs = self.redcloth_attributes_en_inline
        return redcloth_attribute_parser(cs, str)
      end

      def redcloth_link_attributes(str)
        self.cs = self.redcloth_attributes_en_link_says;
        return redcloth_attribute_parser(cs, str)
      end
    end
    
    %%{
      variable data  @data;
      variable p     @p;
      variable pe    @pe;
      variable cs    @cs;
      variable ts    @ts;
      variable te    @te;

      write data nofinal;
    }%%
    
  end
end