type deck = array<Card.card>

let newDecks = (numberOfDecks: int): deck => 
    if(numberOfDecks < 1) {
        Js.Console.error(`Number of decks ${numberOfDecks} but it needs to be greater than zero`)
        []
    } else {
        let cards = []
        for deck in 1 to numberOfDecks {
            for rank in Card.getRanks() {
                for suit in Card.getSuits() {
                    Js.Array2.push(cards, {rank, suit})
                }
            }
        }
        cards
    }

let shuffle = (cards: deck): deck => {
    let arrayLength = Js.Array2.length(cards)
    if arrayLength <= 1 {
        cards
    } else {
        let newDeck = Js.Array2.copy(cards)
        for i in (arrayLength -1) downto 0 {
            let j = Js.Math.random_int(0,i)
            let tempI = newDeck[i]
            newDeck[i] = newDeck[j]
            newDeck[j] = tempI
        }
        newDeck
    }
}

let deal = (fromArray: deck, toArray: deck): option<(deck, deck)> => 
    Belt.Option.map(Js.Array2.pop(fromArray), v => {
        Js.Array2.push(toArray, v)
        (fromArray, toArray)
    })
    
let getValues = (cards: deck): Belt.HashSetInt.hashSetInt => {
    let rec f = (cards: deck, index: int) => 
        if index >= Js.Array2.length(deck) {
            Belt.HashSetInt.make(~hitSize=1)
        } else {
            let allValues = Belt.HashSetInt.make(~hitSize=7)
            let firstCard = cards[index]
            for v in Card.getValues(firstCard) {
                let values = f(cards, index + 1)
                for vv in values {
                    Belt.HashSetInt.add(allValues, v + vv)
                }
            }
            allvalues
        }
    f(cards, 0)
}
