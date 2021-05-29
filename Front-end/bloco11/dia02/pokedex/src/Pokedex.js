import data from './data';
import React from 'react';
import Pokemon from './Pokemon';

class Pokedex extends React.Component {
  render() {
    const test = this.props.data;
    return (
      <div>
        {test.map(pokemon => <Pokemon data={pokemon} key={pokemon.id}/>)}
      </div>
    );
  };
};

export default Pokedex;