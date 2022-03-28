module HandsHelper
  def as_view_suit(card)
    {
      'C' => 'clubs',
      'D' => 'diams',
      'H' => 'hearts',
      'S' => 'spades'
    }[card.suit]
  end

  def as_view_rank(card)
    card.rank.gsub('T', '10').downcase
  end
end