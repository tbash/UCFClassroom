import Colors from'./Colors'
// import PureRender from './PureRender'
import Radium from 'radium'
import {Component} from 'react'

export default Radium
// export default PureRender
class Spinner extends Component {
  render(): any {
    return (
      <div style={styles.root}>
        <div style={styles.inner} />
      </div>
    );
  }
}

const pulseKeyframes = Radium.keyframes({
  '0%': {width: '10%'},
  '50%': {width: '50%'},
  '100%': {width: '10%'},
});

const styles = {
  root: {
    left: 0,
    position: 'fixed',
    top: 0,
    width: '100%',
    zIndex: 10000,
  },

  inner: {
    animation: pulseKeyframes + ' 3s ease 0s infinite',
    background: Colors.accent,
    height: '4px',
    margin: '0 auto',
  },
};

export default Spinner
