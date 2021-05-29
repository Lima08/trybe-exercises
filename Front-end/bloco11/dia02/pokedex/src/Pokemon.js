import data from './data';
import React from 'react';

class Pokemon extends React.Component {
  render() {
    const { name, type, averageWeight, image } = this.props.data;

    return (
     <div>
        <div> 
        <p>{name}</p>
        <p>{type} </p>
        <p>{averageWeight.value}{averageWeight.measurementUnit}</p>
        </div>
        <img src={image} alt={name}/>
     </div>
    );
  };
};

export default Pokemon;
