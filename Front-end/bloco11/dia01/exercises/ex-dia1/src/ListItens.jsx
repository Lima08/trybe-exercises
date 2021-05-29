import React from 'react';


class ListItens extends React.Component {
  constructor(){
    super();
    this.task = this.task.bind(this);
  };
   
  task(value) {
    return (
      <li>{value}</li>
    );
  };

  render() {
    const { value } = this.props;
    return (
      value.map(li => this.task(li))
    );
  };
};

export default ListItens;