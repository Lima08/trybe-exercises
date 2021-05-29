import React from 'react';
import PropTypes from 'prop-types';
import './Pokemon.css';

class Pokemon extends React.Component {
  render() {
    const { name, type, averageWeight, image } = this.props.data;

    return (
     <div className="pokemon">
        <div className="infos"> 
          <p>{name}</p>
          <p>{type} </p>
          <p>average Weight: {averageWeight.value}{averageWeight.measurementUnit}</p>
        </div>
        <img className="image" src={image} alt={name}/>
     </div>
    );
  };
};

Pokemon.propTypes = {
  name: PropTypes.string,
  type: PropTypes.string,
  averageWeight: PropTypes.exact({
      value: PropTypes.number,
      measurementUnit: PropTypes.string
  }),
  image: PropTypes.string,
};

export default Pokemon;
