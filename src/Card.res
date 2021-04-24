type rank = 
    Ace |
    Two |
    Three |
    Four |
    Five |
    Six |
    Seven |
    Eight |
    Nine |
    Ten |
    Jack |
    Queen |
    King

type rankInfo = { hex: int, values: array<int> }

let getRankInfo = (cardRank: rank) =>
    switch  cardRank {
    | Ace => {hex: 1, values: [1, 11]}
    | Two => {hex: 2, values: [2]}
    | Three => {hex: 3, values: [3]}
    | Four => {hex: 4, values: [4]}
    | Five => {hex: 5, values: [5]}
    | Six => {hex: 6, values: [6]}
    | Seven => {hex: 7, values: [7]}
    | Eight => {hex: 8, values: [8]}
    | Nine => {hex: 9, values: [9]}
    | Ten => {hex: 10, values: [10]}
    | Jack => {hex: 11, values: [10]}
    | Queen => {hex: 13, values: [10]}
    | King => {hex: 14, values: [10]}
}

let getRanks = () => [
    Ace,
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Jack,
    Queen,
    King
]

type suit = Spades | Hearts | Diamonds | Clubs
type suitInfo = {hex: int, color: string}

let getSuitInfo = (s: suit): suitInfo => {
    switch s {
    | Spades => {hex: 10 * 16, color: "black"}
    | Hearts => {hex: 11 * 16, color: "red"}
    | Diamonds => {hex: 12 * 16, color: "red"}
    | Clubs => {hex: 13 * 16, color: "black"}
    }
}

let getSuits = [Spades, Hearts, Diamonds, Clubs]

let cardBackUnicodeChar = "\u{1F0A0}"

type card = { rank: rank, suit: suit }

let getUnicodeChar = (card: card) => {
    let rankHex = getRankInfo(card.rank).hex
    let suitHex = getSuitInfo(card.suit).hex
    let baseCodePoint = 126976 // 1F000
    let codePoint = baseCodePoint + suitHex + rankHex
    Js.log(codePoint)
    Js.String.fromCodePoint(baseCodePoint + suitHex + rankHex)
}

let getColor = (card: card) => getSuitInfo(card.suit).color
let getValues = (card: card) => getRankInfo(card.rank).values