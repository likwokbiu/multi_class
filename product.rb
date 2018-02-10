class Product
  TAX_STANDARD = 13 # tax class == "std"
  TAX_EXEMPT = 0 # tax class == "exm"
  TAX_IMPORTED = 20 # tax class == "imp"

  def initialize(name, base_price, tax_class)
    @name = name
    @base_price = base_price
    @tax_class = tax_class
  end

  def name
    return @name
  end

  def base_price
    return @base_price
  end

  def tax_class
    return @tax_class
  end

  def tax_rate
    case @tax_class
    when "std" then return TAX_STANDARD
    when "exm" then return TAX_EXEMPT
    when "imp" then return TAX_IMPORTED
    else return 0
    end

  end

  def total_price
    return (@base_price * (1 + (self.tax_rate / 100.0 )))
  end

end
