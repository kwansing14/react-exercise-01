import React, { Component } from 'react';
import './button.css'

class ButtonIn extends React.Component {

  clickClockIn() {
    this.props.liftButtonIn()
  }

  render() {
    return (
      <div>
        <button className='buttonclock' onClick={()=>{this.clickClockIn()}}>ClockIn</button>
      </div>
    );
  }
}

export default ButtonIn;