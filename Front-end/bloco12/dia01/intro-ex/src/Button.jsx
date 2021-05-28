import React from 'react';
import './Button.css';


class Button extends React.Component {
  constructor() {
    super();
    this.state = {
      click1: 0,
    };

    this.onClick1 = this.onClick1.bind(this);
  };

  onClick1(event) {
    this.setState((previousState, _props)=> ({
      click1: previousState.click1 + 1
    }));

    if ((this.state.click1 % 2) !== 0) {
      
    }
  };
  
  render() {
    return (
      <div className="buttonsDiv">
        <button className="button"onClick={this.onClick1}>{this.state.click1}</button>
      </div>
    );
  };
};

export default Button;