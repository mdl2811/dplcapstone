import React, { Component } from 'react';
import { connect } from 'react-redux';
import { validateToken } from '../actions/auth';

class FetchUser extends Component {
  state = { loaded: false };

  componentDidMount() {
    let { isAuthenticated, dispatch } = this.props;
    if(isAuthenticated)
      this.loaded();
    else {
      dispatch(validateToken(this.loaded));
    }
  }

  componentWillReceiveProps() {
    if (!this.state.loaded)
      this.loaded()
  }


  loaded = () => {
    this.setState({ loaded: true });
  }

  render() {
    // if you have HOC the children are the components nested under the HOC
    return this.state.loaded ? this.props.children : null
  }
}

const mapStateToProps = (state) => {
  return { isAuthenticated: state.user.id };
}

export default connect(mapStateToProps)(FetchUser);
