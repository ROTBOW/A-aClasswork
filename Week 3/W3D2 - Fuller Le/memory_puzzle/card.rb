class Card

    def initialize(face)
        @face = face
        @hidden = true
    end

    def face
        return @face unless @hidden
        " "
    end

    def hide
        @hidden = true
    end

    def reveal
        @hidden = false
    end

    def ==(other_card)
        # self_card = facedown?(self)
        # other = facedown?(other_card)
        raise 'a card is facedown!' if facedown?(self) || facedown?(other_card)
        self.face == other_card.face
    end

    def facedown?(card)
        card.face == ' '
    end

    def cheat 
      @face 
    end



end