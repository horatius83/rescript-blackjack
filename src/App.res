%%raw(`import './App.css';`)

@bs.module("./logo.svg") external logo: string = "default"

@react.component
let make = () => {
  let card: Card.card = {rank: Card.Ace, suit: Card.Spades}
  <div className="App">
    <Test />
    <CardComponent card={card}/>
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>
        {React.string("Edit ")}
        <code> {React.string("src/App.js")} </code>
        {React.string(" and save to reload.")}
      </p>
      <a
        className="App-link"
        href="https://reactjs.org"
        target="_blank"
        rel="noopener noreferrer">
        {React.string("Learn React")}
      </a>
    </header>
  </div>
}
