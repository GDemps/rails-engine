class Revenue
  attr_reader :total_revenue, :id
  def initialize(total_revenue)
    @total_revenue = total_revenue
    @id = 1
  end
end
