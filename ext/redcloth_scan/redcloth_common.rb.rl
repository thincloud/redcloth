%%{
  
  machine redcloth_common;
  include redcloth_common "redcloth_common.rl";
  
  action esc { rb_str_cat_escaped(block, ts, te); }
  action esc_pre { rb_str_cat_escaped_for_preformatted(block, ts, te); }
  action ignore { block << self.ignore(regs); }
  
  # conditionals
  action starts_line {
    p == 0 || data[(p-1), 1] == "\r" || data[(p-1), 1] == "\n" || data[(p-1), 1] == "\f"
  }
  action starts_phrase {
    p == 0 || data[(p-1), 1] == "\r" || data[(p-1), 1] == "\n" || data[(p-1), 1] == "\f" || data[(p-1), 1] == " "
  }
  
}%%;