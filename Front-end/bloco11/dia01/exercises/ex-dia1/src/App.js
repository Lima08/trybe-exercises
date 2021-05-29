import React from 'react';
import ListItens from './ListItens';


const list = ['Estudar', 'Correr', 'Amar'];

class App extends React.Component {
  render(){
    return (
      <ol>
        < ListItens value={list}/>
      </ol>
    )

  }
}

export default App;
