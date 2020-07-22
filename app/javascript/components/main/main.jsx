import React, { Component } from 'react';
import './main.css';

import ButtonIn from '../button/buttonIn';
import ButtonOut from '../button/buttonOut';
import ButtonLoading from '../button/buttonLoading';

import axios from 'axios';
import moment from 'moment';
class App extends React.Component {
  constructor() {
    super()
    this.state = {
      location: 'Singapore',
      clockin: '-',
      clockout: '-',
      username: 'John',
      jobtitle: 'Barista',
      loading: false
    }
    console.log("constructor")
    // set start
    axios.get('/clockins.json')
      .then((response) => {
        //thing to do after
        let latestDate = response.data[response.data.length-1].created_at
        let latestDate2 = moment(latestDate).format('LTS')
        this.setState({ clockin: latestDate2})
        this.componentDidMount()
      }).catch((error) => {
        console.log(error)
      })

    axios.get('/clockouts.json')
      .then((response) => {
        //thing to do after
        let latestDate = response.data[response.data.length-1].created_at
        let latestDate2 = moment(latestDate).format('LTS')
        this.setState({ clockout: latestDate2})
        this.componentDidMount()
      }).catch((error) => {
        console.log(error)
      })
  }

  // when clockin
  liftButtonIn(){
    //after click, do a post
    this.loading()
    axios.post('/clockins.json',{
      location: this.state.location,
      user_id: '1'
    })
    .then((response) => {
      //after post, get data to update state
      axios.get('/clockins.json')
      .then((response) => {
        let latestDate = response.data[response.data.length-1].created_at
        let latestDate2 = moment(latestDate).format('LTS')
        this.setState({ loading: false })
        this.setState({ clockin: latestDate2})
        this.componentDidMount()
      }).catch((error) => {
        console.log(error)
      })
    })
    .catch((error) => {
      console.log(error)
    });
  }

  // when clockout
  liftButtonOut(){
    console.log('this')
    this.loading()
    //after click, do a post
    axios.post('/clockouts.json',{
      location: this.state.location,
      user_id: '1'
    })
    .then((response) => {
      //after post, get data to update state
      console.log(response.data)
      axios.get('/clockouts.json')
      .then((response) => {
        console.log(response.data)
        let latestDate = response.data[response.data.length-1].created_at
        let latestDate2 = moment(latestDate).format('LTS')
        this.setState({ loading: false })
        this.setState({ clockout: latestDate2})
      }).catch((error) => {
        console.log(error)
      })
    })
    .catch((error) => {
      console.log(error)
    });
  }

  loading(){
    this.setState({loading: true})
  }

  componentDidMount(){
    console.log("DID MOUNT")
    if (this.state.clockin >= this.state.clockout) {
      this.setState({ clockout: '-' })
    }
  }

  render() {
    console.log('rendering')

    //display current date
    let dateNow = moment(Date.now()).format('L')
    console.log(this.state.clockin)

    // default is clockin, if clockin > clockout, display button out
    let button = (<ButtonIn liftButtonIn={()=>{this.liftButtonIn()}}/>);
    if (this.state.clockin > this.state.clockout) {
      button = (<ButtonOut liftButtonOut={()=>{this.liftButtonOut()}}/>)
    }
    if (this.state.loading === true) {
      console.log('loading')
      button = (<ButtonLoading/>)
    }

    return (
      <div>
        <div className='top'>
          <div className='col'>
            <div className='jobtitle'>
              {this.state.jobtitle}
            </div>
            <div className='username'>
              {this.state.username}
            </div>
          </div>
          <div className='col'>
            <div className='date'>
              {dateNow}
            </div>
            <div className='location'>
              {this.state.location}
            </div>
          </div>
        </div>

        <div className='clockbody'>
          <div className='clockin'>
            Clock In:
            <br/>
            {this.state.clockin}
          </div>
          <div className='clockout'>
            Clock Out:
            <br/>
            {this.state.clockout}
          </div>
        </div>
        <div>
          {button}
        </div>
      </div>
    );
  }
}

export default App;