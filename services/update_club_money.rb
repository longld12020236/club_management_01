class UpdateClubMoney
  def initialize event, club
    @event= event
    @club = club
  end

  def update_money
    if @event.event_category_id == Settings.spend && @event.is_finish?
      @club.money -= @event.expense
    elsif @event.event_category_id == Settings.consum && @event.is_finish?
      @club.money += @event.expense
    end
    @club.save
  end

end
