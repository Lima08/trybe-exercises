import React from 'react';
import Pokemon from './Pokemon';
import './Pokedex.css'

class Pokedex extends React.Component {
  render() {
    const test = this.props.data;
    return (
      <div >
        <h1 className="Pokedex">Pokedéx</h1>
        <div className="Pokemons">
          {test.map(pokemon => <Pokemon data={pokemon} key={pokemon.id}/>)}
        </div>
      </div>
    );
  };
};

export default Pokedex;