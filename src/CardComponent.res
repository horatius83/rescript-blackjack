@react.component
let make = (~card: Card.card) => {
    let cardDisplay = Card.getUnicodeChar(card)
    <>
        <h1>{React.string("Card")}</h1>
        <span>{React.string(cardDisplay)}</span>
    </>
}