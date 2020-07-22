import React, { Component } from 'react';

class ButtonOut extends React.Component {

  clickClockOut() {
    this.props.liftButtonOut()
  }

  render() {
    return (
      <div>
        <button className='buttonclock' onClick={()=>{this.clickClockOut()}}>ClockOut</button>
      </div>
    );
  }
}

export default ButtonOut;